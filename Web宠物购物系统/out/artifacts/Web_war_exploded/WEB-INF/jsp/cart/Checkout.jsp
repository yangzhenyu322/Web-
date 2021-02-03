
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
    <script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
</head>

<body>

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="../images/logo-topbar.gif" /></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="viewCart"><img align="middle" name="img_cart"
                                    src="../images/cart.gif" /></a> <img align="middle"
                                                                         src="../images/separator.gif" /> <a
                href="../account/SignonForm.jsp">Sign In</a> <a href="#">Sign
            Out</a> <img align="middle" src="../images/separator.gif" /> <a
                href="../account/EditAccountForm.jsp">My Account</a> <img align="middle"
                                                                           src="../images/separator.gif" /> <a href="../help.jsp">?</a>
        </div>
    </div>

    <div id="Search">
        <div id="SearchContent">
            <form action="../catalog/SearchProducts.jsp" method="post">
                <input type="text" name="keyword" size="14" /> <input type="submit"
                                                                      name="searchProducts" value="Search" />
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="../catalog/Category.jsp"><img
                src="../images/sm_fish.gif" /></a> <img src="../images/separator.gif" />
        <a href="../catalog/Category.jsp"><img
                src="../images/sm_dogs.gif" /></a> <img src="../images/separator.gif" />
        <a href="../catalog/Category.jsp"><img
                src="../images/sm_reptiles.gif" /></a> <img
            src="../images/separator.gif" /> <a href="../catalog/Category.jsp"><img
            src="../images/sm_cats.gif" /></a> <img src="../images/separator.gif" />
        <a href="../catalog/Category.jsp"><img
                src="../images/sm_birds.gif" /></a>
    </div>

</div>

<div id="Content">/IncludeTop.jsp" />

    <div id="BackLink">
        <stripes:link
                beanclass="org.mybatis.jpetstore.web.actions.CartActionBean">
            Return to Shopping Cart</stripes:link>
    </div>

    <div id="Catalog">

        <table>
            <tr>
                <td>
                    <h2>Checkout Summary</h2>

                    <table>

                        <tr>
                            <td><b>Item ID</b></td>
                            <td><b>Product ID</b></td>
                            <td><b>Description</b></td>
                            <td><b>In Stock?</b></td>
                            <td><b>Quantity</b></td>
                            <td><b>List Price</b></td>
                            <td><b>Total Cost</b></td>
                        </tr>

                        <!-- 循环 -->
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="7">Sub Total: <fmt:formatNumber
                                    value="" pattern="$#,##0.00" /></td>
                        </tr>
                    </table>
                <td>&nbsp;</td>

            </tr>
        </table>

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
