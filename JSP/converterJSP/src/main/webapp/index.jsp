<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<form method="post" action="/converter.jsp">
<label>Rate :</label>
    <input type="text" name="rate" placeholder="RATE" value="23000">
<label>Usd :</label>
    <input type="text" name="usd" placeholder="USD" value="0">
<input type="submit" id="submit" value="converter"/>
</form>

<%--<%!--%>
<%--    double rate = Double.parseDouble("rate");%>--%>
<%--<%!double usd = Double.parseDouble("usd");%>--%>
<%--<%! double vnd = rate * usd;%>--%>
<%--</--%>
<%-->--%>
<%--<h1> Rate: <%=rate--%>
<%--%>--%>
<%--</h1>--%>
<%--<h1> Rate: <%=usd--%>
<%--%>--%>
<%--</h1>--%>
<%--<h1> Rate: <%=vnd--%>
<%--%>--%>
<%--</h1>--%>
</body>


</html>