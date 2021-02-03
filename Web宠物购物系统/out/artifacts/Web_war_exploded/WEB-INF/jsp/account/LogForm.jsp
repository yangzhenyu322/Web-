<%@ page import="org.csu.myproject.domain.Log" %><%--
  Created by IntelliJ IDEA.
  User: 杨震宇
  Date: 2020/11/14
  Time: 23:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <title>用户日志</title>
    <style>

        #record{
            text-align: center; /*让div内部文字居中*/
            border-radius: 20px;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        table{
            margin:auto;
        }

        html{
            height:1090px;
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


        td{
            text-align:center;
            background-color: blanchedalmond;
        }
    </style>

</head>
<body>
<%@include file="../common/IncludeTop.jsp"%>

<div id="record">
    <table>
        <tr>
            <h3>购物车纪录</h3>
        </tr>
        <tr>
            <th>itemId</th>
            <th>quantity</th>
            <th>instock</th>
            <th>total</th>
        </tr>

        <%
            //展示购物纪录
            Log log=(Log)session.getAttribute("log");
            for(int i=0;i<log.getCarts().size();i++){
                out.write("<tr>");
                out.write("<td>"+log.getCarts().get(i).getItemId()+"</td>");
                out.write("<td>"+log.getCarts().get(i).getQuantity()+"</td>");
                out.write("<td>"+log.getCarts().get(i).getInstock()+"</td>");
                out.write("<td>"+log.getCarts().get(i).getTotal()+"</td>");
                out.write("</tr>");
            }
        %>
    </table>

    <table>
        <tr>
            <h3>订单纪录</h3>
        </tr>
        <tr>
            <th>orderid</th>
            <th>orderdate</th>
            <th>itemId</th>
            <th>quantity</th>
            <th>total</th>
            <th>totalprice</th>
        </tr>
        <%
            //展示订单纪录
            for(int i=0;i<log.getOrders().size();i++){
                out.write("<tr>");
                out.write("<td>"+log.getOrders().get(i).getOrderId()+"</td>");
                out.write("<td>"+log.getOrders().get(i).getOrderdate()+"</td>");
                out.write("<td>"+log.getOrders().get(i).getItemId()+"</td>");
                out.write("<td>"+log.getOrders().get(i).getQuantity()+"</td>");
                out.write("<td>"+log.getOrders().get(i).getTotal()+"</td>");
                out.write("<td>"+log.getOrders().get(i).getTotalPrice()+"</td>");
                out.write("</tr>");
            }
        %>
    </table>
</div>

<%@include file="../common/IncludeBottom.jsp"%>
</body>
</html>
