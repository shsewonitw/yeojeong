<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/main.css?asd=1231">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/2796c86652.js"></script>
<style type="text/css">
#div_menu {
	width: 20%;
	height: 300px;
	float: left;
	text-align: left;
}

#div_con {
	width: 60%;
	height: 550px;
	float: left;
	background-size: 100% 100%;
	text-align: left;
	position: relative;
}

#div_menu2 {
	width: 20%;
	height: 300px;
	float: right;
	text-align: left;
}

.jb-table {
	display: table;
	border : 1px solid #bcbcbc;
	width: 100%;
}

.jb-table-row {
	display: table-row;
	border : 1px solid #bcbcbc;
}

.jb-table-cell {
	display: table-cell;
	border : 1px solid #bcbcbc;
	padding: 0px 20px;
	height: 150px;
	vertical-align: middle;
	text-align: center;
}
.city_info {
	position: absolute;
}
</style>


<meta charset="UTF-8">
<title>여행지 상세 정보</title>
</head>
<body style="height: 100%; overflow: scroll;">

	<!-- test -->
	<div style="height: 200px;"></div>


	<div style="height: 100%;">
		<div id="country" style="text-align: center;"><h2>${city_data.country }</h2></div>
		<div id="city" style="text-align: center;"><h2>${city_data.city }</h2></div>
		<!-- 도시별 정보 -->
		<div style="height: 400px;">
			<img alt="도시 사진"
				src="<%=request.getContextPath()%>/resources/cityimg/${city_data.image_src2}"
				style="width: 100%; height: 95%;">
		</div>

		<!-- 왼쪽 사이드 공백 -->
		<div id="div_menu"></div>

		<div id="div_con" class="city_info">
			<div class="jb-table">
				<div class="jb-table-row">
					<div class="jb-table-cell">
						<span style="color: #3498DB"><i class="fas fa-clock fa-6x"></i></span>
						<h4>현지시간 : ${city_data.local_time }</h4>
					</div>
					<div class="jb-table-cell">						
						<span style="color: #3498DB"><i class="fas fa-plane-departure fa-6x"></i></span>						
						<h4>비행시간 : ${city_data.flight_time }</h4>
					</div>
					<div class="jb-table-cell">
						<span style="color: #3498DB"><i class="fas fa-map-marked-alt fa-6x"></i></span>
						<h4>위도 : ${city_data.latitude }</h4>
						<h4>경도 : ${city_data.longitude }</h4>
					</div>
				</div>
				<div class="jb-table-row">
					<div class="jb-table-cell jb-top">
						<span style="color: #3498DB"><i class="fas fa-plug fa-6x"></i></span>
						<h4>현지 전압 : ${city_data.local_voltage }</h4>
					</div>
					<div class="jb-table-cell jb-middle">
						<span style="color: #3498DB"><i class="fab fa-cc-visa fa-6x"></i></span>
						<h4>비자 : ${city_data.visa}</h4>
					</div>
					<div class="jb-table-cell jb-bottom">
						<span style="color: red"><i class="fas fa-exclamation-triangle fa-6x"></i></span>
						<c:if test="${city_data.danger_level eq 0}">
							<h4>유의 지역 : 경보 없음</h4>
						</c:if>
						<c:if test="${city_data.danger_level eq 1}">
							<h4>유의 지역 : 남색경보 ( 여행유의 )</h4>
						</c:if>
						<c:if test="${city_data.danger_level eq 2}">
							<h4>유의 지역 : 황색경보 ( 여행자제 )</h4>
						</c:if>
						<c:if test="${city_data.danger_level eq 3}">
							<h4>유의 지역 : 적색경보 ( 철수권고)</h4>
						</c:if>
						<c:if test="${city_data.danger_level eq 4}">
							<h4>유의 지역 : 흑색경보 ( 여행금지)</h4>
						</c:if>
					</div>
				</div>
			</div>			
		</div>

		<!-- 오른쪽 사이드 공백 -->
		<div id="div_menu2"></div>
	</div>
</body>
</html>