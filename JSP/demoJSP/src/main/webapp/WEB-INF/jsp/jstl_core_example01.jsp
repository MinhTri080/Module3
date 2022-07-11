<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 7/10/20222
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>example</title>
</head>
<body>
<h1>aaaaaaaaaaaaaaaaaaaaaaaaaaa</h1>
<!-- Dùng for để duyệt trên các phòng ban (departments) -->
<c:forEach items="${departments}" var="dept">
    <h3>${dept.deptName}</h3>
    <ul>
        <!-- Dùng for để duyệt trên các nhân viên
                    thuộc phòng ban hiện tại -->
        <c:forEach items="${dept.employees}" var="emp">
            <li>
                    ${emp.empName} - ${emp.job}
            </li>
        </c:forEach>
    </ul>

</c:forEach>

</body>
</html>