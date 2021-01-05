<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="StyleSheet" href="css/jpetstore.css" type="text/css"
          media="screen" />

    <meta name="generator"
          content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
    <title>JPetStore Demo</title>
    <meta content="text/html; charset=windows-1252"
          http-equiv="Content-Type" />
    <meta http-equiv="Cache-Control" content="max-age=0" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="Pragma" content="no-cache" />
</head>

<body>

<%@include file="../common/IncludeTop.jsp"%>

<div id="Content">

    <div id="BackLink">
        <a href="viewCategory?categoryId=${sessionScope.product.categoryId}">Return to ${sessionScope.product.categoryId}</a>
    </div>

    <div id="Catalog">

        <h2>Product Name</h2>

        <table>
            <tr>
                <th>Item ID</th>
                <th>Product ID</th>
                <th>Description</th>
                <th>List Price</th>
                <th>&nbsp</th>
            </tr>
             <c:forEach var="item" items="${sessionScope.itemList}">
                <tr>
                    <td>
                        <a href="viewItem?itemId=${item.itemId}">${item.itemId}</a>
                    </td>
                    <td>
                        ${item.productId}
                    </td>
                    <td>
                        ${item.attribute1}${item.attribute2}${item.attribute3}${item.attribute4}${item.attribute5}
                    </td>
                    <td>
                        <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/>
                    </td>
                    <td>
                        <a class="Button" href="addItemToCart?workingItemId=${item.itemId}">Add to Cart</a>
                    </td>
                </tr>
             </c:forEach>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>

</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>






