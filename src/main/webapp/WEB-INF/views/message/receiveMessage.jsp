<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지 : 여정 쪽지</title>
<link href="<%=request.getContextPath() %>/resources/css/jb_bootstrap.min.css?asd=2" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/js/jb_bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#delete_message').click(function() {
		var result = confirm("삭제된 쪽지는 복구하실 수 없습니다.\n정말 삭제하시겠습니까?");
		if ( result ) {
			location.href='<%=request.getContextPath()%>/message/receivecontent/delete/${message.message_id}';
		} else {
			return false;
		}
	});
});
</script>

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
.bottom {
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
<form action="<%=request.getContextPath()%>/message/receivecontent/delete/${message.message_id}" method="post">
<div class="top"></div>
<div class="middle" role="main">
	<div class="column_center">
		<table class="table table-bordered">
			<tr class="trcolor">
				<th>보낸사람</th>
				<th>보낸시간</th>
			</tr>
			<tr>
				<td>${ message.sender_id }</td>
				<td>${ message.send_time }</td>
			</tr>
			<tr>
				<td class="align" colspan="2" height="450px">${ message.content }</td>
			</tr>
		</table>
	</div>
</div>
	<div class="message_btn">
		<a class="btn btn-primary" href="<%=request.getContextPath()%>/message/retransform/${message.sender_id}" role="button">답장</a>
		<button type="submit" class="btn btn-default" id="delete_message" name="message_id">삭제</button>
		<button type="button" class="btn btn-default" onclick="self.close()">닫기</button>
	</div>
<div class="bottom">
</div>
</form>
</body>
</html>