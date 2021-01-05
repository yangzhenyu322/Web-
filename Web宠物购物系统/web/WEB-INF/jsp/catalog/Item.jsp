<%--
  Created by IntelliJ IDEA.
  User: 杨震宇
  Date: 2020/11/10
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
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
        <a href="viewProduct?productId=${sessionScope.product.productId}">Return to ${sessionScope.product.productId}</a>
    </div>

    <div id="Catalog">

        <table>
            <tr>
                <td>${sessionScope.product.description}</td>
            </tr>
            <tr>
                <td>
                    <b>${sessionScope.item.itemId}</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>
                        <font size="4">
                            ${sessionScope.item.attribute1}${sessionScope.item.attribute2}${sessionScope.item.attribute3}${sessionScope.item.attribute4}${sessionScope.item.attribute5}${sessionScope.product.name}
                        </font>
                    </b>
                </td>
            </tr>
            <tr>
                <td>${sessionScope.product.name}</td>
            </tr>
            <tr>
                <td><c:if test="${sessionScope.item.quantity<=0}">
                    Back ordered.
                </c:if><c:if test="${sessionScope.item.quantity>0}">
                    ${sessionScope.item.quantity} in stock.
                </c:if>
                </td>
            </tr>
            <tr>
                <td>
                    <fmt:formatNumber value="${sessionScope.item.listPrice}" pattern="$#,##0.00"/>
                </td>
            </tr>

            <tr>
                <td>
                    <a class="Button" href="addItemToCart?workingItemId=${sessionScope.item.itemId}">Add to Cart</a>
                </td>
            </tr>
        </table>

    </div>


</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>




