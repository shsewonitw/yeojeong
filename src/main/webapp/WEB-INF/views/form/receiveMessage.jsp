<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여정</title>
<link href="resources/css/jb_bootstrap.min.css?asd=asdda" rel="stylesheet">
<script src="resources/js/jb_bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>

<style type="text/css">
A:link {color:#3498DB;text-decoration:none;}
A:visited {color:#3498DB;text-decoration:none;}
A:active {color:#3498DB;text-decoration:none;}
A:hover {color:#3498DB;text-decoration:none;}
div {
	display:block;
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
th, td {
	text-align:center;
}
.align {
	text-align:left;
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
	<div class="middle" role="main">
	<div class="column_center">
		<table class="table table-bordered">
			<tr class="trcolor">
				<th>보낸사람</th>
				<th>보낸시각</th>
			</tr>
			<tr>
				<td>홍길동</td>
				<td>2019-07-24 15:16:40</td>
			</tr>
			<tr>
				<td class="align" colspan="2" height="300px">내용없음<br>내용 더 없음<br>더더더 없음</td>
			</tr>
		</table>
		</div>
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