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

    <div class="container" >
        <div id="" class="row ">
            <div class=" pt-1 ">
                <c:if test="${empty liste}" >
                    <h2>
                        Không có nhân viên nào trong danh sách, click để thêm mới.
                        <a href="/showEmployee?action=create">Thêm</a>
                    </h2>
                </c:if>
                <c:if test="${!empty liste}" >
                <%--    Danh sách nhân viên            --%>
                    <h2 class="text-center">Danh sách nhân viên</h2>
                <table class="table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Name</th>
                        <th scope="col">Ngày sinh</th>
                        <th scope="col">CMND</th>
                        <th scope="col">SDT</th>
                        <th scope="col">Email</th>
                        <th scope="col">Học vấn</th>
                        <th scope="col">Chức vụ</th>
                        <th scope="col">Lương</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${liste}" var="e" varStatus="loop">
                        <tr id="employee${e.id}">
                            <th scope="row">${loop.index +1}</th>
                            <td>${e.name}</td>
                            <td>${e.dateOfBirth}</td>
                            <td>${e.idCard}</td>
                            <td>${e.sdt}</td>
                            <td>${e.email}</td>
                            <c:choose>
                                <c:when test="${e.educationId ==1}">
                                    <td>Trung Cấp</td>
                                </c:when>
                                <c:when test="${e.educationId ==2}">
                                    <td>Cao Đẳng</td>
                                </c:when>
                                <c:when test="${e.educationId ==3}">
                                    <td>Đại Học</td>
                                </c:when>
                                <c:when test="${e.educationId ==4}">
                                    <td>Sau Đại Học</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Khác</td>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${e.positionId == 1}">
                                    <td>Quản lý</td>
                                </c:when>
                                <c:when test="${e.positionId == 2}">
                                    <td>Nhân Viên</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Khác</td>
                                </c:otherwise>
                            </c:choose>

                            <td>${e.price}</td>
                            <td>
                                <button onclick="onDelete(${e.id})" type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
                                    Xóa
                                </button>
                            </td>
                            <td>
                                <form method="get" action="/showEmployee">
                                    <input type="hidden"  name="action" value="update" >
                                    <input type="hidden"  name="id" id="${e.id}">
                                    <button onclick="onEdit(${e.id})" type="submit" class="btn btn-primary" >
                                        Sửa
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
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa nhân viên!</h5>
                </div>
                <form action="/showEmployee" method="post">
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
<script src="src/main.js"></script>
</body>
</html>
