<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1 user-scalable=no">
		<title>地图工具</title>
		<%@ include file="../include/commonCss.jsp" %>
		<link type="text/css" rel="stylesheet" href="${basepath}/css/frameCommon.css">
	    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
	</head>

	<body>
		<div id='container'></div>
		<div class="button-group">
			<input type="button" class="button" value="获取轨迹" id="getTrack"/>
			<input type="button" class="button" value="坐标转换" id="transPoint"/>
		    <input type="button" class="button" value="开始动画" id="start"/>
		    <input type="button" class="button" value="暂停动画" id="pause"/>
		    <input type="button" class="button" value="继续动画" id="resume"/>
		    <input type="button" class="button" value="停止动画" id="stop"/>		  		
		</div>
		
		
	</body>
	<%@ include file="../include/commonJs.jsp" %>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=21b244ca789b71c1eb9fcbcb9e8c4e57"></script>
		<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
		<script>
			var city;	
			var ip = jQuery.getScript("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js",function(data){   
			     city = remote_ip_info["city"];    ;
			    }) ; 
			
				    
			var map = new AMap.Map('container', {
			    resizeEnable: true,
			    zoom:15,       
			});
			map.setCity(city);			
		    //地图中添加地图操作ToolBar插件
		    map.plugin(['AMap.ToolBar'], function() {
		        //设置地位标记为自定义标记
		        var toolBar = new AMap.ToolBar();
		        map.addControl(toolBar);
		    });
		    /* marker = new AMap.Marker({
		        map: map,
		        position: [centerLon, centerLat],
		        icon: "http://webapi.amap.com/images/car.png",
		        offset: new AMap.Pixel(-26, -13),
		        autoRotation: true,
		        
		    }); */
		    $("#getTrack").click(function(){
		    	getTrack();
		    })
		    $("#transPoint").click(function(){
		    	transPoint();
		    })
		    function transPoint(){
		    	$.ajax({ 
		    		data:{},
		    		url: "<%=basePath%>selfUtils/mapUtils/transPoint", 
		    		dataType:"json",
		    		type:"POST",
		    		success: function(data){
			        	var listFlag=0;
						var list = eval(data);
						$.each(list,function (index,item){
							centerLat = item.latitude;
							centerLon = item.longitude;
							$.ajax({ 
					    		data:{},
					    		url: "http://restapi.amap.com/v3/assistant/coordinate/convert?locations="+item.longitude+","+item.latitude+"&coordsys=gps&output=JSON&key=46c7f10b6fc12f75717045c128796369", 
					    		dataType:"json",
					    		type:"GET",
					    		success: function(data){	
					    			item.longitude = data.locations.split(",")[0];				    			
					    			item.latitude = data.locations.split(",")[1];					    			
					    			item.word4 = 1;
					    			listFlag++;
					    			if(listFlag == list.length){
					    				sendTransPoints(list);
					    				
					    			}
					    			
					    			
					    		}
							});
							
							
						});
						
					}
				});
			}	
			function sendTransPoints(list){
				list = JSON.stringify(list);
				$.ajax({ 
		    		data:{"transPoints":list},
		    		url: "<%=basePath%>selfUtils/mapUtils/transPointSave", 
		    		dataType:"json",
		    		type:"POST",
		    		
		    		success: function(data){	
		    		}
				});	
			}
				
			
		    function getTrack(){
		    	$.ajax({ 
		    		data:{},
		    		url: "<%=basePath%>selfUtils/mapUtils/getTrack", 
		    		dataType:"json",
		    		type:"POST",
		    		success: function(data){
		    			console.log(data);
			        	var marker, lineArr = [];
						var list = eval(data);
						var centerLat=0;
						var longitude=0;
						$.each(list,function (index,item){
							if(index == 0){
								centerLat = item.latitude;
								centerLon = item.longitude;
							}
							lineArr.push([item.longitude,item.latitude]);
						});			    
						var map = new AMap.Map("container", {
					        resizeEnable: true,
					        center: [centerLon, centerLat],
					        zoom: 17,
					        convert: true
					    });
					    marker = new AMap.Marker({
					        map: map,
					        position: [centerLon, centerLat],
					        icon: "http://webapi.amap.com/images/car.png",
					        offset: new AMap.Pixel(-26, -13),
					        autoRotation: true,
					        
					    });		
					    // 绘制轨迹
					    var polyline = new AMap.Polyline({
					        map: map,
					        path: lineArr,
					        strokeColor: "#00A",  //线颜色
					        // strokeOpacity: 1,     //线透明度
					        strokeWeight: 3,      //线宽
					        // strokeStyle: "solid"  //线样式
					    });
					    var passedPolyline = new AMap.Polyline({
					        map: map,
					        // path: lineArr,
					        strokeColor: "#F00",  //线颜色
					        // strokeOpacity: 1,     //线透明度
					        strokeWeight: 3,      //线宽
					        // strokeStyle: "solid"  //线样式
					    });					
					    marker.on('moving',function(e){
					        passedPolyline.setPath(e.passedPath);
					    });
					    map.setFitView();			
					    AMap.event.addDomListener(document.getElementById('start'), 'click', function() {
					        marker.moveAlong(lineArr, 500);
					    }, false);
					     AMap.event.addDomListener(document.getElementById('pause'), 'click', function() {
					        marker.pauseMove();
					       }, false);
					      AMap.event.addDomListener(document.getElementById('resume'), 'click', function() {
					        marker.resumeMove();
					    }, false);
					    AMap.event.addDomListener(document.getElementById('stop'), 'click', function() {
					        marker.stopMove();
					    }, false);			
			     	}
			     });
		    
		    	
		    }
			
		</script>

</html>
