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

<div id="BackLink">
    <a href="viewCart">Return to Shopping Cart</a>
</div>

<div id="Content">

    <div id="Catalog">
        <form action="confirmOrders" method="post">

            <table>
                <tbody><tr>
                    <th colspan="2">Payment Details</th>
                </tr>
                <tr>
                    <td>Card Type:</td>
                    <td><select name="cardType">
                        <option selected="selected" value="Visa">Visa</option><option value="MasterCard">MasterCard</option><option value="American Express">American Express</option>
                    </select></td>
                </tr>
                <tr>
                    <td>Card Number:</td>
                    <td><input name="creditCard" value="999 9999 9999 9999" type="text"> * Use a fake
                        number!</td>
                </tr>
                <tr>
                    <td>Expiry Date (MM/YYYY):</td>
                    <td><input name="expiryDate" value="12/03" type="text"></td>
                </tr>
                <tr>
                    <th colspan="2">Billing Address</th>
                </tr>

                <tr>
                    <td>First name:</td>
                    <td><input name="billToFirstName" value="ABC" type="text"></td>
                </tr>
                <tr>
                    <td>Last name:</td>
                    <td><input name="billToLastName" value="XYX" type="text"></td>
                </tr>
                <tr>
                    <td>Address 1:</td>
                    <td><input name="billAddress1" value="901 San Antonio Road" type="text" size="40"></td>
                </tr>
                <tr>
                    <td>Address 2:</td>
                    <td><input name="billAddress2" value="MS UCUP02-206" type="text" size="40"></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input name="billCity" value="Palo Alto" type="text"></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><input name="billState" value="CA" type="text" size="4"></td>
                </tr>
                <tr>
                    <td>Zip:</td>
                    <td><input name="billZip" value="94303" type="text" size="10"></td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td><input name="billCountry" value="USA" type="text" size="15"></td>
                </tr>

                <tr>
                    <td colspan="2"><input name="shippingAddressRequired" value="true" type="checkbox">
                        Ship to different address...</td>
                </tr>

                </tbody></table>

            <input name="newOrder" value="Continue" type="submit">
        </form>
    </div>

</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>