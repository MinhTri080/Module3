<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new customer</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Create new customer</h1>
<p>
    <c:if test='${requestScope["message"]!= null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/customers">Back to customer list</a>
</p>
<form method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td>
                <input type="text" name="name" id="name">
            </td>
        </tr>
        <tr>
            <td>Email: </td>
            <td>
                <input type="text" name="email" id="email">
            </td>
        </tr>
        <tr>
            <td>Adress:</td>
            <td>
                <input type="text" name="address" id="address">
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Create Customer">
            </td>
        </tr>
    </table>
</form>
</body>
</html>