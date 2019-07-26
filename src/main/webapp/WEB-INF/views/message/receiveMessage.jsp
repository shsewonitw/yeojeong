<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지 : 여정 쪽지</title>
<link href="resources/css/jb_bootstrap.min.css?asd=asdda" rel="stylesheet">
<script src="resources/js/jb_bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>

<style type="text/css">
.a:link {color:#3498DB;text-decoration:none;}
.a:visited {color:#3498DB;text-decoration:none;}
.a:active {color:#3498DB;text-decoration:none;}
.a:hover {color:#3498DB;text-decoration:none;}
div {
	display:block;
}
.top {
	height:auto;
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
.message_btn {
	position:absolute;
	left:50%;
	transform:translate(-50%);
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
				<th>보낸시간</th>
			</tr>
			<tr>
				<td>홍길동</td>
				<td>2019-07-24 15:32</td>
			</tr>
			<tr>
				<td class="align" colspan="2" height="450px">내용없음<br>내용 더 없음<br>더더더 없음</td>
			</tr>
		</table>
	</div>
</div>
	<div class="message_btn">
		<a class="btn btn-primary" href="<%=request.getContextPath()%>/transform" role="button">답장</a>
		<button type="button" class="btn btn-default" onclick="self.close()">닫기</button>
	</div>
<div class="battom">
</div>
</body>
</html>