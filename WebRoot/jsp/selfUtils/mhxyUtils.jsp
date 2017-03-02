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
		<div>
		    <input id="petLA" type="number" placeholder="请输入召唤兽当前等级"><input id="petLB" type="number" placeholder="请输入召唤兽达到等级"><input id="petNowExp" type="number" placeholder="请输入召唤兽当前经验">
		    <label id="getPetLGrow">查询</label>
			<div><label>召唤兽所需经验:</label><input id="petLgrow" type="text" value=""></div>
		</div>
		
		<div>
		    <input id="petL" type="number" placeholder="请输入召唤兽当前等级"><input id="XYScoreAll" type="number" placeholder="请输入修业点数"><input id="petNowExpXY" type="number" placeholder="请输入召唤兽当前经验">
		    <label id="getPetL">查询</label>
			<div><label>召唤兽达到等级:</label><input id="petLGet" type="text" value=""></div>
		</div>
	

</body>
<%@ include file="../include/commonJs.jsp" %>
<script type="text/javascript">
			var petCalculate={			
				petLgrowBase:50,
				petCalculate:function(){
				},		
				XYScoreExp:function(petL){
					var XYScoreExp = (petL+20)*100;
					return XYScoreExp;
				},
				petLExp:function(petL){
					var n = petL;
					var petExp = n*(n+1)*(2*n+1)/6*this.petLgrowBase;
					return petExp;
				},
				petLAddOneExp:function(petL){
					var petExp = this.petLExp(petL+1)-this.petLExp(petL);
					return petExp;
				},
				petLGrow:function(petLA,petLB,petNowExp){
					var petExp = this.petLExp(petLB)-this.petLExp(petLA)-petNowExp;
					return petExp;
				},
				petLGrowByXY:function(petL,XYScoreAll,petNowExp){
					var petLGrowExp = this.petLAddOneExp(petL)-petNowExp;
					var XYScoreExp = this.XYScoreExp(petL);
					var flag = true;
					XYScoreAll = XYScoreAll-1;
					while(flag){						
						if(petLGrowExp<XYScoreExp){						
							XYScoreExp = XYScoreExp-petLGrowExp;
							petL=petL+1;
							petLGrowExp =  this.petLAddOneExp(petL);
							/*console.log("petL:"+petL+";"+"XYScoreExp:"+XYScoreExp+";"+"petLGrowExp:"+petLGrowExp+";");*/
						}else if(XYScoreAll>0){
							XYScoreAll = XYScoreAll-1;
							XYScoreExp = XYScoreExp+this.XYScoreExp(petL);
							
						}else{
							flag = false;
						}
						
					}
					return petL;
					
				}
			}
			
			$(document).ready(function(){
				$("#getPetLGrow").click(function(){
					var petLA = parseInt($("#petLA").val());
					var petLB = parseInt($("#petLB").val());
					
					var petNowExp = parseInt($("#petNowExp").val());
					if(!(petLA<0)&&petLB>petLA&&petNowExp<petCalculate.petLAddOneExp(petLA)){
						var petLgrow = petCalculate.petLGrow(petLA,petLB,petNowExp);					
						$("#petLgrow").val(petLgrow);
					}else{
						alert("输入有误");
					}
					
				})
				$("#getPetL").click(function(){
					var petL = parseInt($("#petL").val());
					var XYScoreAll = parseInt($("#XYScoreAll").val());					
					var petNowExpXY = parseInt($("#petNowExpXY").val());
					if(!(petL<0)&&XYScoreAll>0&&petNowExpXY<(petCalculate.petLExp(petL+1)-petCalculate.petLExp(petL))){
						petL = petCalculate.petLGrowByXY(petL,XYScoreAll,petNowExpXY);					
						$("#petLGet").val(petL);
					}else{
						alert("输入有误");
					}
				})
				
			})
			
		</script>

</html>