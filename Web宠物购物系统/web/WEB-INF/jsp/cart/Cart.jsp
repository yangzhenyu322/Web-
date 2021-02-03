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
    <style>
        html{
            height: 100%;
            background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
            background-repeat:no-repeat;
        }

        body{
            height: 100%;
            background:none;
        }


        .removeDiv{
            width: 80%;
            height: 50%;
            text-align:center;
            margin: auto;
            position: relative;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        .removeDiv>a:hover{
            color: red;
        }

        td{
            text-align:center;
            background-color: blanchedalmond;
        }


    </style>
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
                            <td>
                                <input id="quantity" type="text" size="3" name="${cartItem.item.itemId}" value="${cartItem.quantity}" onblur="updateCart();" /></td>

                            <td>
                                <fmt:formatNumber  value="${cartItem.item.listPrice}" pattern="$#,##0.00"/>
                            </td>

                            <td>
                                <span  id="total">${cartItem.total}</span>
                                    <%--                            <fmt:formatNumber  value="${cartItem.total}" pattern="$#,##0.00"/>--%>
                            </td>
                            <td>
                                <div class="removeDiv">
                                    <a href="removeItemFromCart?removeItemId=${cartItem.item.itemId}" >Remove</a>
                                </div>
                                    <%--                                <a href="removeItemFromCart?removeItemId=${cartItem.item.itemId}" class="Button">Remove</a>--%>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="7" style="font-size: 25px;font-weight : bold">
                            <div id="SubTotalDiv">
                                Sub Total:<span id="subtotal"> ${sessionScope.cart.subTotal}</span>
                            </div>
                        </td>

                        <td>
                            <input class="Button" type="submit" value="Update Cart" />
                        </td>
                    </tr>
                </table>
            </form>

            <!-- 需要判断是否登录 -->

            <a href="newOrdersForm" style="font-size: 25px;font-weight: bold">Proceed to Checkout</a>
        </div>

        <script type="text/javascript">
            var xhr;
            function updateCart(){
                var quantity = document.getElementById("quantity").value;
                xhr = new XMLHttpRequest();
                xhr.onreadystatechange = processResponse;
                xhr.open("GET","updateCartJSServlet?quantity="+ quantity,true);
                xhr.send(null);
            }

            function processResponse() {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var resp = xhr.responseText;
                        var array = resp.split(",");
                        var quantity = document.getElementById("quantity");
                        var total = document.getElementById("total");
                        var subtotal = document.getElementById("subtotal");

                        quantity.innerText = array[0];
                        total.innerText = array[1];
                        subtotal.innerText = array[2];
                    }
                }
            }
        </script>

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