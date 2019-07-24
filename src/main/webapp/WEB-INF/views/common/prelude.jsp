<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>여정</title>
	
	<script src="<%=request.getContextPath() %>/resources/js/full-page-scroll.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/full-page-scroll.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.min.css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/prelude.css">

<script src="<%=request.getContextPath() %>/resources/js/jquery.js?sdf=1"></script>
	<script type="text/javascript">
	
	
	
	$(function(){
		$("#menu").on("mouseenter",function(){
			$("#menu").css("opacity","0.6");
		})	
		$("#menu").on("mouseleave",function(){
			$("#menu").css("opacity","0.1");
		})	
	})
	
	

	</script>
</head>
<body>
<div class="dropmenu" style="z-index:100;position:absolute; background-color:black; width:100%; height:17%; opacity:0; transition:all 0.4s ease-out;" id="menu">
<a href="<%= request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/img/test1.png" style="height: 50%;"></a>
	<a href="#" class="login_link">로그인</a> 
	<a href="#" class="regist_link">회원가입</a>
	<div class="main_menu" style="overflow:hidden;">
	<ul>
	 <li><a href="<%= request.getContextPath()%>"><b class="menu_font">Home</b></a></li>
	 <li><a href="#" ><b class="menu_font">여행</b></a>
		 <ul>
	     <li><a href="#"><b class="menu_font">여행지 등록</b></a></li>
	     <li><a href="#"><b class="menu_font">여행지 정보</b></a></li>
	    </ul>
	   </li>
	 <li><a href="#" ><b class="menu_font">같이갈래?</b></a></li>
	 <li><a href="#"><b class="menu_font">여행자들의 웃음(여행후기)</b></a></li>
	 <li><a href="#"><b class="menu_font">자주 묻는 질문</b></a></li>
	</ul>
	</div>
</div>
</body>
