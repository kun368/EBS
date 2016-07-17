<%--
  Created by IntelliJ IDEA.
  User: SDUST-132
  Date: 2016/7/10
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录页</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css"/>" />
</head>
<body>
<div id="register" class="wrap">
    <div class="shadow">
        <em class="corner lb"></em>
        <em class="corner rt"></em>
        <div class="box">
            <h1>欢迎登录EBS后台用户管理系统</h1>
            <c:url var="dologin" value="/doLogin"/>
            <form id="loginForm" method="post" action="${dologin}">
                <table>
                    <tr>
                        <td class="field">用户名：</td>
                        <td><input class="text" type="text" name="userName" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">登录密码：</td>
                        <td><input class="text" type="password" id="passWord" name="passWord" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><label class="ui-green"><input type="submit" name="submit" value="立即登录" /></label></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="footer">
    <h4 style="color: red">万能上帝账号：admin，admin</h4>
    Copyright &copy; 2016 北风教育 All Rights Reserved. 沪ICP证1000001号
</div>

<c:if test="${!empty tip}">
    <script>
        alert('${tip}');
    </script>
</c:if>

</body>
</html>
