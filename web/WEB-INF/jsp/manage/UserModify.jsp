<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css"/>" />
</head>
<body>
<div id="header" class="wrap">
	<div class="help"><a href="<c:url value="/doLogout"/>">登出</a></div>
	<div class="navbar">
		<ul class="clearfix">
            <li><a href="<c:url value="/user/manage"/> ">首页</a></li>
            <li class="current"><a href="<c:url value="/user/list"/> ">用户</a></li>
		</ul>
	</div>
</div>
<div id="childNav">
    <div class="welcome wrap">
        管理员"${user.nickName}"您好，欢迎回到管理后台。<span id="showTime"></span>
    </div>
</div>
<script type="application/javascript">
    var Today=new Date();
    document.getElementById("showTime").innerHTML = "今天日期是 " + Today.getFullYear()+ " 年 " + (Today.getMonth()+1) + " 月 " + Today.getDate() + " 日";
</script>
<div id="position" class="wrap">
	您现在的位置：管理后台
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
                <dt>用户管理</dt>
                <dd><em>
                    <a href="<c:url value="/user/add"/> ">新增</a></em>
                    <a href="<c:url value="/user/list"/>">用户管理</a>
                </dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>修改用户</h2>
		<div class="manage">
            <c:url value="/user/doModify/${id}" var="domodifyurl"/>
			<form method="post" action="${domodifyurl}">
				<table class="form">
					<tr>
						<td class="field">用户名：</td>
						<td><input type="text" class="text" name="userName" value="${userName}" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">姓名：</td>
						<td><input type="text" class="text" name="name" value="${name}" /></td>
					</tr>
					<tr>
						<td class="field">密码：</td>
						<td><input type="text" class="text" name="passWord" value="${passWord}" /></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
                        <c:if test="${sexId eq 1}">
                            <td><input type="radio" name="sex" value="男" checked="checked" />男
                                <input type="radio" name="sex" value="女" />女
                            </td>
                        </c:if>
                        <c:if test="${sexId eq 2}">
                            <td><input type="radio" name="sex" value="男" />男
                                <input type="radio" name="sex" value="女" checked="checked"/>女
                            </td>
                        </c:if>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="mobile" value="${mobile}" /></td>
					</tr>
                    <tr>
                        <td class="field">电子邮箱：</td>
                        <td><input type="text" class="text" name="email" value="${email}" /></td>
                    </tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="更新" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 北风教育 All Rights Reserved. 沪ICP证1000001号
</div>
</body>
</html>
