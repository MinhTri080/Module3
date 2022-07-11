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
<%--<c:set var = "salary" scope = "session" value = "${2000*2}"/>--%>
<%--<p>Your salary is : <c:out value = "${salary}"/></p>--%>
<%--<c:choose>--%>
<%--    <c:when test = "${salary <= 0}">--%>
<%--        Salary is very low to survive.--%>
<%--    </c:when>--%>
<%--    <c:when test = "${salary > 1000}">--%>
<%--        Salary is very good.--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--        No comment sir...--%>
<%--    </c:otherwise>--%>
<%--</c:choose>--%>

<c:choose>
    <%-- Khi tham số color == 'red'--%>
    <c:when test="${param.color=='red'}">
    <p style="color:red;">RED COLOR</p>
    </c:when>
    <c:when test="${param.color=='blue'}">
        <p style="color:blue;">BLUE COLOR</p>
    </c:when>
    <c:otherwise><b>Other color</b></c:otherwise>
</c:choose>

</body>
</html>