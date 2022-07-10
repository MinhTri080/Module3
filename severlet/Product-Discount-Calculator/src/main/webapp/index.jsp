<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Discount Calculator</title>

</head>
<body>
<h1><%= "Product Discount Calculator" %>
</h1>
<br/>
<form method="post" action="caculation">
    <label>Product Description :</label>
    <input type="text" name="product" placeholder="Enter product information"/></br>
    <label>List Price :</label>
    <input type="text" name="price" placeholder="enter Listed price"/></br>
    <label>Discount Percent :</label>
    <input type="text" name="percent" placeholder="enter discount"></br>
    <input type="submit" id="submit">
</form>
</body>
</html>