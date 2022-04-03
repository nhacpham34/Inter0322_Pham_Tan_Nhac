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
<body>
<div class="app">
    <header>
        <div class="header ">
            <div class="header_top">
                <img class="logo_img" src="./image/logo-mona.png">
                <h1 class="resort_name">Furama Resort</h1>
                <h4 class="name"></h4>
            </div>
        </div>
        <nav class=" navbar navbar-expand-lg navbar-light bg-light">
            <!--            Danh sách sản phẩm -->
            <div class="  container-fluid ">
                <div class="collapse navbar-collapse row" id="navbarSupportedContent">
                    <ul class="nav_padding navbar-nav col-8 me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/index.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                               role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Employee
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="/showEmployee">Quản lí nhân viên</a>
                                <a class="dropdown-item" href="/showEmployee?action=create">Thêm nhân viên</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2"
                               role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Customer
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                                <a class="dropdown-item" href="/showCustomer?index=1">Quản lí khách hàng</a>
                                <a class="dropdown-item" href="/showCustomer?action=create">Thêm khách hàng</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Service</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contract</a>
                        </li>
                    </ul>
                    <form class="d-flex col-4" method="post" action="/showCustomer">
                        <input class="form-control me-2" name="txtSearch" type="search" placeholder="Search" aria-label="Search">
                        <input type="hidden" name="action" value="search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>

        </nav>
    </header>
    <div class="container">
        <div id="" class="row">
                <p>${message}</p>
                <%--   hiển thị khách hàng             --%>
                <c:if test="${empty listp}" >
                    <h2 class="text-danger">
                        Không có khách hàng nào!
                        <a href="/showCustomer?action=create">Thêm</a>
                    </h2>
                </c:if>
                <c:if test="${!empty listp}" >
                    <h2 class="text-center">Danh sách khách hàng</h2>
                    <table class="table">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Họ Tên</th>
                            <th scope="col">Ngày sinh</th>
                            <th scope="col">Loại khách</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">SDT</th>
                            <th scope="col">Email</th>
                            <th scope="col">Địa Chỉ</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listp}" var="c" varStatus="loop">
                            <tr id="customer${c.id}">
                                <th scope="row" >${loop.index + 1 + (indexPage-1)*pageSize} </th>
                                <td>${c.name}</td>
                                <td>${c.dateOfBirth}</td>
                                <c:choose>
                                    <c:when test="${c.customerType == 1}">
                                        <td>Diamond</td>
                                    </c:when>
                                    <c:when test="${c.customerType == 2}">
                                        <td>Platinium</td>
                                    </c:when>
                                    <c:when test="${c.customerType == 3}">
                                        <td>Gold</td>
                                    </c:when>
                                    <c:when test="${c.customerType == 4}">
                                        <td>Silver</td>

                                    </c:when>
                                    <c:when test="${c.customerType == 5}">
                                        <td>Menber</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>Khác</td>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${c.sex == 1}">
                                        <td>Nam</td>
                                    </c:when>
                                    <c:when test="${c.sex == 0}">
                                        <td>Nữ</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>Khác</td>
                                    </c:otherwise>
                                </c:choose>

                                <td>${c.sdt}</td>
                                <td>${c.email}</td>
                                <td>${c.address}</td>
                                <td>   <!-- Button trigger modal -->
                                    <button onclick="onDelete(${c.id})" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                                        Delete
                                    </button>
                                </td>
                                <td>
                                    <form method="get" action="/showCustomer">
                                        <input type="hidden"  name="action" value="update" >
                                        <input type="hidden"  name="id" id="${c.id}">
                                        <input type="hidden"  name="index" value="${indexPage}">
                                        <button onclick="onEdit(${c.id})" type="submit" class="btn btn-primary" data-toggle="modal">
                                            Edit
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${countPage}"  var="p">
                                <c:choose>
                                    <c:when test="${p == indexPage}">
                                        <li class="page-item active"><a class="page-link" id="page${p}" onclick="activePage(${p})" href="/showCustomer?index=${p}">${p}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" id="page${p}" onclick="activePage(${p})" href="/showCustomer?index=${p}">${p}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa khách hàng này!</h5>
                </div>
                <form method="post" action="/showCustomer">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" id="idDel">
                    <div class="modal-body">
                        <p>Bạn có thật sự muốn xóa</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </div>
                </form>

            </div>
        </div>
    </div>


    <jsp:include page="view/footer.jsp" />
</div>
</body>
<script src="src/main.js"></script>
</html>
