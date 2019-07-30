<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/kh_bootstrap.min.css?asd=asdda"
	rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/prelude_admin.css?qw=12123">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<script src="<%=request.getContextPath() %>/resources/js/jquery.js?sdf=1"></script>
<!--  일정 시간 뒤 자동 로그아웃 되게하는 스크립트  -->
<script type="text/javascript">
var tid;
var cnt = parseInt(300);//초기값(초단위)
function counter_init() {
	tid = setInterval("counter_run()", 1000);
}

function counter_reset() {
	clearInterval(tid);
	cnt = parseInt(300);
	counter_init();
}

function counter_run() {
	document.all.counter.innerText = time_format(cnt);
	cnt--;
	if(cnt < 0) {
		clearInterval(tid);
		self.location = "<%=request.getContextPath()%>/adminLogout";
	}
}
function time_format(s) {
	var nHour=0;
	var nMin=0;
	var nSec=0;
	if(s>0) {
		nMin = parseInt(s/60);
		nSec = s%60;

		if(nMin>60) {
			nHour = parseInt(nMin/60);
			nMin = nMin%60;
		}
	} 
	if(nSec<10) nSec = "0"+nSec;
	if(nMin<10) nMin = "0"+nMin;

	return ""+nHour+":"+nMin+":"+nSec;
}
</script>
</head>
<body>
<div class="dropmenu" style="z-index:100;position:absolute; background-color:white; width:1850px; height:170px; opacity:1; transition:all 0.4s ease-out;" id="menu">

	<div class="main_menu">

		
	<ul style="text-align:center;">
	 <li style="max-width:9%; margin:auto;"><img src="<%=request.getContextPath()%>/resources/images/admin_logo.png" style="max-width:100%; height:auto;"></li>
	 
	 <li style="padding-top:30px; margin:auto;"><a href="<%=request.getContextPath()%>/admin"><b class="menu_font">
	 <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;관리자메인</b></a></li>
	 
	 <li style="padding-top:30px; margin:auto;"><a href="<%=request.getContextPath()%>/adminCityData" ><b class="menu_font">
	 <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>&nbsp;&nbsp;여행지 업데이트</b></a></li>
	 
	 <li style="padding-top:30px; margin:auto;"><a href="#" ><b class="menu_font">
	 <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;회원정보 조회</b></a></li>
	 
	 
	 <li style="line-height:135.5px; margin:auto; float:right;">
	 <span id="counter"> </span> <b>후 자동로그아웃 </b><input type="button" class="btn btn-primary" value="연장" onclick="counter_reset()">
	 <form style="display:inline-block;" action="<%=request.getContextPath()%>/adminLogout" method="GET">
	 <input style="display:inline-block;" type="submit" class="btn btn-primary" value="로그아웃">
	 </form>
	 </li>
	</ul>
	</div>
	<hr style="border: solid black; border-width: 1px 0 0; width:80%;">
</div>



<script>
counter_init();
</script>
</body>