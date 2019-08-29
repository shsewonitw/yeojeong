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
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/2796c86652.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">	


<!--  -->
	
<meta charset="UTF-8">
<title>공항 정보</title>

<style>
#submenu1 > span {
	font-size: 1vw;
}
#submenu2 > span {
	font-size: 1vw;
}

.text_content1_5 {
    position: relative;
    display:inline-block;
    left:-55.5%;
    transform: translate(0%, 300%);                                                                   
    font-size:2vw;
    z-index: 2;
    text-align: center;
}

.text_content1_4 {
    position: relative;
    display:inline-block;
    left:-49.5%;
    transform: translate(0%, 300%);                                                                   
    font-size:2vw;
    z-index: 2;
    text-align: center;
}

.text_content1_3 {
    position: relative;
    display:inline-block;
    left:-43%;
    transform: translate(0%, 300%);                                                                   
    font-size:2vw;
    z-index: 2;
    text-align: center;
}

.text_content1_2 {
    position: relative;
    display:inline-block;
    left:-37%;
    transform: translate(0%, 300%);                                                                   
    font-size:2vw;
    z-index: 2;
    text-align: center;
}
    
.text_content2_2 {
    position: relative;
    display:inline-block;
    left:-50%;
    transform: translate(0%, 300%);                                                                   
    font-size:2vw;
    z-index: 2;
    text-align: center;
}

.text_content2_1 {
    position: relative;
    display:inline-block;
    left:-31%;
    transform: translate(0%, 300%);                                                                   
    font-size:2vw;
    z-index: 2;
    text-align: center;
}
</style>

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

function clickSubMenu(clicked_id){
	var select_div = '#'+clicked_id;
	$('.submenu_all').css("display","none")
	$(select_div).css("display","block")
}
</script>

<div style="height: 200px;"></div>


<div style="text-align:center;color:rgb(52, 152, 219);"><h1>실시간 공항 정보</h1></div>

<div style="height: 30px;"></div>

<div style="overflow:hidden;">

	<div style="width:200px; margin-left:100px; float:left;">
		<!-- 메뉴 리스트 -->
		<div class="list-group" style="text-align:center;">
			<a href="javascript:void(0);" onclick="clickMenu('menu1');" class="list-group-item" id="a_menu1">현재 공항 출국장 혼잡도</a>
			<a href="javascript:void(0);" onclick="clickMenu('menu2');" class="list-group-item" id="a_menu2">현재 공항 주차장 주차상황</a>

		</div>
	</div>





	<div style="float:left; margin-left:50px; width:70%">
		<!-- 공항 혼잡도 -->
		<div class="div_menu_all" id="menu1" style="display:none;">
			<ul class="nav nav-tabs">
			  <li role="presentation"><a href="javascript:void(0);" onclick="clickSubMenu('submenu1')">제 1 터미널</a></li>
			  <li role="presentation"><a href="javascript:void(0);" onclick="clickSubMenu('submenu2')">제 2 터미널</a></li>
			</ul>
				<div id="submenu1" class="submenu_all" style="display:none;">
				<br/>
					<span class="label label-success">원활</span><span class="label label-primary">보통</span><span class="label label-warning">혼잡</span><span class="label label-danger">매우혼잡</span>&nbsp;&nbsp;<span class="label label-default">단위 : 명</span><br />
					<img src="<%=request.getContextPath()%>/resources/images/ter_1.3.png" width="70%">
					<div class="text_content1_5">
						<c:if test="${airportInfo.gate4 eq 0}">
							<span class="label label-success" id="gateInfo4">${airportInfo.gateinfo4}</span>				
						</c:if>
						<c:if test="${airportInfo.gate4 eq 1}">
							<span class="label label-primary" id="gateInfo4">${airportInfo.gateinfo4}</span>				
						</c:if>
						<c:if test="${airportInfo.gate4 eq 2}">
							<span class="label label-warning" id="gateInfo4">${airportInfo.gateinfo4}</span>				
						</c:if>
						<c:if test="${airportInfo.gate4 eq 3}">
							<span class="label label-danger" id="gateInfo4">${airportInfo.gateinfo4}</span>				
						</c:if>
					</div>
					
					<div class="text_content1_4">
						<c:if test="${airportInfo.gate3 eq 0}">
							<span class="label label-success" id="gateInfo3">${airportInfo.gateinfo3}</span>				
						</c:if>
						<c:if test="${airportInfo.gate3 eq 1}">
							<span class="label label-primary" id="gateInfo3">${airportInfo.gateinfo3}</span>				
						</c:if>
						<c:if test="${airportInfo.gate3 eq 2}">
							<span class="label label-warning" id="gateInfo3">${airportInfo.gateinfo3}</span>				
						</c:if>
						<c:if test="${airportInfo.gate3 eq 3}">
							<span class="label label-danger" id="gateInfo3">${airportInfo.gateinfo3}</span>				
						</c:if>			
					</div>
					
					<div class="text_content1_3">
						<c:if test="${airportInfo.gate2 eq 0}">
							<span class="label label-success" id="gateInfo2">${airportInfo.gateinfo2}</span>				
						</c:if>
						<c:if test="${airportInfo.gate2 eq 1}">
							<span class="label label-primary" id="gateInfo2">${airportInfo.gateinfo2}</span>				
						</c:if>
						<c:if test="${airportInfo.gate2 eq 2}">
							<span class="label label-warning" id="gateInfo2">${airportInfo.gateinfo2}</span>				
						</c:if>
						<c:if test="${airportInfo.gate2 eq 3}">
							<span class="label label-danger" id="gateInfo2">${airportInfo.gateinfo2}</span>				
						</c:if>
					</div>
					
					<div class="text_content1_2">
						<c:if test="${airportInfo.gate1 eq 0}">
							<span class="label label-success" id="gateInfo1">${airportInfo.gateinfo1}</span>				
						</c:if>
						<c:if test="${airportInfo.gate1 eq 1}">
							<span class="label label-primary" id="gateInfo1">${airportInfo.gateinfo1}</span>				
						</c:if>
						<c:if test="${airportInfo.gate1 eq 2}">
							<span class="label label-warning" id="gateInfo1">${airportInfo.gateinfo1}</span>				
						</c:if>
						<c:if test="${airportInfo.gate1 eq 3}">
							<span class="label label-danger" id="gateInfo1">${airportInfo.gateinfo1}</span>				
						</c:if>		
					</div>
					<h3>현재 출국장에 대기중인 총 인원 :  <font color="#3498db"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>${airportInfo.gateinfo1 + airportInfo.gateinfo2 + airportInfo.gateinfo3 + airportInfo.gateinfo4}</font> 명 </h3>
				</div>		
				<div id="submenu2" class="submenu_all" style="display:none;">
				<br />
				<span class="label label-success">원활</span><span class="label label-primary">보통</span><span class="label label-warning">혼잡</span><span class="label label-danger">매우혼잡</span>&nbsp;&nbsp;<span class="label label-default">단위 : 명</span><br />
					<img src="<%=request.getContextPath()%>/resources/images/ter_2.3.png" width="70%">
					<div class="text_content2_2">
						<c:if test="${airportInfo2.gate2 eq 0}">
							<span class="label label-success" id="gateInfo2_2">${airportInfo2.gateinfo2}</span>				
						</c:if>
						<c:if test="${airportInfo2.gate2 eq 1}">
							<span class="label label-primary" id="gateInfo2_2">${airportInfo2.gateinfo2}</span>				
						</c:if>
						<c:if test="${airportInfo2.gate2 eq 2}">
							<span class="label label-warning" id="gateInfo2_2">${airportInfo2.gateinfo2}</span>				
						</c:if>
						<c:if test="${airportInfo2.gate2 eq 3}">
							<span class="label label-danger" id="gateInfo2_2">${airportInfo2.gateinfo2}</span>				
						</c:if>
					</div>
					<div class="text_content2_1">
						<c:if test="${airportInfo2.gate1 eq 0}">
							<span class="label label-success" id="gateInfo2_1">${airportInfo2.gateinfo1}</span>				
						</c:if>
						<c:if test="${airportInfo2.gate1 eq 1}">
							<span class="label label-primary" id="gateInfo2_1">${airportInfo2.gateinfo1}</span>				
						</c:if>
						<c:if test="${airportInfo2.gate1 eq 2}">
							<span class="label label-warning" id="gateInfo2_1">${airportInfo2.gateinfo1}</span>				
						</c:if>
						<c:if test="${airportInfo2.gate1 eq 3}">
							<span class="label label-danger" id="gateInfo2_1">${airportInfo2.gateinfo1}</span>				
						</c:if>
					</div>
				<h3>현재 출국장에 대기중인 총 인원 :  <font color="#3498db"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>${airportInfo2.gateinfo1 + airportInfo2.gateinfo2}</font> 명 </h3>
				</div>
				
				<!-- 글자 길이수에 따라 글자 크기 조절  -->
				<c:if test="${airportInfo.gateinfo1.length() eq 1}">
					<script>
						$('#gateInfo1').css("font-size","2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo1.length() eq 2}">
					<script>
						$('#gateInfo1').css("font-size","1.6vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo1.length() eq 3}">
					<script>
						$('#gateInfo1').css("font-size","1.2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo1.length() eq 4}">
					<script>
						$('#gateInfo1').css("font-size","1vw")
					</script>
				</c:if>
				
				<c:if test="${airportInfo.gateinfo2.length() eq 1}">
					<script>
						$('#gateInfo2').css("font-size","2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo2.length() eq 2}">
					<script>
						$('#gateInfo2').css("font-size","1.6vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo2.length() eq 3}">
					<script>
						$('#gateInfo2').css("font-size","1.2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo2.length() eq 4}">
					<script>
						$('#gateInfo2').css("font-size","1vw")
					</script>
				</c:if>
				
				<c:if test="${airportInfo.gateinfo3.length() eq 1}">
					<script>
						$('#gateInfo3').css("font-size","2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo3.length() eq 2}">
					<script>
						$('#gateInfo3').css("font-size","1.6vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo3.length() eq 3}">
					<script>
						$('#gateInfo3').css("font-size","1.2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo3.length() eq 4}">
					<script>
						$('#gateInfo3').css("font-size","1vw")
					</script>
				</c:if>
				
				<c:if test="${airportInfo.gateinfo4.length() eq 1}">
					<script>
						$('#gateInfo4').css("font-size","2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo4.length() eq 2}">
					<script>
						$('#gateInfo4').css("font-size","1.6vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo4.length() eq 3}">
					<script>
						$('#gateInfo4').css("font-size","1.2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo.gateinfo4.length() eq 4}">
					<script>
						$('#gateInfo4').css("font-size","1vw")
					</script>
				</c:if>
				
				
				<!-- 2 터미널 글자수 조절  -->
				<c:if test="${airportInfo2.gateinfo2.length() eq 1}">
					<script>
						$('#gateInfo2_2').css("font-size","2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo2.gateinfo2.length() eq 2}">
					<script>
						$('#gateInfo2_2').css("font-size","1.6vw")
					</script>
				</c:if>
				<c:if test="${airportInfo2.gateinfo2.length() eq 3}">
					<script>
						$('#gateInfo2_2').css("font-size","1.2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo2.gateinfo2.length() eq 4}">
					<script>
						$('#gateInfo2_2').css("font-size","1vw")
					</script>
				</c:if>
				
				<c:if test="${airportInfo2.gateinfo1.length() eq 1}">
					<script>
						$('#gateInfo2_1').css("font-size","2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo2.gateinfo1.length() eq 2}">
					<script>
						$('#gateInfo2_1').css("font-size","1.6vw")
					</script>
				</c:if>
				<c:if test="${airportInfo2.gateinfo1.length() eq 3}">
					<script>
						$('#gateInfo2_1').css("font-size","1.2vw")
					</script>
				</c:if>
				<c:if test="${airportInfo2.gateinfo1.length() eq 4}">
					<script>
						$('#gateInfo2_1').css("font-size","1vw")
					</script>
				</c:if>
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
		
		
		<c:set var="per0" value="${airportParking0.parking / airportParking0.parkingarea * 100}" />
		<c:set var="per1" value="${airportParking1.parking / airportParking1.parkingarea * 100}" />
		<c:set var="per2" value="${airportParking2.parking / airportParking2.parkingarea * 100}" />
		<c:set var="per3" value="${airportParking3.parking / airportParking3.parkingarea * 100}" />
		<c:set var="per4" value="${airportParking4.parking / airportParking4.parkingarea * 100}" />
		<c:set var="per5" value="${airportParking5.parking / airportParking5.parkingarea * 100}" />
		<c:set var="per6" value="${airportParking6.parking / airportParking6.parkingarea * 100}" />
		<c:set var="per7" value="${airportParking7.parking / airportParking7.parkingarea * 100}" />
		<c:set var="per8" value="${airportParking8.parking / airportParking8.parkingarea * 100}" />
		<c:set var="per9" value="${airportParking9.parking / airportParking9.parkingarea * 100}" />
		<c:set var="per10" value="${airportParking10.parking / airportParking10.parkingarea * 100}" />
		<c:set var="per11" value="${airportParking11.parking / airportParking11.parkingarea * 100}" />
		<c:set var="per12" value="${airportParking12.parking / airportParking12.parkingarea * 100}" />
		
		<div class="div_menu_all" id="menu2" style="display:none;">
			<ul class="nav nav-tabs">
			  <li role="presentation"><a href="javascript:void(0);" onclick="clickSubMenu('submenu3')">제 1 터미널</a></li>
			  <li role="presentation"><a href="javascript:void(0);" onclick="clickSubMenu('submenu4')">제 2 터미널</a></li>
			</ul>
				<div id="submenu3" class="submenu_all" style="display:none;">
				<br />
					<div style="width:40%;">
						<h4>단기주차장 지상층 ( ${airportParking0.parking} / ${airportParking0.parkingarea}  ) - <font color="#3498db"><b>${airportParking0.parkingarea - airportParking0.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per0 < 25 ? 'success': per0 < 50 ? 'progress': per0 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking0.parking / airportParking0.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
						
						<br />
						<h4>단기주차장 지하 1층 ( ${airportParking1.parking} / ${airportParking1.parkingarea}  ) - <font color="#3498db"><b>${airportParking1.parkingarea - airportParking1.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per1 < 25 ? 'success': per1 < 50 ? 'progress': per1 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking1.parking / airportParking1.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
						
						<br />
						<h4>단기주차장 지하 2층 ( ${airportParking2.parking} / ${airportParking2.parkingarea}  ) - <font color="#3498db"><b>${airportParking2.parkingarea - airportParking2.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per2 < 25 ? 'success': per2 < 50 ? 'progress': per2 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking2.parking / airportParking2.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
						
						<br />
						<h4>P1 장기주차장 ( ${airportParking6.parking} / ${airportParking6.parkingarea}  ) - <font color="#3498db"><b>${airportParking6.parkingarea - airportParking6.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per6 < 25 ? 'success': per6 < 50 ? 'progress': per6 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking6.parking / airportParking6.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
						
						<br />
						<h4>P1 장기주차 타워 ( ${airportParking7.parking} / ${airportParking7.parkingarea}  ) - <font color="#3498db"><b>${airportParking7.parkingarea - airportParking7.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per7 < 25 ? 'success': per7 < 50 ? 'progress': per7 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking7.parking / airportParking7.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
						
						<br />
						<h4>P2 장기주차장 ( ${airportParking8.parking} / ${airportParking8.parkingarea}  ) - <font color="#3498db"><b>${airportParking8.parkingarea - airportParking8.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per8 < 25 ? 'success': per8 < 50 ? 'progress': per8 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking8.parking / airportParking8.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
						
						<br />
						<h4>P2 장기주차 타워 ( ${airportParking9.parking} / ${airportParking9.parkingarea}  ) - <font color="#3498db"><b>${airportParking9.parkingarea - airportParking9.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per9 < 25 ? 'success': per9 < 50 ? 'progress': per9 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking9.parking / airportParking9.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
						
						<br />
						<h4>P3 장기주차장 ( ${airportParking10.parking} / ${airportParking10.parkingarea}  ) - <font color="#3498db"><b>${airportParking10.parkingarea - airportParking10.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per10 < 25 ? 'success': per10 < 50 ? 'progress': per10 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking10.parking / airportParking10.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
						
						<br />
						<h4>P4 장기주차장 ( ${airportParking11.parking} / ${airportParking11.parkingarea}  ) - <font color="#3498db"><b>${airportParking11.parkingarea - airportParking11.parking }대 주차가능</b></font></h4>
						<div class="progress">
							  <div class="progress-bar progress-bar-${ per11 < 25 ? 'success': per11 < 50 ? 'progress': per11 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking11.parking / airportParking11.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
						</div>
					</div>
				</div>
				
				<div id="submenu4" class="submenu_all" style="display:none;">
				<div style="width:40%;">
					<br />
					<h4>단기주차장 지상 1층 ( ${airportParking3.parking} / ${airportParking3.parkingarea}  ) - <font color="#3498db"><b>${airportParking3.parkingarea - airportParking3.parking }대 주차가능</b></font></h4>
					<div class="progress">
						  <div class="progress-bar progress-bar-${ per3 < 25 ? 'success': per3 < 50 ? 'progress': per3 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking3.parking / airportParking3.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
					</div>
					
					<br />
					<h4>단기주차장 지상 2층 ( ${airportParking4.parking} / ${airportParking4.parkingarea}  ) - <font color="#3498db"><b>${airportParking4.parkingarea - airportParking4.parking }대 주차가능</b></font></h4>
					<div class="progress">
						  <div class="progress-bar progress-bar-${ per4 < 25 ? 'success': per4 < 50 ? 'progress': per4 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking4.parking / airportParking4.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
					</div>
					
					<br />
					<h4>단기주차장 지하 M층 ( ${airportParking5.parking} / ${airportParking5.parkingarea}  ) - <font color="#3498db"><b>${airportParking5.parkingarea - airportParking5.parking }대 주차가능</b></font></h4>
					<div class="progress">
						  <div class="progress-bar progress-bar-${ per5 < 25 ? 'success': per5 < 50 ? 'progress': per5 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking5.parking / airportParking5.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
					</div>
					
					<br />
					<h4>장기주차장 ( ${airportParking12.parking} / ${airportParking12.parkingarea}  ) - <font color="#3498db"><b>${airportParking12.parkingarea - airportParking12.parking }대 주차가능</b></font></h4>
					<div class="progress">
						  <div class="progress-bar progress-bar-${ per12 < 25 ? 'success': per12 < 50 ? 'progress': per12 < 75 ? 'warning' : 'danger' } progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${airportParking12.parking / airportParking12.parkingarea * 100}%; display:inline-block"></div> &nbsp;<i style="color:#3498db;"class="fas fa-car-side animated wobble infinite"></i>
					</div>
				</div>
				</div>
		</div>	
		
	</div>

</div>



</body>
</html>