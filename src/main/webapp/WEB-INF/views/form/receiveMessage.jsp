<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여정</title>
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
<h3><a href="<%=request.getContextPath()%>">받은 쪽지</a> | <a href="<%=request.getContextPath()%>">보낸 쪽지</a></h3>
<h4 align="right">0/1개</h4>
<table class="table">
	<tr class="trcolor">
		<th>#</th>
		<th>보낸사람</th>
		<th>보낸시각</th>
	</tr>
	<tr>
		<td>1</td>
		<td>홍길동</td>
		<td>2019-07-24 15:16:40</td>
	</tr>
	<tr>
		<td colspan="3" height="300px">내용없음<br>내용 더 없음<br>더더더 없음</td>
	</tr>
</table>
</div>
<div class="battom">
<table align="center">
	<tr>
		<td><button type="button" class="btn btn-primary">답장</button></td>
		<td>　</td>
		<td><button type="button" class="btn btn-primary" onclick="self.close()">닫기</button></td>
	</tr>
</table>
</div>
</body>
</html>