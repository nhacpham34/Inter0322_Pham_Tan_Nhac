
<%--
  Created by IntelliJ IDEA.
  User: nhacp
  Date: 3/30/2022
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql " %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="view/head.jsp" />
<title>EditCustomer</title>
<body>
<div class="app">
    <jsp:include page="view/header.jsp" />
    <div class="container">
        <div id="" class="row">
                <!--          Form thêm khách hàng              -->
                <form class="form_input display-block" action="/showCustomer" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${customer.id}">
                    <h2 class="text-center">Chỉnh sửa khách hàng</h2>
                    <div class="form-group form_input row ">
                        <label for="inputName" class="col-sm-2 col-form-label">Họ Tên:</label>
                        <div class="col-sm-4">
                            <input type="text" name="name" value="${customer.name}" class="form-control" id="inputName" placeholder="Nhập họ tên khách hàng">
                        </div>
                        <label for="labelSex" class="col-sm-2 col-form-label">Giới tính:</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="sex" value="${customer.sex}" id="labelSex">
                                <option value="1">Nam</option>
                                <option value="0">Nữ</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group form_input row">
                        <label for="inputIdCard" class="col-sm-2 col-form-label">CMND/CCCD:</label>
                        <div class="col-sm-4">
                            <input type="text" name="idCard" value="${customer.idCard}" class="form-control" id="inputIdCard" placeholder="Nhập CMND..">
                        </div>
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email:</label>
                        <div class="col-sm-4">
                            <input type="email" name="email" value="${customer.email}" class="form-control" id="inputEmail" placeholder="Nhập Email...">
                        </div>
                    </div>
                    <div class="form-group form_input row">
                        <label for="inputDate" class="col-sm-2 col-form-label">Ngày sinh:</label>
                        <div class="col-sm-4">
                            <input type="date" name="dateOfBirth" value="${customer.dateOfBirth}"  class="form-control" id="inputDate" placeholder="Nhập ngày sinh...">
                        </div>
                        <label for="inputSdt" class="col-sm-2 col-form-label">Số điện thoại:</label>
                        <div class="col-sm-4">
                            <input type="tel" name="sdt" value="${customer.sdt}"  class="form-control" id="inputSdt" placeholder="Nhập số điện thoại...">
                        </div>
                    </div>
                    <div class="form-group form_input row">

                        <label for="inputCustomerType" class="col-sm-2 col-form-label">Loại khách:</label>
                        <div class="col-sm-3">
                            <select name="typeCustomer"  class="form-control" id="inputCustomerType">
                                <option value="1">Diamond</option>
                                <option value="2">Platinium</option>
                                <option value="3">Gold</option>
                                <option value="4">Silver</option>
                                <option value="5">Member</option>
                            </select>
                        </div>
                        <label for="inputAddress" class="col-sm-2 col-form-label">Địa chỉ:</label>
                        <div class="col-sm-5">
                            <input type="text" name="address" value="${customer.address}" class="form-control" id="inputAddress" placeholder="Nhập Địa chỉ...">
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary">Edit</button>
                </form>
        </div>
    </div>
    <jsp:include page="view/footer.jsp" />
</div>
</body>
</html>
