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

        <h2 style="font-family:Arial,Helvetica,sans-serif;font-size:30px;color: aquamarine">${sessionScope.category.name}</h2>

        <table>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
            </tr>
            <c:forEach var="product" items="${sessionScope.productList}">
                <tr>
                    <td>
                        <a href="viewProduct?productId=${product.productId}">${product.productId}</a>
                    </td>
                    <td>${product.name}</td>
                </tr>
            </c:forEach>
        </table>

    </div>

</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>
