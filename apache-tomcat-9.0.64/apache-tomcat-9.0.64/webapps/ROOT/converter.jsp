<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 7/12/2022
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title></title>
</head>
<body>
<%
    double rate = Double.parseDouble(request.getParameter("rate"));
    double usd = Double.parseDouble(request.getParameter("usd"));
    double vnd = rate * usd;
%>
<h1> Rate: <%=rate
%>
</h1>
<h1> Rate: <%=usd
%>
</h1>
<h1> Rate: <%=vnd
%>
</h1>

</body>
</html>
