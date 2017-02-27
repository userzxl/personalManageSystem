<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>

<!DOCTYPE html>
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
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid"></div>
		<img class="navbar-left navbar-logo" src="${basepath}/img/logo.png" />
		<div class="navbar-header "><a href="#" class="navbar-brand color-white">个人信息管理系统</a></div>
		<div>
			<%-- <p class="pro_title"><img alt="" src="<%=basePath%>img/qm.png"><span>个人信息管理管理系统</span></p> --%>
			<ul id="menu" class="nav navbar-nav">
				<c:forEach items="${menu}" var="thisMenu" varStatus="status">
					<c:if test="${status.index == 0 }">
						<c:set var="activeMenu" value="active"></c:set>
					
					</c:if>
					<c:if test="${status.index != 0 }">
						<c:set var="activeMenu" value=""></c:set>
					</c:if>
					<c:if test="${thisMenu.parent.menuChild == '1'}" >
						<li class="dropdown ${activeMenu}"><a class="dropdown-toggle" data-toggle="dropdown" menuNum="${thisMenu.parent.menuNum}">${thisMenu.parent.menuName}<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<c:forEach items="${thisMenu.children}" var="childMenu">
								
								<li><a  class="menuAddr" menuNum="${childMenu.menuNum}" menuAddr="<%=basePath%>${childMenu.menuAddr}">${childMenu.menuName}</a></li>
								</c:forEach>
							</ul>
						</li>
					</c:if>
					<c:if test="${thisMenu.parent.menuChild != '1'}"><li class="${activeMenu}"><a class="menuAddr" menuAddr="<%=basePath%>${thisMenu.parent.menuAddr}" menuNum="${thisMenu.parent.menuNum}" >${thisMenu.parent.menuName}</a></li></c:if>  				
				</c:forEach>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class=""><a href="#" id="">个人信息</a></li>
				<li ><a href="logout" id="logout">退出</a></li>
			</ul>
		</div>		  	
	</nav>
	<div class="container-fluid frame-wrapper" id="pcont" style="height: 100%;">

              <iframe style="width: 100%;height: 101%;outline: none;border: 0;" id="contentFrame" name="contentFrame" src="frameIndex"></iframe>

          </div>
  </body>
  <script type="text/javascript">
		$(document).ready(function(){		
			$("a.menuAddr").click(function(){			
				var attrMenu=$(this).attr("menuAddr");
				$("#contentFrame").attr("src",attrMenu);
			})
		})
	</script>
</html>
