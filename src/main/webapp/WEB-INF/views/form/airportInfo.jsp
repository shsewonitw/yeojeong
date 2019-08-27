<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>


	
<meta charset="UTF-8">
<title>공항 정보</title>

</head>
<body style="overflow:scroll;width:100%;height:100%">
<script type="text/javascript">

// hover속성
$(function(){
	$(".list-group-item").hover(function(){
		var s =$(this).css("background-color");
		$(this).css("color", "black").css("background-color", "#dcdcdc");
		if(s=="rgb(52, 152, 219)"){
				 $(this).css("background-color","rgb(52, 152, 219)").css("color", "white");
		}
	},function(){
		var s =$(this).css("background-color");
		$(this).css("color", "black").css("background-color", "white");
		 if(s=="rgb(52, 152, 219)"){
			 $(this).css("background-color","rgb(52, 152, 219)").css("color", "white");
		}
	});
})


function clickMenu(clicked_id){
	var select_div = '#'+clicked_id;
	$(".div_menu_all").css("display","none");
	$(select_div).css("display","block");
	
	var select_a = '#a_'+clicked_id;
	$('.list-group-item').css("background-color","white");
	$('.list-group-item').css("color","black");
	$(select_a).css("background-color","rgb(52, 152, 219)");
	$(select_a).css("color","rgb(255, 255, 255)");
}

</script>

<div style="height: 200px;"></div>


<div style="text-align:center;color:rgb(52, 152, 219);"><h1>실시간 공항 정보</h1></div>

<div style="height: 30px;"></div>

<div style="overflow:hidden;">

	<div style="width:200px; margin-left:100px; float:left;">
		<!-- 메뉴 리스트 -->
		<div class="list-group" style="text-align:center;">
			<a href="javascript:void(0);" onclick="clickMenu('menu1');" class="list-group-item" id="a_menu1">현재 공항 혼잡도</a>
			<a href="javascript:void(0);" onclick="clickMenu('menu2');" class="list-group-item" id="a_menu2">메뉴2</a>
			<a href="javascript:void(0);" onclick="clickMenu('menu3');" class="list-group-item" id="a_menu3">메뉴3</a>
		</div>
	</div>


	<div style="float:left; margin-left:50px">
		<!-- 공항 혼잡도 -->
		<div class="div_menu_all" id="menu1" style="display:none;">
			<div>
				<img src="<%=request.getContextPath()%>/resources/images/ter_1.2.png" style="width:40%;">
			</div>
			<!-- 
			<h1>gate1 : ${airportInfo.gate1}</h1>
			<h1>gate2 : ${airportInfo.gate2}</h1>
			<h1>gate3 : ${airportInfo.gate3}</h1>
			<h1>gate4 : ${airportInfo.gate4}</h1>
			<h1>gateinfo1 : ${airportInfo.gateinfo1}</h1>
			<h1>gateinfo2 : ${airportInfo.gateinfo2}</h1>
			<h1>gateinfo3 : ${airportInfo.gateinfo3}</h1>
			<h1>gateinfo4 : ${airportInfo.gateinfo4}</h1>
			 -->
		</div>
		
		<div class="div_menu_all" id="menu2" style="display:none;"><h1>test2</h1></div>	
		<div class="div_menu_all" id="menu3" style="display:none;"><h1>test3</h1></div>	
	</div>

</div>



</body>
</html>