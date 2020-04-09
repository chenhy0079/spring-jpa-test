<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/8
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>展示列表</title>

    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>


    <style type="text/css">
        body {
            background-color:#00b38a;
            text-align:center;
        }

        .lp-login {
            position:absolute;
            width:500px;
            height:300px;
            top:50%;
            left:50%;
            margin-top:-250px;
            margin-left:-250px;
            background: #fff;
            border-radius: 4px;
            box-shadow: 0 0 10px #12a591;
            padding: 57px 50px 35px;
            box-sizing: border-box
        }


        .lp-login .submitBtn {
            display:block;
            text-decoration:none;
            height: 48px;
            width: 150px;
            line-height: 48px;
            font-size: 16px;
            color: #fff;
            text-align: center;
            background-image: -webkit-gradient(linear, left top, right top, from(#09cb9d), to(#02b389));
            background-image: linear-gradient(90deg, #09cb9d, #02b389);
            border-radius: 3px
        }


        input[type='text,submit'] {
            height:30px;
            width:250px;
        }

        span {
            font-style: normal;
            font-variant-ligatures: normal;
            font-variant-caps: normal;
            font-variant-numeric: normal;
            font-variant-east-asian: normal;
            font-weight: normal;
            font-stretch: normal;
            font-size: 14px;
            line-height: 22px;
            font-family: "Hiragino Sans GB", "Microsoft Yahei", SimSun, Arial, "Helvetica Neue", Helvetica;
        }

    </style>
</head>
<body>


<table class="lp-login" >

    <tr>
        <th align="right"><span>姓名</span></th>
        <th align="center"><span>地址</span></th>
        <th align="center"><span>电话</span></th>
        <th align="center"><span>操作</span></th>
        <th align="center"><button><a href="/add.jsp">添加</a> </button></th>
        <th align="center"><button><a href="/resume/logout">退出</a> </button></th>
    </tr>
    <c:forEach items="${resumes}" var="resume">
        <tr>
            <td align="center">
                <c:out value="${resume.name}"></c:out>
            </td>
            <td align="center">
                <c:out value="${resume.address}"></c:out>
            </td>
            <td align="center">
                <c:out value="${resume.phone}"></c:out>
            </td>
            <td align="center">
                <a href="/resume/delete?id=${resume.id}">删除</a>
                <a href="/resume/queryOne?id=${resume.id}">编辑</a>
            </td>
    </c:forEach>
</table>
</body>
</html>
