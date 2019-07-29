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

<div class="top"></div>
<div class="middle" role="main">
	<div class="column_center">
		<input type="hidden" name="sender_id" value="${ login_member.member_id }">
			<input class="form-control" id="disabledInput" name="receiver_id" type="text" placeholder="받는 사람${ rList.sender_id }" readonly>
				<div class="textarea">
					<textarea class="form-control" id="textarea" name="content" maxlength="1000" rows="23" cols="81" placeholder="내용을 입력하세요"></textarea>
				</div>
					<div class="text_byte">
						<span class="counter">###</span>
					</div>
	</div>
</div>
	<div class="message_btn">
		<input class="btn btn-primary" type="submit" value="전송">
		<button type="button" class="btn btn-default" onclick="self.close()">취소</button>
	</div>
<div class="battom">
</div>

</body>
</html>