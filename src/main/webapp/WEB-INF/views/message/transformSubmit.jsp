<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지작성 : 여정 쪽지</title>
<link href="<%=request.getContextPath() %>/resources/css/jb_bootstrap.min.css?asd=asdda" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/js/jb_bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<script type="text/javascript">
$(function() {
	 $('#textarea').keyup(function (e){
        var content = $(this).val();
        $('.counter').text(content.length + ' / 1000');
    });
    $('#textarea').keyup();
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
	padding:30% 10% 0;
	height:auto;
}
.column_center {
	position:relative;
	text-align:center;
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
.text_byte {
	position:absolute;
	margin:0 auto;
	padding:1% 0 0;
	right:0;
	height:auto;
}
.battom {
	height:auto;
}
.message_btn {
	position:absolute;
	padding: 3% 0 0;
	left:50%;
	transform:translate(-50%);
}
</style>

</head>
<body>
<form action="<%=request.getContextPath()%>/message/transform/{sender_id}" method="post">
<div class="top"></div>
<div class="middle" role="main">
	<div class="column_center">
		<b>${ message.receiver_id }</b> 님께 쪽지를 발송하였습니다.
	</div>
</div>
	<div class="message_btn">
		<button type="button" class="btn btn-default" onclick="self.close()">닫기</button>
	</div>
</form>
<div class="battom">
</div>

</body>
</html>