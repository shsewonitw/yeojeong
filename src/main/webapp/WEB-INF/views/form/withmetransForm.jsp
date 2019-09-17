<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이갈래 : 여정 같이갈래</title>
<link href="<%=request.getContextPath() %>/resources/css/jb_bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/js/jb_bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<style type="text/css">
.a:link {color:#3498DB;text-decoration:none;}
.a:visited {color:#3498DB;text-decoration:none;}
.a:active {color:#3498DB;text-decoration:none;}
.a:hover {color:#3498DB;text-decoration:none;}
div {
	display:block;
}
.div_body {
	width:80%;
	margin:0 auto;
}
.top {
	height:170px;
}
.middle {
	margin:0 auto;
	padding:2% 10% 0;
	height:auto;
}
.travel {
	position:relative;
	left:35%;
}
.gender {
	position:relative;
	padding:1% 0 0;
	left:35%;
}
.age {
	position:relative;
	padding:1% 0 0;
	left:35%;
}
.style {
	position:relative;
	padding:1% 0 0;
	left:35%;
}
.column_center {
	position:relative;
    float:center;
    width:auto;
}
.textarea {
	margin:0 auto;
	padding:2% 0 0;
	height:auto;
}
.form-control {
	resize:none;
}
.write_btn {
	padding:5% 0 0;
	position:absolute;
	left:50%;
}
.bottom {
	position:absolute;
	left:50%;
	transform:translate(-50%);
	height:auto;
}
</style>
</head>
<body>
<form action="<%=request.getContextPath()%>/auth/transform" method="post" enctype="multipart/form-data">
	<div class="top"></div>
	<div class="div_body">
	<div class="withme_bar">
	<h1 style="color:rgb(52,152,219); font-weight:bold; text-align:center;"><img style="width: auto; height: auto; max-width: 100px; max-height: 100px;"
					src="<%=request.getContextPath()%>/resources/images/logo.png"
					alt="logo"><b>같이 갈래?</b></h1>
	</div>
	<div class="middle" role="main">
	
	<jsp:useBean id="today" class="java.util.Date" />
	<div class="travel">
		<h5>여행지
		<select class="form-control" name="data" style="width:400px" required="required">
		<option value="">여행지를 선택해주세요</option>
			<c:forEach items="${travelRegistList}" var="travelList" varStatus="status">
					<option   
						<c:forEach items="${withme_viewList}" var="withmeview">
							<c:if test="${travelList.travel_id eq withmeview.travel_id || today > travelList.end_date}">disabled="disabled"
							</c:if>
						</c:forEach>
					value="${travelList.country}&${travelList.city}&${travelList.start_date}&${travelList.end_date}&${travelList.travel_id}">
					${travelList.country} ${travelList.city} ${travelList.start_date} ~ ${travelList.end_date}
						<c:forEach items="${withme_viewList}" var="withmeview">
							<c:if test="${travelList.travel_id eq withmeview.travel_id}">&nbsp;-등록완료
							</c:if>
						</c:forEach>
							<c:if test="${today > travelList.end_date}">&nbsp;-여행종료
							</c:if>
					</option>
			</c:forEach>
		</select>
		</h5>
	</div>
	
	<div class="gender">
		<h5>성별
		<select class="form-control" name="category_gender" style="width:400px" required="required">
		  <option value="">성별을 선택해주세요</option>
		  <option value="0">무관</option>
		  <option value="1">여성</option>
		  <option value="2">남성</option>
		</select>
		</h5>
	</div>
	
	<div class="age">
		<h5>연령
		<select class="form-control" name="category_age" style="width:400px" required="required">
		  <option value="">연령을 선택해주세요</option>
		  <option value="0">무관</option>
		  <option value="1">20대</option>
		  <option value="2">30대</option>
		  <option value="3">40대이상</option>
		</select>
		</h5>
	</div>
	
	<div class="style">
		<h5>여행스타일
		<select class="form-control" name="category_style" style="width:400px" required="required">
		  <option value="">여행스타일을 선택해주세요</option>
		  <option value="0">무관</option>
		  <option value="1">관광</option>
		  <option value="2">맛집</option>
		  <option value="3">쇼핑</option>
		  <option value="4">휴양</option>
		  <option value="5">엑티비티</option>
		</select>
		</h5>
	</div>
	</div>
		<div class="write_btn">
			<input class="btn btn-primary" type="submit" value="작성">
		</div>
	<div class="bottom">
	
	</div>
	</div>
	
</form>
</body>
</html>