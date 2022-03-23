use furama_manager;

-- câu  21:
CREATE VIEW v_nhan_vien AS
SELECT nhan_vien.ma_nhan_vien , ho_ten, dia_chi
FROM nhan_vien
inner join hop_dong on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
WHERE nhan_vien.dia_chi like '%Liên Chiểu%' and date_format(hop_dong.ngay_lam_hop_dong, '%d/%m/%Y') = '12/12/2019';

-- câu 22:
update v_nhan_vien
set dia_chi = 'Liên Chiểu';

-- câu 23:
delimiter //
create procedure sp_xoa_khach_hang(p_key_work int)
begin 
	if (p_key_work in (select ma_khach_hang from hop_dong )) then
		delete from  hop_dong_chi_tiet
        where hop_dong_chi_tiet.ma_hop_dong in 	
						(select hdct.ma_hop_dong from (select * from hop_dong_chi_tiet ) as hdct
						inner join hop_dong on hop_dong.ma_hop_dong = hdct.ma_hop_dong
                        where hop_dong.ma_khach_hang = p_key_work);
		delete from hop_dong
		where ma_khach_hang = p_key_work;
		delete from khach_hang
		where ma_khach_hang = p_key_work;
        
	else SELECT  CONCAT('Mã khách hàng: ', p_key_work, 'không tồn tại!!!') AS 'ERROR';
    end if;
end; // 
delimiter ;

CALL sp_xoa_khach_hang(1);


-- câu 24. Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với 
-- yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc
-- không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong(
	 out p_ma_hop_dong int,
     in p_ngay_lam_hop_dong date,
     in p_ngay_ket_thuc date,
     in p_tien_dat_coc double,
      in  p_ma_dich_vu int,
      in p_ma_khach_hang int,
      in p_ma_nhan_vien int
)
begin 
	set p_ma_hop_dong = (select  max(ma_hop_dong)from hop_dong) + 1;
	if 	(p_ma_dich_vu in (select ma_dich_vu from dich_vu) 
		and p_ma_khach_hang in (select ma_khach_hang from khach_hang) 
        and p_ma_nhan_vien in (select ma_nhan_vien from nhan_vien)) then
			insert into hop_dong (ma_hop_dong,	ngay_lam_hop_dong,	ngay_ket_thuc,	tien_dat_coc,	ma_nhan_vien,	ma_khach_hang,	ma_dich_vu)
			values (p_ma_hop_dong,	p_ngay_lam_hop_dong,	p_ngay_ket_thuc,	p_tien_dat_coc,	p_ma_nhan_vien,	p_ma_khach_hang,	p_ma_dich_vu);
	else  SELECT  CONCAT('Kiểm tra lại các giá trị ', 'mã dịch vụ: ' ,p_ma_dich_vu, ' Mã khách hàng: ',p_ma_khach_hang,' Mã nhân viên: ', p_ma_nhan_vien, ' không tồn tại!!!') AS 'ERROR';
    end if;
end; // 
delimiter ;
call sp_them_moi_hop_dong(
	@idy, '2022-07-22', '2022-08-21', 200000, 1,2,3
) ;

-- câu 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong 
-- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

delimiter // 
create trigger tr_xoa_hop_dong 
	after delete
    on hop_dong for each row 
begin
	DECLARE so_hop_dong int ;
    DECLARE `error` varchar(50) ;
    set so_hop_dong = (select count(hd.ma_hop_dong) from (select * from hop_dong) as hd );
    set `error` = (select concat('so hop dong con lai la: ', so_hop_dong));
    -- SIGNAL SQLSTATE '00000' SET MESSAGE_TEXT = `error`;
    SELECT `error` AS LOG INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/log.txt';
end ; //
delimiter ;

delete from hop_dong
where hop_dong.ma_hop_dong = 12;
drop trigger tr_xoa_hop_dong

-- câu 26: Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng,
-- cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau:
-- Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.--
-- Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo
-- “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.


delimiter // 
create trigger tr_cap_nhat_hop_dong 
	before update
    on hop_dong for each row 
begin
	DECLARE so_ngay_chenh_lenh int ;
    set so_ngay_chenh_lenh = (SELECT DATEDIFF( new.ngay_ket_thuc , old.ngay_lam_hop_dong));
	if so_ngay_chenh_lenh < 2 then 
     SIGNAL SQLSTATE '04500' SET MESSAGE_TEXT = "Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày";
    end if;
end ; //
delimiter ;

update  hop_dong
set ngay_ket_thuc = '2022-12-12'
where ma_hop_dong = 10;

-- câu 27: a Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
delimiter //
create function func_dem_dich_vu()
returns int
deterministic
begin
	declare total int;
    set total = (select count(dich_vu.ma_dich_vu) from hop_dong 
    inner join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
    where dich_vu.chi_phi_thue > 2000000);
	return total;
end;
// delimiter ;
select func_dem_dich_vu()


-- câu 27 b.Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc 
-- bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ 
-- (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng).
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.

delimiter //
create function func_tinh_thoi_gian_hop_dong(f_ma_kh int)
returns int
deterministic
begin
	declare days int;
    set days = (select MAX(DATEDIFF( ngay_ket_thuc , ngay_lam_hop_dong)) as ngay_dai_nhat
				from hop_dong where ma_khach_hang = f_ma_kh);
	return days;
end;
// delimiter ;

select func_tinh_thoi_gian_hop_dong(4);


-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng 
-- với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó
-- (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan
-- (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác

delimiter //
create procedure sp_xoa_dich_vu_va_hd_room()
begin 
	declare loai_dich_vu_xoa  int;
    set loai_dich_vu_xoa = (select ma_loai_dich_vu from loai_dich_vu where ten_loai_dich_vu = 'Room');
	delete from hop_dong 
    where ma_hop_dong in (
	select ma_hop_dong from (select * from hop_dong) as hd
    inner join dich_vu on hd.ma_dich_vu = dich_vu.ma_dich_vu
    where 	dich_vu.ma_loai_dich_vu = (select ma_loai_dich_vu from loai_dich_vu where ten_loai_dich_vu = 'Room')
			and year(hd.ngay_ket_thuc) >= 2015
            and year(hd.ngay_ket_thuc) <= 2025 );
	delete from dich_vu
    where ma_loai_dich_vu = (select ma_loai_dich_vu from loai_dich_vu where ten_loai_dich_vu = 'Room');
end; // 
delimiter ;  

call sp_xoa_dich_vu_va_hd_room();



