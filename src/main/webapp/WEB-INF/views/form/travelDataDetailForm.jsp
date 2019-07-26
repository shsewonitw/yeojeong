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
		height: 500px;
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
<!-- test -->
<div style="height:200px;"></div>
<div style="height: 100%;">
	<!-- 도시별 정보 -->
	<div style="height: 400px;">
		<img alt="test" src="${city_data.image_src}" style="height: 400px; width: 100%;">
		
	</div>
	<!-- 왼쪽 사이드 공백 -->
	<div id="div_menu"></div>

	<div id="div_con" class="city_info">
		
	</div>

<!-- 오른쪽 사이드 공백 -->
<div id="div_menu2"></div>
</div>
</body>
</html>