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

	</head>

	<body>
		<div id='container'></div>
		<div id="tip"></div>
		
	</body>
	<%@ include file="../include/commonJs.jsp" %>
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=21b244ca789b71c1eb9fcbcb9e8c4e57"></script>
		<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
		<script type="text/javascript">
			/***************************************
			由于Chrome、IOS10等已不再支持非安全域的浏览器定位请求，为保证定位成功率和精度，请尽快升级您的站点到HTTPS。
			***************************************/
			var map, geolocation;
			//加载地图，调用浏览器定位服务
			map = new AMap.Map('container', {
				resizeEnable: true
			});
			map.plugin('AMap.Geolocation', function() {
				geolocation = new AMap.Geolocation({
					enableHighAccuracy: false, //是否使用高精度定位，默认:true
					timeout: 10000, //超过10秒后停止定位，默认：无穷大
					buttonOffset: new AMap.Pixel(10, 20), //定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
					zoomToAccuracy: true, //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
					buttonPosition: 'RB'
				});
				map.addControl(geolocation);
				geolocation.getCurrentPosition();
				AMap.event.addListener(geolocation, 'complete', onComplete); //返回定位信息
				AMap.event.addListener(geolocation, 'error', onError); //返回定位出错信息
			});
			//解析定位结果
			function onComplete(data) {

				var str = ['定位成功'];
				str.push('经度：' + data.position.getLng());
				str.push('纬度：' + data.position.getLat());
				if(data.accuracy) {
					str.push('精度：' + data.accuracy + ' 米');
				} //如为IP精确定位结果则没有精度信息
				str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));
				document.getElementById('tip').innerHTML = str.join('<br>');
			}
			//解析定位错误信息
			function onError(data) {
				alert(data.message);
				document.getElementById('tip').innerHTML = '定位失败';
			}
		</script>

</html>
