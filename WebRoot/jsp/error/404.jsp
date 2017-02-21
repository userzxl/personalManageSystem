<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '404.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/common.css" />

  </head>
  
  <body>
    <p>访问页面不存在,将在<span id="timeout">3</span>秒钟后跳转到首页</p>
    <script type="text/javascript">
 	var sometime = 3; 
 	window.setTimeout("redirect()",1000);   
    function redirect(){   
    	if(sometime !=1){ 
 			console.log(sometime--);
 			document.getElementById("timeout").innerHTML=sometime; 	
 			window.setTimeout("redirect()",1000);	
    	}else{
    		window.location.href ="<%=path%>/index";
    	}
    	
    }
    	
    </script>
 <%--  	<c:redirect url=${path}index></c:redirect> --%>

    
     <br>
  </body>
</html>
