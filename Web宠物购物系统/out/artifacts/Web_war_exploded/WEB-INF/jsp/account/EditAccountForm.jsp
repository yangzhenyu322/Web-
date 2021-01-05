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
<%@include file="../common/IncludeTop.jsp"%>

<div id="Content">

    <div id="Catalog">


        <form action="editAccount" method="post">

            <h3>User Information</h3>
            <h4><font color="red">${sessionScope.msg}</font></h4>

            <table>
                <tbody>
                <tr>
                    <td>User ID:</td>
                    <td>User-${sessionScope.account_id}</td>
                </tr>
                <tr>
                    <td>New password:</td>
                    <td><input id="stripes--517137302" name="account.password"
                               type="text"><script type="text/javascript">
                        setTimeout(
                            function() {
                                try {
                                    var z = document
                                        .getElementById('stripes--517137302');
                                    z.focus();
                                    z.select();
                                } catch (e) {
                                }
                            }, 1);
                    </script></td>
                </tr>
                <tr>
                    <td>Repeat password:</td>
                    <td><input name="account.repeatedPassword" type="text"></td>
                </tr>
                </tbody>
            </table>

            <h3>Account Information</h3>
            <table>
                <tbody>
                <tr>
                    <td>FirstName:</td>
                    <td><input name="account.firstName" value="${sessionScope.account_firstName}" type="text"></td>
                </tr><tr>
                    <td>LastName:</td>
                    <td><input name="account.lastName" value="${sessionScope.account_lastName}" type="text"></td>
                </tr>
                <%--                <tr>--%>
                <%--                    <td>Last name:</td>--%>
                <%--                    <td><input name="account.lastName" value="XYX" type="text"></td>--%>
                <%--                </tr>--%>
                <tr>
                    <td>Email:</td>
                    <td><input name="account.email"
                               value="${sessionScope.account_email}" type="text" size="40"></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input name="account.phone" value="${sessionScope.account_phone}"
                               type="text"></td>
                </tr>
                <tr>
                    <td>Address 1:</td>
                    <td><input name="account.address1"
                               value="${sessionScope.account_address1}" type="text" size="40"></td>
                </tr>
                <tr>
                    <td>Address 2:</td>
                    <td><input name="account.address2" value="${sessionScope.account_address2}"
                               type="text" size="40"></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input name="account.city" value="${sessionScope.account_city}" type="text"></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><input name="account.state" value="${sessionScope.account_state}" type="text"
                               size="4"></td>
                </tr>
                <tr>
                    <td>Zip:</td>
                    <td><input name="account.zip" value="${sessionScope.account_zip}" type="text"
                               size="10"></td>
                </tr>
                <tr>
                    <td>Country:</td>
                    <td><input name="account.country" value="${sessionScope.account_country}" type="text"
                               size="15"></td>
                </tr>
                </tbody>
            </table>

            <h3>Profile Information</h3>

            <table>
                <tbody>
                <tr>
                    <td>Language Preference:</td>
                    <td><select name="account.languagePreference" >
                        <option  value="english">english</option>
                        <option value="chinese">chinese</option>
                        <option selected="selected" value="${sessionScope.account_languagePreference}">${sessionScope.account_languagePreference}</option>
                    </select></td>
                </tr>
                <tr>
                    <td>Favourite Category:</td>
                    <td><select name="account.favouriteCategoryId">
                        <option value="FISH">FISH</option>
                        <option selected="selected" value="DOGS">DOGS</option>
                        <option value="REPTILES">REPTILES</option>
                        <option value="CATS">CATS</option>
                        <option value="BIRDS">BIRDS</option>
                        <option selected="selected" value="${sessionScope.account_favouriteCategoryId}">${sessionScope.account_favouriteCategoryId}</option>

                    </select></td>
                </tr>
                <tr>
                    <td>Enable MyList</td>
                    <td><input name="account.listOption" value="true"
                               type="checkbox" checked="checked"></td>
                </tr>
                <tr>
                    <td>Enable MyBanner</td>
                    <td><input name="account.bannerOption" value="true"
                               type="checkbox" checked="checked"></td>
                </tr>

                </tbody>
            </table>


            <input name="editAccount" value="Save Account Information"
                   type="submit">

        </form>

        <a href="listOrders">My Orders</a>&nbsp;&nbsp;&nbsp;<a href="ItemHistory">My History</a>
    </div>

</div>

<%@include file="../common/IncludeBottom.jsp"%>

</body>
</html>