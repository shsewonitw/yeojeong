<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 . 여행지데이터 업데이트</title>


<style type="text/css">
.mainDiv{
	margin: auto;
	margin-top : 20px;
	align: center;
	width: 50%;
	height: auto;
}

@import url(https://fonts.googleapis.com/css?family=Lato);
body {
	margin: 0;
}
nav {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100px;
	padding: 0 0;
	box-sizing: border-box;
}

nav::before {
	position: absolute;
	top: 5%;
	left: 0;
	width: 100%;
	color: black;
	font: 400 24px/1 'Lato', sans-serif;
	text-align: center;
}



/* common */
nav ul {
	position: relative;
	margin: 0;
	padding: 0;
	list-style: none;
}
nav ul::after {
	display: block;
	clear: both;
	content: '';
}
nav ul li {
	position: relative;
	float: left;
	border: 2px solid black;
}
nav ul li:not(:first-child) {
	border-left: none;
}
nav ul li:hover {
	background-color: rgba(255,255,255,.3);
}
nav ul li a {
	display: inline-block;
	padding: 1em 4em;
	color: black;
	font: 400 18px/1 'Lato', sans-serif;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
}
nav ul ul {
	position: absolute;
	top: 100%;
	left: -2px;
}
nav ul ul li {
	float: none;
	margin: 0;
}
nav ul ul li:not(:first-child) {
	border: 2px solid black;
	border-top: none;
}
nav ul ul ul {
	position: absolute;
	top: -2px;
	left: 100%;
}



/* DEMO #5 */
.nav05 ul li {
	perspective: 300px;
}
.nav05 ul ul {
	visibility: hidden;
	opacity: 0;
	transition: .3s ease-in-out;
	transform: rotateX(-90deg) rotateY(0);
	transform-origin: 0 0;
}
.nav05 ul ul li {
	perspective: 1500px;
}
.nav05 ul ul ul {
	transform: rotateX(0) rotateY(-90deg);
}
.nav05 ul li:hover > ul {
	visibility: visible;
	opacity: 1;
	transform: rotateX(0) rotateY(0);
}

</style>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

</head>
<body>
<script type="text/javascript">
</script>
<jsp:include page="/WEB-INF/views/admin/prelude_admin.jsp"/>

<div style="height:200px;"></div>
<div class="mainDiv">


<!-- 드롭다운 메뉴 -->
		<nav class="nav05">
			<ul>
				<li><a href="#" style="text-decoration: none;">수정하기</a>
				<a href="<%=request.getContextPath()%>/adminCityDataInsert" style="text-decoration: none;">등록하기</a>
					<ul>
						<c:forEach items="${countryList }" var="country">
						<li><a href="#" style="text-decoration: none;">${country}</a>
							<ul>
								<c:forEach items="${map}" var="map">
									<c:if test="${map.key eq country}">
										<c:forEach items="${map.value }" var="city">
											<li><a href="<%=request.getContextPath()%>/adminCityDataUpdate" style="text-decoration: none;">${city}</a></li>
										</c:forEach>
									</c:if>
								</c:forEach>
							</ul>
						</li>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</nav>
		
		<!--  -->
</div>


</body>
</html>

