<%--
  Created by IntelliJ IDEA.
  User: 杨震宇
  Date: 2020/11/10
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
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

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="../../images/logo-topbar.gif" /></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="viewCart"><img align="middle" name="img_cart"
                                    src="../../images/cart.gif" /></a> <img align="middle"
                                                                            src="../../images/separator.gif" /> <a
                href="SignonForm.jsp">Sign In</a> <a href="#">Sign
            Out</a> <img align="middle" src="../../images/separator.gif" /> <a
                href="EditAccountForm.jsp">My Account</a> <img align="middle"
                                                               src="../../images/separator.gif" /> <a href="../help.jsp">?</a>
        </div>
    </div>

    <div id="Search">
        <div id="SearchContent">
            <form action="../../catalog/SearchProducts.jsp" method="post">
                <input type="text" name="keyword" size="14" /> <input type="submit"
                                                                      name="searchProducts" value="Search" />
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="../../catalog/Category.jsp"><img
                src="../../images/sm_fish.gif" /></a> <img src="../../images/separator.gif" />
        <a href="../../catalog/Category.jsp"><img
                src="../../images/sm_dogs.gif" /></a> <img src="../../images/separator.gif" />
        <a href="../../catalog/Category.jsp"><img
                src="../../images/sm_reptiles.gif" /></a> <img
            src="../../images/separator.gif" /> <a href="../../catalog/Category.jsp"><img
            src="../../images/sm_cats.gif" /></a> <img src="../../images/separator.gif" />
        <a href="../../catalog/Category.jsp"><img
                src="../../images/sm_birds.gif" /></a>
    </div>

</div>

<div id="Content">

    <script type="text/javascript">
        var xmlHttpRequest;
        function createXMLHttpRequest()
        {
            if (window.XMLHttpRequest) //非IE浏览器
            {
                xmlHttpRequest = new XMLHttpRequest();
            }
            else if (window.ActiveObject)//IE6以上浏览器
            {
                xmlHttpRequest = new ActiveObject("Msxml2.XMLHTTP");
            }
            else //IE6及以下浏览器
            {
                xmlHttpRequest = new ActiveObject("Microsoft.XMLHTTP");
            }
        }

        function usernameIsExist()
        {
            var username = document.userInfo.username.value;
            sendRequest("usernameValidation?username="+username);
        }

        function sendRequest(url){
            createXMLHttpRequest();
            xmlHttpRequest.open("GET", url, true);
            xmlHttpRequest.onreadystatechange = processResponse;
            xmlHttpRequest.send(null);
        }

        function processResponse(){
            if(xmlHttpRequest.readyState == 4){
                if(xmlHttpRequest.status == 200){
                    var responseInfo = xmlHttpRequest.responseXML.getElementsByTagName("info")[0].firstChild.data;
                    var div1 = document.getElementById("usernameInfo");
                    if(responseInfo == "Exist"){
                        div1.innerHTML="&lt;font color='red'>The User ID is Exist&lt;/font>";
                    }
                    else{
                        div1.innerHTML="&lt;font color='green'>The User ID is Available&lt;/font>";
                    }
                }
            }
        }

    </script>

    <div id="Catalog">

        <form action="../../catalog/Main.jsp" method="post" name="userInfo" id="userInfo">

            <h3>User Information</h3>

            <table>
                <tr>
                    <td>User ID:</td>
                    <td>
                        <input type="text" name="username" id="username" onblur="usernameIsExist();"/>
                        <div id="usernameInfo"></div>
                    </td>
                </tr>
                <tr>
                    <td>New password:</td>
                    <td><input type="password" name="password" /></td>
                </tr>

                <tr>
                    <td>Repeat password:</td>
                    <td><input type="password" name="repeatedPassword"/></td>
                </tr>
            </table>

            <include file="IncludeAccountFields.jsp"/>

            <input type="submit" name="newAccount" value="Save Account Information"/>

        </form>
    </div>

</div>

<div id="Footer">

    <div id="PoweredBy">&nbsp<a href="www.csu.edu.cn">www.csu.edu.cn</a>
    </div>

    <div id="Banner">
        IncludeBottom.jsp
    </div>

</div>

</body>
</html>

