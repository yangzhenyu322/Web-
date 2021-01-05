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

</div>

<div id="Content">

    <div id="BackLink">
        <a href="main">Return to Main Menu</a>
    </div>

    <div id="Catalog">
        Please confirm the information below and then press continue...

        <table>
            <tbody>
            <tr>
                <th align="center" colspan="2"><font size="4"><b>Order</b></font>
                    <br> <font size="3"><b> ${sessionScope.manifestOrderDate}</b></font></th>
            </tr>

            <tr>
                <th colspan="2">Billing Address</th>
            </tr>
            <tr>
                <td>First name:</td>
                <td>${sessionScope.ConfirmOrder_billToFirstName}</td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td>${sessionScope.ConfirmOrder_billToLastName}</td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td>${sessionScope.ConfirmOrder_billAddress1}</td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td>${sessionScope.ConfirmOrder_billAddress2}</td>
            </tr>
            <tr>
                <td>City:</td>
                <td>${sessionScope.ConfirmOrder_billCity}</td>
            </tr>
            <tr>
                <td>State:</td>
                <td>${sessionScope.ConfirmOrder_billState}</td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td>${sessionScope.ConfirmOrder_billZip}</td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${sessionScope.ConfirmOrder_billCountry}</td>
            </tr>
            <tr>
                <th colspan="2">Shipping Address</th>
            </tr>
            <tr>
                <td>First name:</td>
                <td>${sessionScope.ConfirmOrder_shipToFirstName}</td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td>${sessionScope.ConfirmOrder_shipToLastName}</td>
            </tr>
            <tr>
                <td>Address 1:</td>
                <td>${sessionScope.ConfirmOrder_shipAddress1}</td>
            </tr>
            <tr>
                <td>Address 2:</td>
                <td>${sessionScope.ConfirmOrder_shipAddress2}</td>
            </tr>
            <tr>
                <td>City:</td>
                <td>${sessionScope.ConfirmOrder_shipCity}</td>
            </tr>
            <tr>
                <td>State:</td>
                <td>${sessionScope.ConfirmOrder_shipState}</td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td>${sessionScope.ConfirmOrder_shipZip}</td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>${sessionScope.ConfirmOrder_shipCountry}</td>
            </tr>
            </tbody>
        </table>


        <a class="Button" href="viewOrders">Confirm</a>
    </div>

</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>





