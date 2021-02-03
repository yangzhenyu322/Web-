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
                .okTips{
                    color:green;
                }

                .errorTips{
                    color: #ff0000;
                }


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
    <script type="text/javascript">
        // ajax
        var xhr;
        function checkUsername(){
            var username = document.getElementById("username").value;
            xhr = new XMLHttpRequest();
            xhr.onreadystatechange = fun1;
            xhr.open("GET","usernameExist?username="+username,true);
            xhr.send(null);
        }

        function fun1(){
            if(xhr.readyState === 4){
                if(xhr.status === 200){
                    var tips = document.getElementById("usernameTips");
                    var responseInfo = xhr.responseText;
                    if(responseInfo === 'Exist'){
                        tips.className = 'errorTips'
                        tips.innerHTML = "Invalid";
                    }else if(responseInfo === 'No Exist'){
                        tips.className = 'okTips'
                        tips.innerHTML = "Available";
                    }
                }
            }
        }

        //jQuery
        // $(function(){
        //     $('#username').on('blur',function (){
        //         $.ajax({
        //             type    :"GET",
        //             url     :"usernameExist?username"+this.value,
        //             success : function (data){
        //                 consolo.log(data);
        //                 if(data.msg === 'Exist'){
        //                     $('#usernameTips').attr("class","errorTips").text("Invalid");
        //                 }else if(data.msg === 'No Exist'){
        //                     $('#usernameTips').attr("class","okTips").text("Available");
        //                 }
        //             }
        //         });
        //     });
        // });

    </script>

    <div id="Catalog">
        <form action="register" method="post">
            <h3>User Information</h3>
            <table align="center">
                <tr>
                    <td colspan="2" align="right">
                        <font color="red">${requestScope.msg}</font>
                    </td>
                </tr>
                <tr>
                    <td>用户名：</td>
                    <td>
                        <input id="username" type="text" name="username" onblur="checkUsername();" />
                        <span id="usernameTips"></span>
                    </td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td><input type="text" name="email"/></td>
                </tr>

                <tr>
                    <td colspan="2" align="center"><div align="center"><img id="img" src="checkCode"></td>
                </tr>
                <tr>
                    <td>验证码</td>
                    <td><input type="text" name="register_checkCode"></td>
                </tr>

                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" name="newAccount" value="Save Account Information"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<%@include file="common/IncludeBottom.jsp"%>
</body>
</html>