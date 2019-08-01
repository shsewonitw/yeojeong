<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/2796c86652.js"></script>
<style type="text/css">
.jb-table {
	display: table;
	border: 0px solid rgba(255, 255, 255, 0.1);
	background-color: rgba(0, 0, 0, 0.2);
	width: 100%;
	opacity: 50%;
}

.jb-table-row {
	display: table-row;
	border: 0px solid rgba(255, 255, 255, 0.1);
	background-color: rgba(0, 0, 0, 0.2);
}

.jb-table-cell {
	display: table-cell;
	border: 0px solid rgba(255, 255, 255, 0.1);
	background-color: rgba(0, 0, 0, 0.2);
	opacity: 50%;
	padding: 0px 20px;
	height: 150px;
	vertical-align: middle;
	text-align: center;
}

.img {
	position: relative;
	background-image:
		url("<%=request.getContextPath()%>/resources/cityimg/${city_data.image_src2}");
	height: 100vh;
	background-size: cover;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1;
}

a:link {
	color: white;
	text-decoration: none;
}

a:visited {
	color: white;
	text-decoration: none;
}

a:hover {
	color: white;
	text-decoration: none;
}

.img .content {
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 5rem;
	color: white;
	z-index: 2;
	text-align: center;
}
</style>


<meta charset="UTF-8">
<title>여행지 상세 정보</title>
</head>
<body style="height: 100%; overflow: scroll;">	
	<div class="img">
		<div class="content" style="height: 80px;">

			<table>
				<tr>
					<th><font size="x-large">${city_data.country }</font></th>
					<th style="vertical-align: bottom;"><h3>${city_data.city }</h3></th>
				</tr>
			</table>

			<div class="city_info">
				<div class="jb-table">
					<div class="jb-table-row">
						<div class="jb-table-cell">
							<img alt="국기"
								src="<%=request.getContextPath()%>/resources/cityimg/${city_data.image_src3}"
								style="height: 60%">
						</div>

						<div class="jb-table-cell">
							<span style="color: white"><i class="fas fa-clock fa-1x"></i></span>
							<h4>시차 : ${city_data.local_time }</h4>
						</div>

						<div class="jb-table-cell">
							<span style="color: white"><i
								class="fas fa-plane-departure fa-1x"></i></span>
							<h4>비행시간 : ${city_data.flight_time }</h4>
						</div>
					</div>

					<div class="jb-table-row">
						<div class="jb-table-cell">
							<span style="color: white"><i class="fas fa-plug fa-1x"></i></span>
							<h4>현지 전압 : ${city_data.local_voltage }</h4>
						</div>
						<div class="jb-table-cell">
							<span style="color: white"><i class="fab fa-cc-visa fa-1x"></i></span>
							<h4>비자 : ${city_data.visa}</h4>
						</div>

						<div class="jb-table-cell">
							<c:if test="${city_data.danger_level eq 0}">
								<span style="color: white"><i
									class="fas fa-exclamation-triangle fa-1x"></i></span>
								<h4>유의 지역 : 경보 없음</h4>
							</c:if>
							<c:if test="${city_data.danger_level eq 1}">
								<span style="color: #08088A"><i
									class="fas fa-exclamation-triangle fa-1x"></i></span>
								<h4>유의 지역 : 남색경보 ( 여행유의 )</h4>
							</c:if>
							<c:if test="${city_data.danger_level eq 2}">
								<span style="color: #D7DF01"><i
									class="fas fa-exclamation-triangle fa-1x"></i></span>
								<h4>유의 지역 : 황색경보 ( 여행자제 )</h4>
							</c:if>
							<c:if test="${city_data.danger_level eq 3}">
								<span style="color: red"><i
									class="fas fa-exclamation-triangle fa-1x"></i></span>
								<h4>유의 지역 : 적색경보 ( 철수권고)</h4>
							</c:if>
							<c:if test="${city_data.danger_level eq 4}">
								<span style="color: #424242"><i
									class="fas fa-exclamation-triangle fa-1x"></i></span>
								<h4>유의 지역 : 흑색경보 ( 여행금지)</h4>
							</c:if>

						</div>
					</div>
					<div class="jb-table-row">
						<div class="jb-table-cell">
							<span style="color: white"><i class="fas fa-plane"></i></span>
							<h4><a href="https://travel.hotelscombined.co.kr/flights" target="_blank">최저가 항공 검색</a></h4>
						</div>

						<div class="jb-table-cell">
							<span style="color: white"><i class="fas fa-hotel"></i></span>
							<h4><a href="https://www.hotelscombined.co.kr" target="_blank">최저가 호텔 검색</a></h4>
						</div>

						<div class="jb-table-cell">
							<span style="color: white"><i class="fas fa-info-circle"></i></span>
							<h4><a href="http://0404.go.kr/dev/main.mofa" target="_blank">여행 유의지역 자세히 보기</a></h4>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="img-cover"></div>
	</div>









</body>
</html>