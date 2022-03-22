use Furama_manager;

-- câu 1:
-- câu 2:
select 	* 
from 	nhan_vien
where 	ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and length(ho_ten) < 16;

-- câu 3: 
select 	* 
from 	khach_hang
where 	(YEAR(CURDATE())-YEAR(ngay_sinh)) >= 18 
		and (YEAR(CURDATE())-YEAR(ngay_sinh)) <= 50
		and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị' ;
    
-- câu 4:
SELECT 	hop_dong.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) AS so_lan_dat_phong 
FROM 	hop_dong , khach_hang
WHERE 	hop_dong.ma_khach_hang = khach_hang.ma_khach_hang and khach_hang.ma_loai_khach = 1
GROUP BY hop_dong.ma_khach_hang
ORDER BY so_lan_dat_phong ASC;
-- câu 5:
Select khach_hang.ma_khach_hang, khach_hang.ho_ten,
		loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, 
        dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong, 
        hop_dong.ngay_ket_thuc , sum(dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia)) as tong
from 	khach_hang 
left join 	hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join 	loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join 	dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join 	hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join 	dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by 	khach_hang.ma_khach_hang;
 
-- câu 6:
select 	dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, sum(dich_vu.dien_tich_ho_boi) as dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu  
from 	dich_vu 
inner join 	loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
inner join 	hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where 		dich_vu.ma_dich_vu not in
			(select ma_dich_vu from hop_dong 
			where 	yearweek(ngay_ket_thuc) > 202101 
					and yearweek(ngay_ket_thuc) < 202115)
			group by dich_vu.ma_dich_vu;

-- câu 7

select 	dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich_ho_boi as dien_tich, dich_vu.so_nguoi_toi_da , dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu  
from 	dich_vu 
inner join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
inner join hop_dong on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where 	dich_vu.ma_dich_vu in
		(select ma_dich_vu from hop_dong 
		where  year(ngay_lam_hop_dong) = 2020
				and ma_dich_vu not in 
                (select ma_dich_vu from hop_dong 
				where  year(ngay_lam_hop_dong) = 2021)
		group by ma_dich_vu )
group by dich_vu.ma_dich_vu;

-- câu 8 
 -- cách 1:
select	 DISTINCT ho_ten 
from 	khach_hang ;
 -- cách 2:
select 	ho_ten 
from 	khach_hang 
group by ho_ten;
-- câu 9 
 select 	month(ngay_lam_hop_dong) as thang, 
			count(month(ngay_lam_hop_dong)) as so_luong_khach_hang
 from 		hop_dong
 where  
			year(ngay_lam_hop_dong) = 2021
 group by 
			month(ngay_lam_hop_dong)
 order by 
			month(ngay_lam_hop_dong);
        
-- câu 10:
select 	hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc,
		sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from 	hop_dong
left join 	hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
group by 	hop_dong.ma_hop_dong;

-- câu 11
select 	dich_vu_di_kem.ma_dich_vu_di_kem , ten_dich_vu_di_kem
from 	hop_dong 
inner join 	khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
inner join 	hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
inner join 	dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where	khach_hang.ma_loai_khach = 1
		and khach_hang.dia_chi like '%Vinh' 
        or khach_hang.dia_chi like '%Quảng Ngãi';
 
 
 -- câu 12 
 select 	hop_dong.ma_hop_dong, nhan_vien.ho_ten, khach_hang.ho_ten 
			, khach_hang.so_dien_thoai as sdt_khach_hang, hop_dong.ma_dich_vu
			, dich_vu.ten_dich_vu ,sum(hop_dong_chi_tiet.so_luong) as so_luong ,hop_dong.tien_dat_coc
 from 		hop_dong
 inner join 	khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
 inner join 	nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
 inner join 	dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
 left join 		hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 where 		year(ngay_lam_hop_dong) = 2020 
			and month(ngay_lam_hop_dong) > 9 
			and month(ngay_lam_hop_dong) <= 12 
			and hop_dong.ma_hop_dong not in (
				select 	ma_hop_dong 
                from 	hop_dong 
				where 	year(ngay_lam_hop_dong) = 2021 
						and month(ngay_lam_hop_dong) >= 1 
                        and month(ngay_lam_hop_dong) <= 6  
                        )
 group by 	hop_dong.ma_hop_dong;
 -- câu 13
 
select 	dich_vu_di_kem.ma_dich_vu_di_kem 
		, ten_dich_vu_di_kem
		,so_luong_dich_vu_di_kem
from 	(		
			select 		ma_dich_vu_di_kem ,
						sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
			from 		hop_dong 
			inner join 	hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
			group by 	ma_dich_vu_di_kem) as max1 
inner join (select max(max2.so_luong_dich_vu_di_kem) as max from (select 	ma_dich_vu_di_kem 
		,sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
		from 	hop_dong  
		inner join 	hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
		group by 	ma_dich_vu_di_kem ) as max2 ) as max3 on max3.max = max1.so_luong_dich_vu_di_kem
inner join dich_vu_di_kem on  max1.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem;

-- câu 14:

select * 
from	(
		select 	hop_dong.ma_hop_dong, loai_dich_vu.ten_loai_dich_vu
				, dich_vu_di_kem.ten_dich_vu_di_kem 
                , count(dich_vu_di_kem.ma_dich_vu_di_kem) as so_lan_su_dung
		from 	hop_dong 
		inner join 	dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
		inner join 	loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
		inner join 	hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
		inner join 	dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
		group by 	dich_vu_di_kem.ma_dich_vu_di_kem 
		) as hello

where 	so_lan_su_dung =1
order by 	ma_hop_dong;


-- câu 15
select 	nhan_vien.ma_nhan_vien, ho_ten, trinh_do.ten_trinh_do
		, bo_phan.ten_kieu_thue, so_dien_thoai, dia_chi  
from 	nhan_vien 
inner join	(
			select  ma_nhan_vien, count(ma_nhan_vien) as so_hop_dong from hop_dong
			where 	year(ngay_lam_hop_dong) >= 2020 
					and year(ngay_lam_hop_dong) <= 2021
			group by ma_nhan_vien
            ) as hello
			on hello.ma_nhan_vien = nhan_vien.ma_nhan_vien
inner join 	trinh_do on trinh_do.ma_trinh_do = nhan_vien.ma_trinh_do
inner join 	bo_phan on bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
where 	hello.so_hop_dong <=3;
    
-- câu 16
delete 	from 	nhan_vien
where	(
		select 	ma_nhan_vien 
        from 	nhan_vien 
		where 	ma_nhan_vien not in	(
				select 	ma_nhan_vien 
                from 	hop_dong
				where 	year(ngay_lam_hop_dong) >=2019 
                and year(ngay_lam_hop_dong) <= 2021
				)
		);
-- câu 17
	update 	khach_hang
    set 	ma_loai_khach = 1
    where 	ma_khach_hang in (
					select 	khach_hang.ma_khach_hang 
                    from 	khach_hang
					inner join (
							select 	ma_khach_hang, sum(dich_vu.chi_phi_thue) as tong_thanh_toan 
                            from 	hop_dong
							inner join 	dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
							where 	year(ngay_ket_thuc) = 2021
							group by	 ma_khach_hang
                            ) as hello
					on hello.ma_khach_hang = khach_hang.ma_khach_hang
					where 	khach_hang.ma_loai_khach = 2 
							and hello.tong_thanh_toan >= 10000000
					);
-- câu 18: 
	delete 	from 	khach_hang
    where	ma_khach_hang = (
			select 	ma_khach_hang 
            from 	hop_dong 
			where 	year(ngay_ket_thuc) < 2021
			);
    
    -- câu 19: 
    update 	dich_vu_di_kem
    set 	gia = gia*2
    where	ma_dich_vu_di_kem in(
					select 	hello.ma_dich_vu_di_kem 
                    from 	dich_vu_di_kem inner join	(
								select  hop_dong_chi_tiet.ma_dich_vu_di_kem 
										,sum(hop_dong_chi_tiet.so_luong) as so_lan
								from 	hop_dong
								inner join 	hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
								where 		year(hop_dong.ngay_ket_thuc) = 2020
								group by 	hop_dong_chi_tiet.ma_hop_dong_chi_tiet
                                )as hello
					on dich_vu_di_kem.ma_dich_vu_di_kem = hello.ma_dich_vu_di_kem
					where hello.so_lan >= 10
					);
    
    -- câu 20: union all
    select 	ma_nhan_vien as id, ho_ten
			, email, so_dien_thoai, ngay_sinh, dia_chi  
	from 	nhan_vien 
    union all
    select 	ma_khach_hang, ho_ten, email
			, so_dien_thoai, ngay_sinh, dia_chi 
	from khach_hang
    
    