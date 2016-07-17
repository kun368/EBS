<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css"/>" />
	<script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <c:url value="/user/doDelete//" var="deleteurl"/>
    <script type="application/javascript">
        function fuckDelete(id) {
            if(confirm("确认删除此用户，谨慎啊！？")) {
                $.get('${deleteurl}' + id, {});
                location.reload();
            }
        }
    </script>
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
		<h2>用户管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>Email</th>
					<th>手机</th>
					<th>操作</th>
				</tr>
                <c:forEach items="${userList}" var="user" varStatus="status">
                    <tr>
                        <td class="first w4 c">${user.id}</td>
                        <td class="w1 c">${user.nickName}</td>
                        <td class="w2 c">${user.sex}</td>
                        <td>${user.email}</td>
                        <td class="w4 c">${user.phone}</td>
                        <c:url value="/user/modify/${user.id}" var="modifyurl"/>
                        <td class="w1 c">
                            <a href="${modifyurl}">修改</a>
                            <a href="javascript:void(0);" onclick="fuckDelete(${user.id})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
			</table>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 北风教育 All Rights Reserved. 沪ICP证1000001号
</div>
</body>
</html>
