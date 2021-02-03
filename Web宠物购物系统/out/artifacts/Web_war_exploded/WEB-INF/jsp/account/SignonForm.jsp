<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="StyleSheet" href="css/jpetstore.css" type="text/css"
          media="screen" />
    <link rel="StyleSheet" href="css/searchProduct.css" type="text/css" media="screen" />
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
                href="../account/SignonForm.jsp">Sign In</a> <a href="#">Sign
            Out</a> <img align="middle" src="../../images/separator.gif" /> <a
                href="EditAccountForm.jsp">My Account</a> <img align="middle"
                                                               src="../../images/separator.gif" /> <a href="../help.jsp">?</a>
        </div>
    </div>

    <div id="Search">
        <div id="SearchContent">
            <form action="../../catalog/SearchProducts.jsp" method="post">
                <input type="text" name="keyword" size="14" /> <input
                    type="submit" name="searchProducts" value="Search" />
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

    <script>
        function reloadImage() {
            //document.getElementById("btn").disabled=true;
            document.getElementById("imgservlet").src = 'validation';
        }
    </script>


    <div id="Catalog">
        <form action="../../catalog/Main.jsp" method="post">
            <p>Please enter your username and password.</p>
            </p>
            <p>
                Username:<input type="text" name="username" /><br /> Password:<input
                    type="password" name="password" /><br />
                <!--  Validation Code:<input type="text" name="validationCode"/>
        <img src="validation" id="imgservlet" onclick="reloadImage()"/>
        -->
                <!--  <input type="button" value="changeImage" onclick="reloadImage()" id="btn">-->
            </p>
            <input type="submit" name="signon" value="Login" />
        </form>

        Need a user name and password? <a href="NewAccountForm.jsp">Register
        Now!</a>

    </div>

</div>

<div id="Footer">

    <div id="PoweredBy">
        &nbsp<a href="www.csu.edu.cn">www.csu.edu.cn</a>
    </div>

    <div id="Banner">IncludeBottom.jsp</div>

</div>

</body>
</html>


