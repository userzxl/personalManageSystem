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
	    <style type="text/css">
			body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
			#map_canvas{width:100%;height:95%;}
			#result {width:100%}
		</style>
	</head>

	<body>
		<div id="map_canvas"></div> 
		<div id="result"></div>
		<button id="run">开始</button> 
		<button id="stop">停止</button> 
		<button id="pause">暂停</button> 
		<button id="hide">隐藏信息窗口</button> 
		<button id="show">展示信息窗口</button> 
		
	</body>
	<%@ include file="../include/commonJs.jsp" %>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=l1dl2qA9b35kzKv8gv7tHlV3Vnp0m8qi"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/library/LuShu/1.2/src/LuShu_min.js"></script>
		<script> 
			var map = new BMap.Map('map_canvas');
			map.enableScrollWheelZoom();
			
			var lushu;
			/* 获取坐标 */
			var centerLat=0;
			var longitude=0;
			var list = eval('${track}');
			var StartPoint;
			var EndPoint;
			var pointsArr = [];
			var trackIndex=1;
			var indexFlag=9;
			var convertor = new BMap.Convertor();
			jQuery.each(list,function (index,item){
				if(index == 0){									
					centerLon = item.longitude;
					centerLat = item.latitude;
					StartPoint = new BMap.Point(centerLon, centerLat);
					var pointArr = [];
					pointArr.push(StartPoint);
					convertor.translate(pointArr,1,5,function(data){
						StartPoint = data.points[0];
						pointsArr.push(StartPoint);
						map.centerAndZoom(StartPoint, 15);						
					});
				}
				else {
					centerLon1 = item.longitude;
					centerLat1 = item.latitude;
					EndPoint = new BMap.Point(centerLon1, centerLat1);
					var pointArr = [];
					pointArr.push(EndPoint);
					convertor.translate(pointArr,1,5,function(data){
						EndPoint = data.points[0];	
						pointsArr.push(EndPoint);					
						if(index == list.length-1){	
							paintTrack(indexFlag);
						}
					});
				}
			}); 
			function paintTrack(trackIndex){
				var pointArr =[];
				if(trackIndex*10 < list.length+1){
					for(var i = 0;i<10;i++){
						pointArr.push(pointsArr[list.length-trackIndex*10+i]);
					}	
					drv.search(StartPoint, EndPoint,{waypoints:pointArr});
					trackIndex++;
					paintTrack(trackIndex);
				}else{
					for(var i = (trackIndex-1)*10;i<list.length;i++){
						pointArr.push(pointsArr[list.length-trackIndex*10+i]);
					}	
					drv.search(StartPoint, EndPoint,{waypoints:pointArr});
				}
				
			}
			// 实例化一个驾车导航用来生成路线
		    var drv = new BMap.DrivingRoute('长春', {
		        onSearchComplete: function(res) {
		            if (drv.getStatus() == BMAP_STATUS_SUCCESS) {
		                var plan = res.getPlan(0);
		                var arrPois =[];
		                for(var j=0;j<plan.getNumRoutes();j++){
		                    var route = plan.getRoute(j);
		                    arrPois= arrPois.concat(route.getPath());
		                }
		                map.addOverlay(new BMap.Polyline(arrPois, {strokeColor: '#111'}));
		                map.setViewport(arrPois);
		                
		                lushu = new BMapLib.LuShu(map,arrPois,{
		                defaultContent:"",//"从天安门到百度大厦"
		                autoView:true,//是否开启自动视野调整，如果开启那么路书在运动过程中会根据视野自动调整
		                icon  : new BMap.Icon('http://developer.baidu.com/map/jsdemo/img/car.png', new BMap.Size(52,26),{anchor : new BMap.Size(27, 13)}),
		                speed: 1000,
		                enableRotation:true,//是否设置marker随着道路的走向进行旋转
		                landmarkPois: [
		                   {lng:116.314782,lat:39.913508,html:'加油站',pauseTime:2},
		                   {lng:116.315391,lat:39.964429,html:'高速公路收费<div><img src="http://map.baidu.com/img/logo-map.gif"/></div>',pauseTime:3},
		                   {lng:116.381476,lat:39.974073,html:'肯德基早餐<div><img src="http://ishouji.baidu.com/resource/images/map/show_pic04.gif"/></div>',pauseTime:2}
		                ]});          
		            }
		        }
		    });
			
			//绑定事件
			$("#run").click(function(){
				lushu.start();
			});
			$("#stop").click(function(){
				lushu.stop();
			});
			$("#pause").click(function(){
				lushu.pause();
			});
			$("#hide").click(function(){
				lushu.hideInfoWindow();
			});
			$("#show").click(function(){
				lushu.showInfoWindow();
			});
		
		</script> 
</html>
