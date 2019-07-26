<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/prelude_admin.css?qw=1123">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<script src="<%=request.getContextPath() %>/resources/js/jquery.js?sdf=1"></script>
</head>
<body>
<div class="dropmenu" style="z-index:100;position:absolute; background-color:white; width:100%; height:170px; opacity:1; transition:all 0.4s ease-out;" id="menu">

	<div class="main_menu">
	<ul>
	<li><a href="<%= request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/images/logo.png" style="height: 50%;"></a></li>
	 <li style="padding-top:30px;"><a href="<%= request.getContextPath()%>"><b class="menu_font">
	 <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;관리자메인</b></a></li>
	 <li style="padding-top:30px;"><a href="#" ><b class="menu_font">
	 <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;여행지 정보입력</b></a></li>
	 <li style="padding-top:30px;"><a href="#" ><b class="menu_font">
	 <span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;회원정보 조회</b></a></li>
	 <li style="padding-top:30px;"><a href="#"><b class="menu_font">
	 <span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;자주 묻는 질문</b></a></li>
	</ul>
	</div>
</div>
</body>
