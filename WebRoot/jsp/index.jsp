<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>

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
	<%@ include file="include/common.jsp" %>

	
  </head>
  
  <body>
  	<div id="webHeader">
  		<p class="pro_title"><img alt="" src="<%=basePath%>img/qm.png"><span>个人信息管理管理系统</span></p>
  		<ul id="menu" class="menu">
  			<c:forEach items="${menu}" var="thisMenu">
  				<c:if test="${thisMenu.menuParent == '0'}" var="hehe">
  					<li><a menuNum="${thisMenu.menuNum}" href="<%=basePath%>${thisMenu.menuAddr}">${thisMenu.menuName}</a></li>
  				</c:if>
  			</c:forEach>
  		</ul>
  		<a href="logout" id="logout">退出</a>
  	</div>
  	
     <br>
  </body>
</html>
