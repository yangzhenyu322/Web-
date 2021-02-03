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
    <link rel="StyleSheet" href="css/searchProduct.css" type="text/css" media="screen" />
    <style>
        html{
            height: 879px;
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