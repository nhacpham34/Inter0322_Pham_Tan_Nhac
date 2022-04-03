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
    <jsp:include page="view/header.jsp" />
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
                            <th scope="col">Name</th>
                            <th scope="col">Day</th>
                            <th scope="col">Loại khách</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">SDT</th>
                            <th scope="col">Email</th>
                            <th scope="col">Dịa Chỉ</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listp}" var="c" varStatus="loop">
                            <tr id="customer${c.id}">
                                <th scope="row" >${loop.index + 1} </th>
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
                                        <button onclick="onEdit(${c.id})" type="submit" class="btn btn-primary" data-toggle="modal">
                                            Edit
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
