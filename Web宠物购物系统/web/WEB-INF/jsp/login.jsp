
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
            height:100%;
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



