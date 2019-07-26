<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/main.css?asd=56">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<style type="text/css">
	#div_menu{
		width: 20%;
		height: 300px;
		float: left;		
		text-align: left;		
	}
	
	#div_con{
		width: 60%;
		height: 300px;
		float: left;
		background-size: 100%100%;
		text-align: left;		
	}
	
	#div_menu2{
		width: 20%;
		height: 300px;
		float: right;		
		text-align: left;		
	}
</style>	
	
<meta charset="UTF-8">
<title>여행지 상세 정보</title>
</head>
<body style="height: 100%; overflow: scroll;">

<div style="height:200px;"></div>
<div style="height: 100%;">

	<div id="div_menu"></div>

	<div id="div_con" align="center">
		<img alt="이미지" src="<%=request.getContextPath()%>/resources/img/traveldetail.png" style="width: 100px; height: 100px;">
	</div>


</div>
</body>
</html>