<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>系统登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<link rel="stylesheet" type="text/css" href="css/login.css" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var marginTop=$(document).height()-$("#loginBar").height();

			$("#loginBar").css("margin-top",marginTop/2+"px");
			$(window).resize(function() {
			  marginTop=$(document).height()-$("#loginBar").height();

				$("#loginBar").css("margin-top",marginTop/2+"px");
			});
			/* 登录超时时，如果该页面时子页面，则父页面跳转到登录页  */
			 if(window.top!=window.self){
  				window.top.location = "login";
			 }
		})
	</script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<div id="loginBar">
  		<p class="login-bar-title">个人信息管理系统登录</p>
  		<form action="login/user" method="post">
  			<input value="admin" class="input-300" name="userName" type="text" />
  			<input value="123456" class="input-300" name="password" type="password" />
  			<input class="login-submit" value="登录" type="submit"/>
  		</form>
  	</div>
     
    
  </body>
</html>
