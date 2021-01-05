<%@ page import="org.csu.myproject.domain.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>

<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>

<%--<head>--%>
<%--    <link rel="StyleSheet" href="../css/jpetstore.css" type="text/css"--%>
<%--          media="screen" />--%>

<%--    <meta name="generator"--%>
<%--          content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />--%>
<%--    <title>JPetStore Demo</title>--%>
<%--    <meta content="text/html; charset=windows-1252"--%>
<%--          http-equiv="Content-Type" />--%>
<%--    <meta http-equiv="Cache-Control" content="max-age=0" />--%>
<%--    <meta http-equiv="Cache-Control" content="no-cache" />--%>
<%--    <meta http-equiv="expires" content="0" />--%>
<%--    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />--%>
<%--    <meta http-equiv="Pragma" content="no-cache" />--%>
<%--</head>--%>

<%--<body>--%>

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="images/logo-topbar.gif" /></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="viewCart"><img align="middle" name="img_cart"
                                    src="images/cart.gif" /></a> <img align="middle"
                                                                      src="images/separator.gif" />

            <%
                Account loginUser = (Account) session.getAttribute("loginUser");
                if (loginUser==null){
                    out.write("<a href=\"loginForm\">Sign In</a>");
                }else {
                    out.write("<a href=\"signOut\">Sign Out</a>");
                }
            %>


            <img align="middle" src="images/separator.gif" />
            <a href="editAccountForm">My Account</a> <img align="middle" src="images/separator.gif" />
            <a href="logForm">logs</a>
        </div>
    </div>


    <%--    <div id="Search">--%>
    <%--        <div id="SearchContent">--%>
    <%--            <form action="catalog/SearchProducts.jsp" method="post">--%>
    <%--                <input type="text" name="keyword" size="14" /> <input type="submit"--%>
    <%--                                                                      name="searchProducts" value="Search" />--%>
    <%--            </form>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <%--    <div id="QuickLinks">--%>
    <%--        <a href="catalog/Category.jsp"><img--%>
    <%--                src="images/sm_fish.gif" /></a> <img src="images/separator.gif" />--%>
    <%--        <a href="catalog/Category.jsp"><img--%>
    <%--                src="images/sm_dogs.gif" /></a> <img src="images/separator.gif" />--%>
    <%--        <a href="catalog/Category.jsp"><img--%>
    <%--                src="images/sm_reptiles.gif" /></a> <img--%>
    <%--            src="images/separator.gif" /> <a href="catalog/Category.jsp"><img--%>
    <%--            src="images/sm_cats.gif" /></a> <img src="images/separator.gif" />--%>
    <%--        <a href="catalog/Category.jsp"><img--%>
    <%--                src="images/sm_birds.gif" /></a>--%>
    <%--    </div>--%>


    <div id="Search">
        <div id="SearchContent">
            <form action="search" method="post">
                <input type="text" name="keyword" size="14" /> <input type="submit"
                                                                      name="searchProducts" value="Search" />
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="viewCategory?categoryId=FISH"><img
                src="images/sm_fish.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=DOGS"><img
                src="images/sm_dogs.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=REPTILES"><img
                src="images/sm_reptiles.gif" /></a> <img
            src="images/separator.gif" /> <a href="viewCategory?categoryId=CATS"><img
            src="images/sm_cats.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=BIRDS"><img
                src="images/sm_birds.gif" /></a>
    </div>
</div>
