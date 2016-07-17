<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
    <link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css"/>" />
    <script src="//cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div class="help"><a href="<c:url value="/doLogout"/>">登出</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li class="current"><a href="<c:url value="/user/manage"/> ">首页</a></li>
			<li><a href="<c:url value="/user/list"/> ">用户</a></li>
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
		<h2>管理首页</h2>
		<div id="welcome" class="manage">
			<div class="shadow">
				<em class="corner lb"></em>
				<em class="corner rt"></em>
				<div class="box">
					<div class="msg">
						<p>欢迎回来，后台管理系统欢迎您</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 北风教育 All Rights Reserved. 沪ICP证1000001号
</div>
</body>
</html>
