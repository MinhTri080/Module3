<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 7/12/2022
  Time: 9:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%! Map<String, String> dic = new HashMap<>();%>
<% dic.put("hello", "xin chào");%>
<% dic.put("book", "cuốn sách");%>
<% dic.put("how", "thế nào");%>
<% dic.put("computer", "máy tính");%>
<%
    String search = request.getParameter("search");
    String result = dic.get(search);
    if (result != null) {
        System.out.println("Word: " + search);
        System.out.println("Result: " + result);
    } else {
        System.out.println("Not found");
    }
%>

<h1>Word: <%= search %></h1>
<h1>Result: <%= result %></h1>


</body>
</html>
