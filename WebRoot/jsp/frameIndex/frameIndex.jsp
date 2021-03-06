<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="../include/commonCss.jsp" %>
	<link type="text/css" rel="stylesheet" href="${basepath}/css/frameCommon.css"  >
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	

  </head>
  
  <body>
    <nav class="frame-navbar" role="navigation">
		<div class="container-fluid"></div>
		<div class="navbar-header "><label class="navbar-brand color-white">所在位置:
		<c:if test="${menuName !=null}">${menuName}</c:if>
		</label></div>
		<div class="clean-both"></div>
		
	</nav>
	<div id="ajaxShow"></div>
	
  </body>
  <%@ include file="../include/commonJs.jsp" %>
  <script type="text/javascript">
		$(function(){
			(function longPolling(){
				$.ajax({
					url:"ajax",
					data:{"timed": new Date().getTime()},
					type:"post",
					dataType:"text",
					timeout:15000,
					success:function(data,textStatus){
						$("#ajaxShow").append("data:"+data+";textStatus:"+textStatus+"<br/>");
						if(textStatus=="success"){
							longPolling();
						}
						
					},
					error:function(textStatus,errorThrown){
						$("#ajaxShow").append("errorThrown:"+errorThrown+";textStatus:"+textStatus+"<br/>");
						if(textStatus=="timeout"){
							longPolling();
						}else{
							longPolling();
						}
					}
						
				});
			})();
		});
	</script>
</html>
