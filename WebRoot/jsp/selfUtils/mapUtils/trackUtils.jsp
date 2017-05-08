<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1 user-scalable=no">
		<title>地图工具</title>
		<%@ include file="../../include/commonCss.jsp" %>
		<link type="text/css" rel="stylesheet" href="${basepath}/css/frameCommon.css">
	    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
	</head>

	<body>
		<div id='container'></div>
		<div class="button-group">
		    <input type="button" class="button" value="开始动画" id="start"/>
		     <input type="button" class="button" value="暂停动画" id="pause"/>
		      <input type="button" class="button" value="继续动画" id="resume"/>
		    <input type="button" class="button" value="停止动画" id="stop"/>		  		
		</div>
		
	</body>
	<%@ include file="../../include/commonJs.jsp" %>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=21b244ca789b71c1eb9fcbcb9e8c4e57"></script>
		<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
		<script>
			var marker, lineArr = [];
			var list = eval('${track}');
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
		    })
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
			
			
		</script>

</html>
