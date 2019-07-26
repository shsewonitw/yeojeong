<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지작성 : 여정 쪽지</title>
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
				<td width="20%" align="right"><b>받는사람</b></td>
				<td width="80%">누구누구</td>
			</tr>
			<tr>
				<td colspan="2" height="300px"><textarea rows="16" cols="81" style="resize:none;" name="content"></textarea></td>
			</tr>
		</table>
		</div>
	</div>
<div class="battom">
	<table align="center">
		<tr>
			<td><input class="btn btn-primary" type="submit" value="전송"></td>
			<td>　</td>
			<td><button type="button" class="btn btn-default" onclick="self.close()">취소</button></td>
		</tr>
	</table>
</div>
</body>
</html>