<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
    <form:form method="post" action="user/info">
    	<table>
    		<tr>
    			<th>id</th><th>name</th><th>age</th>
    		</tr>
    		<tr>
    			<td>1</td><td><%=basePath%></td><td>13</td>
    		</tr>
    		<tr>
    			<td>2</td><td>hi</td><td>14</td>
    		</tr>
    		<tr>
    			<td colspan="3"><input type="submit" value="提交" /></td>
    	</table>
    </form:form>
  </body>
</html>
