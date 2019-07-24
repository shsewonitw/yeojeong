<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지 : 여정 쪽지</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>

<style type="text/css">
A:link {color:#3498DB;text-decoration:none;}
A:visited {color:#3498DB;text-decoration:none;}
A:active {color:#3498DB;text-decoration:none;}
A:hover {color:#3498DB;text-decoration:none;}
.top {
	height:170px;
}
.middle {
	height:auto;
}
th, td {
	text-align:center;
}
.trcolor {
	background-color:#F4F4F4;
}
.battom {
	height:auto;
}
</style>

</head>
<body>
<div class="top"></div>
<div class="middle">
<h3><a href="<%=request.getContextPath()%>">받은쪽지</a>(2/3) | <a href="<%=request.getContextPath()%>">보낸쪽지</a>
<button type="button" class="btn btn-primary">쪽지 쓰기</button></h3>
<table class="table">
	<tr class="trcolor">
		<th>#</th>
		<th>내용</th>
		<th>보낸사람</th>
		<th>보낸시각</th>
		<th>읽은시각</th>
	</tr>
	<tr>
		<th>3</th>
		<th><a href="<%=request.getContextPath()%>">새 메세지 확인</a></th>
		<th>고길동</th>
		<th>2019-07-24 17:10:10</th>
		<th>읽지 않음</th>
	</tr>
	<tr>
		<th>2</th>
		<th><a href="<%=request.getContextPath()%>">새 메세지 확인</a></th>
		<th>임꺽정</th>
		<th>2019-07-24 16:25:37</th>
		<th>2019-07-24 16:27:12</th>
	</tr>
	<tr>
		<td>1</td>
		<td><a href="<%=request.getContextPath()%>">여행 같이 가도 돼요?</a></td>
		<td>홍길동</td>
		<td>2019-07-24 15:16:40</td>
		<td>2019-07-24 15:20:01</td>
	</tr>
</table>
</div>
<div class="battom">
<nav align="center">
  <ul class="pagination">
    <li class="disabled"><a href="<%=request.getContextPath()%>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    <li class="active"><a href="<%=request.getContextPath()%>">1 <span class="sr-only">(current)</span></a></li>
    <li><a href="<%=request.getContextPath()%>">2 <span class="sr-only">(current)</span></a></li>
    <li><a href="<%=request.getContextPath()%>">3 <span class="sr-only">(current)</span></a></li>
    <li><a href="<%=request.getContextPath()%>">4 <span class="sr-only">(current)</span></a></li>
    <li><a href="<%=request.getContextPath()%>">5 <span class="sr-only">(current)</span></a></li>
    <li><a href="<%=request.getContextPath()%>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
   </ul>
</nav>
</div>
</body>
</html>