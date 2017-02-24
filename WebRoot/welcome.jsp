<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/include.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome!</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/welcome.css" />
	
  </head>
  
  <body>
  	<div class="container">
  		<div class="nav">
  			<img class="navbar-left navbar-logo" src="img/logo.png" />
			<div class="navbar-header "><a class="navbar-brand color-white">PersonalManageSystem</a></div>
			    <%  if(session.getAttribute("userName") == null) {  %>  
		            <a class="login" href=${path}login>登录</a>
 				<% }else{  %> 
 				<% String userName = session.getAttribute("userName").toString();  %>
 					<a class="login" href=${path}index>进入系统</a><span class="login"><%=userName%>&nbsp;&nbsp;&nbsp;</span> 
				<% } %>  
  		</div>
  		<div class="article">
  			<h1 class="welcome-title">PersonalManageSystem </h1>
  			<p class="welcome-words">Stray birds of summer come to my window to sing and fly away.And yellow leaves of autumn, which no songs,flutter and fall there with a sign. </p>
  		</div>
  	</div>
  	
     <br>
  </body>
</html>
