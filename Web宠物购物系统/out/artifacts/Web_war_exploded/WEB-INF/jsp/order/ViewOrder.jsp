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
    <ul class="messages">
        <li>Thank you, your order has been submitted.</li>
    </ul>
    <div id="BackLink">
        <a href="main">Return to Main Menu</a>
    </div>

    <div id="Catalog">

        <table>
            <tbody>
            <tr>
                <th align="center" colspan="2">Order #${sessionScope.order.orderId}#  ${sessionScope.manifestOrderDate} </th>
            </tr>
            <tr>
                <th colspan="2">Payment Details</th>
            </tr>
            <tr>
                <td>Card Type:</td>
                <td>${sessionScope.order.cardType}</td>
            </tr>
            <tr>
                <td>Card Number:</td>
                <td>${sessionScope.order.creditCard}</td>
            </tr>
            <tr>
                <td>Expiry Date (MM/YYYY):</td>
                <td>${sessionScope.order.exprdate}</td>
            </tr>
            <tr>
                <th colspan="2">Billing Address</th>
            </tr>
            <tr>
                <td>First name:</td>
                <td>${sessionScope.order.billToFirstName}</td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td>${sessionScope.order.billToLastName}</td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td>${sessionScope.order.billAddr1}</td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td>${sessionScope.order.billAddr2}</td>
            </tr>
            <tr>
                <td>City:</td>
                <td>${sessionScope.order.billCity}</td>
            </tr>
            <tr>
                <td>State:</td>
                <td>${sessionScope.order.billState}</td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td>${sessionScope.order.billZip}</td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${sessionScope.order.billCountry}</td>
            </tr>
            <tr>
                <th colspan="2">Shipping Address</th>
            </tr>
            <tr>
                <td>First name:</td>
                <td>${sessionScope.order.shipToFirstName}</td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td>${sessionScope.order.shipToLastName}</td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td>${sessionScope.order.shipAddr1}</td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td>${sessionScope.order.shipAddr2}</td>
            </tr>
            <tr>
                <td>City:</td>
                <td>${sessionScope.order.shipCity}</td>
            </tr>
            <tr>
                <td>State:</td>
                <td>${sessionScope.order.shipState}</td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td>${sessionScope.order.shipZip}</td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${sessionScope.order.shipCountry}</td>
            </tr>
            <tr>
                <td>Courier:</td>
                <td>${sessionScope.order.courier}</td>
            </tr>
            <tr>
                <td colspan="2">${sessionScope.status}</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table>
                        <tbody>
                        <tr>
                            <th>Item ID</th>
                            <th>Description</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total Cost</th>
                        </tr>
                        <c:forEach var="customRecord" items="${sessionScope.customRecordList}">
                        <tr>
                            <td>
                                <a href="viewItem?itemId=${customRecord.item.itemId}">${customRecord.item.itemId}</a>
                            </td>
                            <td>
                                ${customRecord.item.attribute1}${customRecord.item.attribute2}${customRecord.item.attribute3}${customRecord.item.attribute4}${customRecord.item.attribute5}
                            </td>
                            <td>
                                ${customRecord.quantity}
                            </td>
                            <td>
                                ${customRecord.total}
                            </td>
                            <td></td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <th colspan="5">${sessionScope.order.totalPrice}</th>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>

            </tbody>
        </table>

    </div>

</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>
