<%--
  Created by IntelliJ IDEA.
  User: 杨震宇
  Date: 2020/11/10
  Time: 19:35
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

<%@include file="../common/IncludeTop.jsp"%>
<div id="Content">


    <div id="Welcome">
        <div id="WelcomeContent">
            Welcome to MyPetStore!
        </div>
    </div>

    <div id="Main">
        <div id="Sidebar">
            <div id="SidebarContent">
                <a href="viewCategory?categoryId=FISH"><img src="images/fish_icon.gif" /></a>
                <br/> Saltwater, Freshwater <br/>
                <a href="viewCategory?categoryId=DOGS"><img src="images/dogs_icon.gif" /></a>
                <br /> Various Breeds <br />
                <a href="viewCategory?categoryId=CATS"><img src="images/cats_icon.gif" /></a>
                <br /> Various Breeds, Exotic Varieties <br />
                <a href="viewCategory?categoryId=REPTILES"><img src="images/reptiles_icon.gif" /></a>
                <br /> Lizards, Turtles, Snakes <br />
                <a href="viewCategory?categoryId=BIRDS"><img src="images/birds_icon.gif" /></a>
                <br /> Exotic Varieties
            </div>
        </div>

        <div id="MainImage">
            <div id="MainImageContent">
                <map name="estoremap">
                    <area alt="Birds" coords="72,2,280,250" href="viewCategory?categoryId=BIRDS" shape="rect" />
                    <area alt="Fish" coords="2,180,72,250" href="viewCategory?categoryId=FISH" shape="rect" />
                    <area alt="Dogs" coords="60,250,130,320" href="viewCategory?categoryId=DOGS" shape="rect" />
                    <area alt="Reptiles" coords="140,270,210,340" href="viewCategory?categoryId=REPTILES" shape="rect" />
                    <area alt="Cats" coords="225,240,295,310" href="viewCategory?categoryId=CATS" shape="rect" />
                    <area alt="Birds" coords="280,180,350,250" href="viewCategory?categoryId=BIRDS" shape="rect" />
                </map>
                <img height="355" src="images/splash.gif" align="middle" usemap="#estoremap" width="350" />
            </div>
        </div>
        <div id="Separator">&nbsp;</div>
    </div>

</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>
