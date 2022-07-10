<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 7/10/2022
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Converter Curency</title>
    <%--    <link rel="stylesheet" type="text/css">--%>
</head>
<br>
<h2>Converter Curency</h2>
<form action="/convert" method="post">
    <label>Rate :</label>
</br>
<input type="text" name="rate" placeholder="RATE" value="22000"/></br>
<label>USD</label>
</br>
<input type="text" name="usd" placeholder="USD" value="0"/></br>
<input type="submit" id="submit" value="Converter"/>
</form>

</body>
</html>
