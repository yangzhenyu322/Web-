//------修改------
<%--
  Created by IntelliJ IDEA.
  User: 杨震宇
  Date: 2020/11/10
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

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
        body {
            margin: 0ex 10ex 0ex 10ex;
            padding: 0ex;
            font-family: helvetica, tahoma, arial, verdana, sans-serif;
            font-size: 2ex;
            color: #333;
            background-color: #444;
        }

        pre {
            font-family: "Courier New", Courier, mono;

            font-style: normal;
            background-color: #FFFFFF;
            white-space: pre
        }

        h1 {
            margin: 1ex 0ex 1ex 0ex;
            padding: 0ex;

            line-height: 3ex;
            font-weight: 900;
            color: #666;
        }

        h2 {
            margin: 2ex 0ex 1ex 0ex;
            padding: 0ex;

            line-height: 2ex;
            font-weight: 700;
            color: #444;
        }

        h3 {
            margin: 1ex 0ex 1ex 0ex;
            padding: 0ex;

            line-height: 1.6ex;
            font-weight: 700;
            color: #222;
        }

        p {
            font-family: helvetica, tahoma, arial, verdana, sans-serif;

            margin: 0ex 0ex 0ex 0ex;
            padding: 2ex;
        }

        img {
            border: 0;
        }

        li {
            font-family: helvetica, tahoma, arial, verdana, sans-serif;

            margin: 0ex 0ex 0ex 0ex;
            padding: 0ex;
        }

        table {
            border-width: 0;
            empty-cells: show;
        }

        td, th {
            empty-cells: show;
            padding: .3ex .3ex;
            vertical-align: top;
            text-align: left;
            border-width: 0;
            border-spacing: 0;
            background-color: #ececec
        }

        th {
            font-weight: bold;
            background-color: #e2e2e2;
        }

        a, a:visited, a:link {
            color: #039;

            text-decoration: none;
            font-family: helvetica, tahoma, arial, verdana, sans-serif;
        }

        a:hover {
            color: #69f;
        }

        a.Button, a.Button:link, a.Button:visited {
            padding: .3ex;
            color: #fff;
            background-color: #005e21;
            text-decoration: none;
            font-family: helvetica, tahoma, arial, verdana, sans-serif;
            font-size: 1.5ex;
        }

        a.Button:hover {
            color: #000;
            background-color: #54c07a;
        }

        #Logo {
            width: 33%;
            height: 9ex;
            margin: 0ex 0ex 0ex 0ex;
            padding: 0ex 0ex 0ex 0ex;
            border-width: 0ex 0ex .3ex 0px;
            border-style: solid;
            border-color: #ccc;
            float: left;
            background-color: #000;
            color: #fff;
            line-height: 9ex;
            voice-family: "\"}\"";
            voice-family: inherit;
            height: 9ex;
        }

        body>#Logo {
            height: 9ex;
        }

        #Menu {
            width: 33%;
            height: 9ex;
            margin: 0ex 0ex 0ex 0ex;
            padding: 0ex 0ex 0ex 0ex;
            border-width: 0ex 0ex .3ex 0px;
            border-style: solid;
            border-color: #ccc;
            float: left;
            background-color: #000;
            color: #eaac00;
            text-decoration: none;
            font-family: helvetica, tahoma, arial, verdana, sans-serif;
            text-align: center;
            line-height: 9ex;
            voice-family: "\"}\"";
            voice-family: inherit;
            height: 9ex;
        }

        #Menu, #Menu a, #Menu a:link, #Menu a:visited, #Menu a:hover {
            color: #eaac00;
            text-decoration: none;
            font-family: helvetica, tahoma, arial, verdana, sans-serif;
        }

        body>#Menu {
            height: 9ex;
        }

        {
        }

        #Search {
            width: 33%;
            height: 9ex;
            margin: 0ex 0ex 0ex 0ex;
            padding: 0ex 0ex 0ex 0ex;
            border-width: 0ex 0ex .3ex 0px;
            border-style: solid;
            border-color: #ccc;
            float: left;
            text-align: center;
            background-color: #000;
            color: #eaac00;
            line-height: 9ex;
            voice-family: "\"}\"";
            voice-family: inherit;
            height: 9ex;
        }

        body>#Search {
            height: 9ex;
        }

        #Search input {
            border-width: .1ex .1ex .1ex .1ex;
            border-style: solid;
            border-color: #aaa;
            background-color: #666;
            color: #eaac00;
        }

        #QuickLinks {
            text-align: center;
            background-color: #FFF;
            width: 99%;
        }

        #PoweredBy {
            width: 30%;
            height: 9ex;
            margin: 0ex 0ex 0ex 0ex;
            padding: 0ex 0ex 0ex 0ex;
            border-width: .3ex 0ex .3ex 0px;
            border-style: solid;
            border-color: #ccc;
            float: left;
            background-color: #000;
            color: #fff;
            line-height: 9ex;
            voice-family: "\"}\"";
            voice-family: inherit;
            height: 9ex;
        }

        body>#PoweredBy {
            height: 9ex;
        }

        #Banner {
            width: 69%;
            height: 9ex;
            margin: 0ex 0ex 0ex 0ex;
            padding: 0ex 0ex 0ex 0ex;
            border-width: .3ex 0ex .3ex 0px;
            border-style: solid;
            border-color: #ccc;
            float: left;
            background-color: #000;
            color: #fff;
            line-height: 9ex;
            voice-family: "\"}\"";
            voice-family: inherit;
            height: 9ex;
        }

        body>#Banner {
            height: 9ex;
        }

        #Content {
            margin: 0;
            padding: 0ex 0ex 0ex 0ex;
            width: 99%;
            color: #333;
            background-color: #FFF;
            border-width: 0;
        }

        #Separator {
            clear:both;
            margin: 0;
            height:0;
        }

        #Main {
            margin: 0;
            padding: 1ex;
            color: #333;
            background-color: #FFF;
            border-width: 1ex 0ex 2ex 0px;
            border-style: solid;
            border-color: #fff;
        }

        #Sidebar {
            float: left;
            background:inherit;
            width: 30%;
        }

        #MainImage {
            float: left;
            background:inherit;
            text-align:center;
            width: 50%;
        }

        #Catalog {
            padding: 1ex;
            background:inherit;
            text-align:center;
        }

        #Catalog input[type="submit"]{
            width: 270px;
            height: 40px;
            padding: .3ex;
            color: #fff;
            background-color: rgb(121,205,205);
            text-decoration: none;
            font-family: helvetica, tahoma, arial, verdana, sans-serif;
            font-size: 1.5ex;
            border-width:0;
            border-radius: 20px;
            font-size: 20px;
        }
        #Catalog input[type="submit"]:hover {
            color: #000;
            background-color: rgb(0,255,255);
            cursor:pointer;
        }

        #Catalog table{
            margin-left:auto;
            margin-right:auto;
        }

        #BackLink{
            padding: 1ex;
            float: right;
            border-width: .1ex 0ex .1ex 0px;
            border-style: solid;
            border-color: #000;
        }

        #Cart{
            width: 69.99%;
            float: left;
            background-color:#fff;
        }

        #MyList{
            width: 30%;
            float: left;
            background-color:#ccc;
            text-align:left;
        }

    </style>
</head>

<body>
<%@ include file="common/IncludeTop.jsp"%>

<div id="Content">

    <script>
        function reloadImage() {
            //document.getElementById("btn").disabled=true;
            document.getElementById("imgservlet").src = 'validation';
        }
    </script>


    <div id="Catalog">
        <form action="login" method="post">
            <table align="center">
                <tr>
                    <td colspan="2" align="center"><h2>欢迎登陆本网站</h2></td>
                </tr>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>密&nbsp&nbsp&nbsp&nbsp码</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><div align="center"><img id="img" src="checkCode"></div></td>
                </tr>
                <tr>
                    <td>验证码</td>
                    <td><input type="text" name="checkCode"></td>
                </tr>

                <tr>
                    <td colspan="2" align="right">
                        <font color="red">${requestScope.msg}</font>
                    </td>
                </tr>
                <tr>
<%--                    <td colspan="2" align="right">--%>
<%--                        <a href="registerForm">用户注册</a>--%>
<%--                    </td>--%>
                    <td colspan="4" align="center"><input type="submit" value="登录"/></td>
                </tr>
            </table>
        </form>

        Need a user name and password? <a href="registerForm">Register
        Now!</a>

    </div>

</div>

<%@ include file="common/IncludeBottom.jsp"%>

</body>
</html>



