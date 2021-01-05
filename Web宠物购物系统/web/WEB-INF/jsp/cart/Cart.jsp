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
        <a href="main">Return to Main Menu</a>
    </div>

    <div id="Catalog">

        <div id="Cart">

            <h2>Shopping Cart</h2>
            <form action="updateCart" method="post">
                <table>
                    <tr>
                        <th><b>Item ID</b></th>
                        <th><b>Product ID</b></th>
                        <th><b>Description</b></th>
                        <th><b>In Stock?</b></th>
                        <th><b>Quantity</b></th>
                        <th><b>List Price</b></th>
                        <th><b>Total Cost</b></th>
                        <th>&nbsp</th>
                    </tr>
                    <c:if test="${sessionScope.cart.numberOfItems==0}">
                    <tr>
                        <td colspan="8"><b>Your cart is empty.</b></td>
                    </tr>
                    </c:if>
                    <c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">
                    <tr>
                        <td><a href="viewItem?itemId=${cartItem.item.itemId}">${cartItem.item.itemId}</a></td>
                        <td>${cartItem.item.productId}</td>
                        <td>${cartItem.item.attribute1}${cartItem.item.attribute2}${cartItem.item.attribute3}${cartItem.item.attribute4}${cartItem.item.attribute5}</td>
                        <td>${cartItem.inStock}</td>
                        <td><input type="text" size="3" name="${cartItem.item.itemId}" value="${cartItem.quantity}"/></td>
                        <td>
                            <fmt:formatNumber value="${cartItem.item.listPrice}" pattern="$#,##0.00"/>
                        </td>
                        <td>
                            <fmt:formatNumber value="${cartItem.total}" pattern="$#,##0.00"/>
                        </td>
                        <td><a href="removeItemFromCart?removeItemId=${cartItem.item.itemId}" class="Button">Remove</a></td>
                    </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="7">
                            Sub Total: ${sessionScope.cart.subTotal} <input class="Button" type="submit" value="Update Cart" />
                        </td>
                        <td>&nbsp</td>
                    </tr>
                </table>
            </form>

            <!-- 需要判断是否登录 -->

            <a href="newOrdersForm">Proceed to Checkout</a>
        </div>

<%--        <div id="MyList">--%>
<%--            <!-- 判断 -->--%>
<%--            <include file="IncludeMyList.jsp" />--%>
<%--        </div>--%>

        <div id="Separator">&nbsp;</div>
    </div>

</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>
