<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 3/30/2022
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql " %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="view/head.jsp" ></jsp:include>
</head>
<body>
<div class="app">
    <jsp:include page="view/header.jsp" />
    <div class="container">
                <!--        Form chỉnh sửa nhân viên        -->
                <form class="form_input display-block" method="post" action="/showEmployee">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${employee.id}">
                    <h2 class="text-center">Chỉnh sửa nhân viên</h2>
                    <div class="form-group form_input row ">
                        <label for="inputNameEpl" class="col-sm-2 col-form-label">Họ Tên:</label>
                        <div class="col-sm-4">
                            <input type="text" name="name" value="${employee.name}" class="form-control" id="inputNameEpl" placeholder="Nhập họ tên nhân viên">
                        </div>
                        <label for="inputDateEpl" class="col-sm-2 col-form-label">Ngày sinh:</label>
                        <div class="col-sm-4">
                            <input type="date" name="dateOfBirth" value="${employee.dateOfBirth}" class="form-control" id="inputDateEpl" placeholder="Nhập ngày sinh...">
                        </div>
                    </div>
                    <div class="form-group form_input row">
                        <label for="inputIdCardEpl" class="col-sm-2 col-form-label">CMND/CCCD:</label>
                        <div class="col-sm-4">
                            <input type="text" name="idCard" value="${employee.idCard}" class="form-control" id="inputIdCardEpl" placeholder="Nhập CMND..">
                        </div>
                        <label for="inputSdtEpl" class="col-sm-2 col-form-label">Số điện thoại:</label>
                        <div class="col-sm-4">
                            <input type="tel" name="sdt" value="${employee.sdt}" class="form-control" id="inputSdtEpl" placeholder="Nhập số điện thoại...">
                        </div>
                    </div>
                    <div class="form-group form_input row">
                        <label for="inputEmailEpl" class="col-sm-2 col-form-label">Email:</label>
                        <div class="col-sm-4">
                            <input type="email" name="email" value="${employee.email}" class="form-control" id="inputEmailEpl" placeholder="Nhập Email...">
                        </div>
                        <label for="inputEdu" class="col-sm-2 col-form-label">Trình độ:</label>
                        <div class="col-sm-4">
                            <select name="edu" class="form-control" id="inputEdu">
                                <option>--Danh sách lựa chọn--</option>
                                <option value="1">Cao đẳng</option>
                                <option value="2">Đại học</option>
                                <option value="3">Sau đại học</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group form_input row">
                        <label for="inputPosition" class="col-sm-2 col-form-label">Vị trí:</label>
                        <div class="col-sm-3">
                            <select name="position" class="form-control" id="inputPosition">
                                <option>--Danh sách lựa chọn--</option>
                                <option value="1">Quản Lý</option>
                                <option value="2">Nhân viên</option>
                            </select>
                        </div>
                        <label for="inputPriceEpl" class="col-sm-2 col-form-label">Lương:</label>
                        <div class="col-sm-5">
                            <input type="text" name="price" value="${employee.price}" class="form-control" id="inputPriceEpl" placeholder="Nhập Lương...">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Edit Employee</button>
                </form>
    </div>
    <jsp:include page="view/footer.jsp" />
</div>
</body>
</html>
