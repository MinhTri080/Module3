<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<head>
    <title>Simple Dictionary</title>
    <link rel="stylesheet" type="text/css">
</head>
<h1><%= "Simple Dictionary" %>
</h1>
<body>
<h2>Simple Dictionary</h2>
<br/>
<form method="post" action="/translate">
    <input type="text" name="txtSearch" placeholder="Enter your text :"/>
    <input type="submit" name="submit" value="search"/>
</form>

</body>
</html>