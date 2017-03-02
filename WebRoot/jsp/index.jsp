﻿<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Home</title>
		<%@ include file="include/commonCss.jsp" %>
		
		

	</head>

	<body>
		<div id="wrapper">
			<nav class="navbar navbar-default top-navbar" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
                	</button>
					<a class="navbar-brand"  href="index"><img src="img/logo.png" style="width:30px;float:left;display:table-cell;vertical-align: middle;margin-right: 10px"/> <strong>Personal-Sys</strong></a>
				</div>

				<ul class="nav navbar-top-links navbar-right">
					<!-- dropdown header-right -->
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
							<i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
						</a>
						<!-- dropdown-messages -->
						<ul class="dropdown-menu dropdown-messages">
							<li>
								<a class="text-center" href="#">
									<strong>Read All Messages</strong>
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</ul>
					</li>
					<!-- /.dropdown -->
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
							<i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
						</a>
						<ul class="dropdown-menu dropdown-tasks">
							<li>
								<a href="#">
									<div>
										<p>
											<strong>Task 1</strong>
											<span class="pull-right text-muted">60% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
												<span class="sr-only">60% Complete (success)</span>
											</div>
										</div>
									</div>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">
									<div>
										<p>
											<strong>Task 2</strong>
											<span class="pull-right text-muted">28% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" style="width: 28%">
												<span class="sr-only">28% Complete</span>
											</div>
										</div>
									</div>
								</a>
							</li>

							<li class="divider"></li>
							<li>
								<a class="text-center" href="#">
									<strong>See All Tasks</strong>
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</ul>
						<!-- /.dropdown-tasks -->
					</li>
					<!-- /.dropdown -->
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
							<i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
						</a>
						<ul class="dropdown-menu dropdown-alerts">
							<li>
								<a href="#">
									<div>
										<i class="fa fa-comment fa-fw"></i> New Comment
										<span class="pull-right text-muted small">4 min</span>
									</div>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">
									<div>
										<i class="fa fa-twitter fa-fw"></i> 3 New Followers
										<span class="pull-right text-muted small">12 min</span>
									</div>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a class="text-center" href="#">
									<strong>See All Alerts</strong>
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</ul>
						<!-- /.dropdown-alerts -->
					</li>
					<!-- /.dropdown -->
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
							<i class="fa fa-user fa-fw"></i>
 							<% String userName = session.getAttribute("userName").toString(); %>
 							<%=userName%>&nbsp;<i class="fa fa-caret-down"></i>
						</a>
						<ul class="dropdown-menu dropdown-user">
							<li>
								<a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
							</li>
							<li>
								<a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
							</li>
						</ul>
						<!-- /.dropdown-user -->
					</li>
					<!-- /.dropdown -->
				</ul>
				<!-- /.dropdown header-right -->
			</nav>
			<!--/. NAV TOP  -->
			<nav class="navbar-default navbar-side" role="navigation">
				<div id="sideNav" href=""><i class="fa fa-caret-right"></i></div>
				<div class="sidebar-collapse">
					<ul class="nav" id="main-menu">
						<c:forEach items="${menu}" var="thisMenu" varStatus="status">
							<c:if test="${status.index == 0 }">
								<c:set var="activeMenu" value="active-menu"></c:set>
							
							</c:if>
							<c:if test="${status.index != 0 }">
								<c:set var="activeMenu" value=""></c:set>
							</c:if>
							<c:if test="${thisMenu.parent.menuChild == '1'}" >
								<li class="dropdown ${activeMenu}"><a class="dropdown-toggle" data-toggle="dropdown" menuNum="${thisMenu.parent.menuNum}">${thisMenu.parent.menuName}<span class="fa arrow"></span></a>
									<ul class="nav nav-second-level">
										<c:forEach items="${thisMenu.children}" var="childMenu">
										
										<li><a  class="menuAddr" menuNum="${childMenu.menuNum}" menuAddr="<%=basePath%>${childMenu.menuAddr}">${childMenu.menuName}</a></li>
										</c:forEach>
									</ul>
								</li>
							</c:if>
							<c:if test="${thisMenu.parent.menuChild != '1'}"><li class="${activeMenu}"><a class="menuAddr" menuAddr="<%=basePath%>${thisMenu.parent.menuAddr}" menuNum="${thisMenu.parent.menuNum}" >${thisMenu.parent.menuName}</a></li></c:if>  				
						</c:forEach>
						
						
					</ul>

				</div>

			</nav>
			<!-- /. NAV SIDE  -->
			<div id="page-wrapper">
				<div id="page-inner">

					<div class="row">
						<div class="col-md-12">
							<h1 class="page-header">
                            Dashboard <small>Summary of your App</small>
                        </h1>
							<ol class="breadcrumb">
								<li>
									<a href="#">Home</a>
								</li>
								<li>
									<a href="#">Library</a>
								</li>
								<li class="active">Data</li>
							</ol>
						</div>
					</div>

					<!-- /. ROW  -->
					<div class="row">
						<div class="col-md-9 col-sm-12 col-xs-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									Bar Chart Example
								</div>
								<div class="panel-body">
									<div id="morris-bar-chart"></div>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-sm-12 col-xs-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									Donut Chart Example
								</div>
								<div class="panel-body">
									<div id="morris-donut-chart"></div>
								</div>
							</div>
						</div>

					</div>
					
					<!-- /. ROW  -->


					<footer>
						<p>Copyright &copy; 2017.Z.X.L All rights reserved.
						</p>

					</footer>
				</div>
				<!-- /. PAGE INNER  -->
			</div>
			<!-- /. PAGE WRAPPER  -->
		</div>
		<!-- /. WRAPPER  -->
		<!-- JS Scripts-->
		<!-- jQuery Js -->
		<%@ include file="include/commonJs.jsp" %>
		<!-- Metis Menu Js -->
		<script src="js/jquery.metisMenu.js"></script>
		<!-- Morris Chart Js -->
		<script src="js/morris/raphael-2.1.0.min.js"></script>
<!--		<script src="assets/js/morris/morris.js"></script>-->

		<script src="js/easypiechart.js"></script>
		<script src="js/easypiechart-data.js"></script>

		<script src="js/Lightweight-Chart/jquery.chart.js"></script>

		<!-- Custom Js -->
		<script src="js/custom-scripts.js"></script>
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
						var text = "<li><a href=\"#\"><div><strong>John Doe</strong><span class=\"pull-right text-muted\"><em>"+data+"</em></span></div><div>"+textStatus+"</div></a></li><li class=\"divider\"></li>";
						
						$(".dropdown-messages").prepend(text);
						if(textStatus=="success"){
							longPolling();
						}
						
					},
					error:function(textStatus,errorThrown){
						var text = "<li><a href=\"#\"><div><strong>John Doe</strong><span class=\"pull-right text-muted\"><em>"+errorThrown+"</em></span></div><div>"+textStatus+"</div></a></li><li class=\"divider\"></li>";
						
						$(".dropdown-messages").prepend(text);
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

	</body>

</html>