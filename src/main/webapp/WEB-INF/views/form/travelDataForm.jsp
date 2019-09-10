<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/2796c86652.js"></script>
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
	#scale {
		transform: scale(1);
  		-webkit-transform: scale(1);
  		-moz-transform: scale(1);
  		-ms-transform: scale(1);
		-o-transform: scale(1);
  		transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
	}
	#scale:hover {
	  	transform: scale(1.2);
	  	-webkit-transform: scale(1.2);
	  	-moz-transform: scale(1.2);
	  	-ms-transform: scale(1.2);
	  	-o-transform: scale(1.2);
	}
	#img {
		width:325px;
		height:280px;
		overflow:hidden	
	}
	
	
</style>
<meta charset="UTF-8">
<title>여행지 정보</title>
</head>
<body style="height:100%; overflow:scroll;">

<div style="height:200px;"></div>

<div id="div_menu"></div>

<div id="div_con">

<div align="center">
<h1 style="color:rgb(52,152,219); font-weight:bold; text-align:center;"><img style="width: auto; height: auto; max-width: 100px; max-height: 100px;"
				src="<%=request.getContextPath()%>/resources/images/logo.png"
				alt="logo"><b>여행지 정보</b></h1>
	<hr size="5" noshade>
				<!-- 
	<span style="color: #3498DB"><i class="fas fa-city fa-4x"></i></span>
	<h1>여행지 정보</h1>
	<p>가고싶은 여행지를 선택하세요.</p>
	<hr size="5" noshade>
	 -->	
</div>

<div id="traveldata">

	<form action="<%=request.getContextPath()%>/form/traveldata" method="post">
	
	<!-- 나라별 정보 링크 -->
	<c:forEach items="${city_data_list}" var="city_data">
		<div align="center" class="col-sm-5 col-md-3" id="scale">	
			<h4>${city_data.country}  ${city_data.city}</h4>
				<!-- 클릭시 디테일화면으로  -->
				<a href="<%=request.getContextPath()%>/traveldatad?city=${city_data.city}">
					<img src="<%=request.getContextPath()%>/resources/cityimg/${city_data.image_src}" alt="${city_data.country}" class="img-circle" style="width:180px; height:180px;">
				</a>
				<hr size="5" noshade>
		</div>
	</c:forEach>
	
	</form>
</div>

</div>

<div id="div_menu2"></div>
</div>
</body>
</html>