<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>JPetStore Demo</title>
    <style>

        h2 {
            margin: 2ex 0ex 1ex 0ex;
            padding: 0ex;
            line-height: 2ex;
            font-weight: 700;
            color: #444;
        }
        p {
            font-family: helvetica, tahoma, arial, verdana, sans-serif;

            margin: 0ex 0ex 0ex 0ex;
            padding: 2ex;
        }

        a, a:visited, a:link {
            color: #039;

            text-decoration: none;
            font-family: helvetica, tahoma, arial, verdana, sans-serif;
        }

        a:hover {
            color: #69f;
        }

        #Content{
            width: 90%;
            height: 90%;
            background-image:url("images/background.jpeg");
            background-repeat:no-repeat;
            background-size:100% 100%;

            text-align: center; /*让div内部文字居中*/
            border-radius: 20px;
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        #center {
            position: fixed;
            top: 50%;
            left: 50%;
            width:50%;
            height: 50%;
            -webkit-transform: translateX(-50%) translateY(-50%);
        }
    </style>
</head>

<body>
<div id="Content">
    <div id="center">
        <h2>Welcome to JPetStore 6</h2>

        <p>
            <a href="main">Enter the Store</a>
        </p>
        <p>
            <sub>Copyright www.mybatis.org </sub>
        </p>
    </div>

</div>
</body>
</html>
