<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>여행자들의 정보 : 여정</title>
	
	<script src="<%=request.getContextPath() %>/resources/js/full-page-scroll.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/full-page-scroll.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.min.css?var=1">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/prelude.css?var=1">

<script src="<%=request.getContextPath() %>/resources/js/jquery.js?sdf=1"></script>
	<script type="text/javascript">
	
	
	$(function(){
		var url = window.location.href;
		$("#logouturl").attr("href","${ pageContext.request.contextPath }/auth/logout?myurl="+url );
	});
	$(function(){
		var url = window.location.href;
		$("#loginurl").attr("href","${ pageContext.request.contextPath }/login?myurl="+url );
	});
	
	
	$(function(){
		$("#menu").on("mouseenter",function(){
			$("#menu").css("opacity","0.6");
		})	
		$("#menu").on("mouseleave",function(){
			$("#menu").css("opacity","0.1");
		})	
	});
	
	

	</script>
</head>
<body>
<div class="dropmenu" style="z-index:100;position:absolute; background-color:black; width:100%; height:170px; opacity:0.2; transition:all 0.4s ease-out;" id="menu">
<a href="<%= request.getContextPath()%>"><img src="<%=request.getContextPath()%>/resources/img/test1.png" style="height: 50%;"></a>
	<c:if test="${ empty sessionScope.login_member }" var="r">


	<a id="loginurl" href="<%= request.getContextPath()%>/login" class="login_link">로그인</a>

	<a href="<%= request.getContextPath()%>/regist_Regular" class="regist_link">회원가입</a>
	</c:if>
	<c:if test="${ not r }">
	<c:if test="${ readCount > 0 }" var="n">
	<a href="<%= request.getContextPath()%>/message/receive/" class="message_link"><b>새쪽지<font color="red">(${readCount})</font></b></a>
	</c:if>
	<c:if test="${ not n }">
	<a href="<%= request.getContextPath()%>/message/receive/" class="message_link">새쪽지(${readCount})</a>
	</c:if>
	<a href="<%= request.getContextPath()%>/auth/mypage" class="mypage_link">마이페이지</a>
	<a id="logouturl" href="#" class="logout_link">로그아웃</a>
	</c:if>
	<div class="main_menu">
	<ul>
	 <li><a href="<%= request.getContextPath()%>"><b class="menu_font">Home</b></a></li>
	 <li><a href="#" ><b class="menu_font">여행</b></a>
		 <ul>
	     <li><a href="#"><b class="menu_font">여행지 등록</b></a></li>
	     <li><a href="<%=request.getContextPath()%>/traveldata"><b class="menu_font">여행지 정보</b></a></li>
	    </ul>
	   </li>
	 <li><a href="#" ><b class="menu_font">같이갈래?</b></a></li>
	 <li><a href="<%=request.getContextPath()%>/reviewlist"><b class="menu_font">여행자들의 웃음(여행후기)</b></a></li>
	 <li><a href="#"><b class="menu_font">자주 묻는 질문</b></a></li>
	</ul>
	</div>
</div>
</body>
