<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<div>
    <div style="float: left;width: 24%">
        <c:forTokens items="Trí Gạ Chịch,Minh Rình Rập,Bảo Xinh,Mi Lô Hột Mít" delims="," var="name">
            <p style="height: 70px">
                <c:out value="${name}"></c:out><p>
            </p>
        </c:forTokens>
    </div>
    <div style="float: left;width: 24%">
        <c:forTokens delims="," items="19/03/1993,23/07/1995,23/03/2000,06/01/1997" var="birth">
            <p style="height: 70px">
                <c:out value="${birth}"></c:out>
            </p>
        </c:forTokens>
    </div>
    <div style="float: left;width: 24%">
        <c:forTokens delims=","  items="Trên đất,Trên đường,Trên cây,Trên lá" var="address">
            <p style="height: 70px"><c:out value="${address}"/><hr><p>
        </c:forTokens>
    </div>
    <div style="float: left;width: 24%">
        <c:forTokens items="https://toanthaydinh.com/wp-content/uploads/2020/04/top-hinh-nen-dong-vat-dang-yeu-5.jpg,
 https://cdn.baogiaothong.vn/files/thu.ha/2015/06/28/poseeraavat-elimet-sketsi-hauskat-lemmikit-0151.jpg,
 https://scr.vn/wp-content/uploads/2020/10/Ui-nhin-cung-qua-di-ne.jpg,
https://icdn.dantri.com.vn/thumb_w/640/2018/8/15/ha-ma-15342920701292037680921.jpg" delims="," var="image">
            <img src="<c:out value="${image}"/>" style="width: 60px; height: 80px; padding: 0; margin: 0"><hr><p>

        </c:forTokens>
    </div>
</div>
</body>
</html>