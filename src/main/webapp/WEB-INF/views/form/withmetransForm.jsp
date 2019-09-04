<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<form action="<%=request.getContextPath()%>/transform" method="post" enctype="multipart/form-data">
<div class="top"></div>
<div class="div_body">
<div class="withme_bar">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;같이갈래?</h3>
</div>
<div class="middle" role="main">

<select class="form-control" name="data" style="width:300px">
<option value="default">여행지</option>
<c:forEach items="${travelRegistList}" var="travelList" varStatus="status">
		<option value="${travelList.country}&${travelList.city}&${travelList.start_date}&${travelList.end_date}">
		${travelList.country} ${travelList.city} ${travelList.start_date} ~ ${travelList.end_date}</option>
</c:forEach>
</select>
<select class="form-control" id="id_gender" name="category_gender" style="width:200px">
  <option value="">성별</option>
  <option value="0">무관</option>
  <option value="1">여성</option>
  <option value="2">남성</option>
</select>
<select class="form-control" name="category_age" style="width:200px">
  <option value="">연령</option>
  <option value="0">무관</option>
  <option value="1">20대</option>
  <option value="2">30대</option>
  <option value="3">40대이상</option>
</select>
<select class="form-control" name="category_style" style="width:200px">
  <option value="">여행스타일</option> 
  <option value="0">무관</option>
  <option value="1">관광</option>
  <option value="2">맛집</option>
  <option value="3">쇼핑</option>
  <option value="4">휴양</option>
  <option value="5">엑티비티</option>
</select>
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