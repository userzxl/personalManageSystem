<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<!-- saved from url=(0045)http://127.0.0.1:8020/ManageSystem/index.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>梦幻西游工具</title>	
		<%@ include file="../include/commonCss.jsp" %>
		<link type="text/css" rel="stylesheet" href="${basepath}/css/frameCommon.css"  >
		
	</head>
	<body>
		<div class="content content_table">
                                <div id="list2" class="dd max_width_auto">
                                    <ol class="dd-list">
                                        <li data-id="13" class="dd-item dd3-item">
                                            <div class="dd-handle dd3-handle fa fa-book dd_listIcon"></div>
                                            <div class="dd3-content">基础运维
                                                <ul class="list-inline list-unstyled menu_info" style="width: 50%;float: right;">
                                                    <li>menu_manage.html</li>
                                                    <li><a class="btn btn-warning btn-xs" href="menu_edit.html" data-original-title="添加" data-toggle="tooltip"><i class="fa fa-plus"></i></a> 
                                                    	<a class="btn btn-primary btn-xs" href="menu_edit.html" data-original-title="编辑" data-toggle="tooltip"><i class="fa fa-pencil"></i></a> 
                                                    	<a class="btn btn-danger btn-xs"  href="#" data-original-title="删除" data-toggle="tooltip"><i class="fa fa-times"></i></a>
                                                    	<a class="btn btn-default btn-xs md-trigger btn_allot"  data-modal="form-primary"  data-original-title="分配按钮" data-toggle="tooltip"><i class="fa  fa-cogs"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <button >123</button>
                                            <ol class="dd-list" style="">
                                                <li data-id="14" class="dd-item dd3-item">
                                                    <div class="dd-handle dd3-handle fa fa-plus-circle dd_listIcon"></div>
                                                    <div class="dd3-content">按钮管理
                                                        <ul class="list-inline list-unstyled menu_info" style="width: 50%;float: right;">
                                                            <li>menu_manage.html</li>
                                                            <li><a class="btn btn-warning btn-xs" href="menu_edit.html" data-original-title="添加" data-toggle="tooltip"><i class="fa fa-plus"></i></a> 
                                                            	<a class="btn btn-primary btn-xs" href="menu_edit.html" data-original-title="编辑" data-toggle="tooltip"><i class="fa fa-pencil"></i></a> 
                                                            	<a class="btn btn-danger btn-xs"  href="#" data-original-title="删除" data-toggle="tooltip"><i class="fa fa-times"></i></a>
                                                            	<a class="btn btn-default btn-xs md-trigger btn_allot"  data-modal="form-primary"  data-original-title="分配按钮" data-toggle="tooltip"><i class="fa  fa-cogs"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li data-id="15" class="dd-item dd3-item">
                                                    <div class="dd-handle dd3-handle fa fa-tasks dd_listIcon"></div>
                                                    <div class="dd3-content">菜单管理</div>
                                                    <ol class="dd-list" style="">
                                                        <li data-id="16" class="dd-item dd3-item">
                                                            <div class="dd-handle dd3-handle fa fa-bars dd_listIcon"></div>
                                                            <div class="dd3-content">区域管理</div>
                                                        </li>
                                                        <li data-id="17" class="dd-item dd3-item">
                                                            <div class="dd-handle dd3-handle dd_listIcon"></div>
                                                            <div class="dd3-content">数据字典</div>
                                                        </li>
                                                        <li data-id="18" class="dd-item dd3-item">
                                                            <div class="dd-handle dd3-handle fa fa-envelope dd_listIcon"></div>
                                                            <div class="dd3-content">日志管理</div>
                                                        </li>
                                                    </ol>
                                                </li>
                                            </ol>
                                        </li>
                                    </ol>
                                </div>
                                <div class="spacer2">
                                    <h4>Serialized Output:</h4>
                                    <pre><code id="out2"></code></pre>
                                </div>
                            </div>
	

</body>
<%@ include file="../include/commonJs.jsp" %>

</html>