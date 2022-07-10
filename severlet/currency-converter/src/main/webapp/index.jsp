<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <link rel="stylesheet" type="text/css">
</head>
<body>
<h1><%= "currency converter" %>
</h1>
<br/>
<form method="post" action="convert">
    <label>Rate : </label></br>
    <input type="text" name="rate" placeholder="RATE" value="22000"/></br>
    <label>USD :</label>
    <input type="text" name="usd" placeholder="USD" value="0"/></br>
    <input type="submit" id="submit" value="Converter">
</form>
</body>
</html>