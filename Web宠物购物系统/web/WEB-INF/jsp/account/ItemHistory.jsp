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

    <%@include file="../common/IncludeTop.jsp"%>

    <div id="Content">
        <table>
            <tr>
                <h3>浏览记录</h3>
            </tr>

            <tr>
                <th>itemId</th>
                <th>productId</th>
                <th>category</th>
                <th>historyDate</th>
            </tr>
            <c:forEach var="itemHistory" items="${sessionScope.itemHistoryList}">
                <tr>
                    <td>
                        ${itemHistory.itemId}
                    </td>
                    <td>
                        ${itemHistory.productId}
                    </td>
                    <td>
                        ${itemHistory.category}
                    </td>
                    <td>
                        ${itemHistory.historyDate}
                    </td>
                </tr>
            </c:forEach>

        </table>
    </div>

    <%@include file="../common/IncludeBottom.jsp"%>
</body>
</html>
