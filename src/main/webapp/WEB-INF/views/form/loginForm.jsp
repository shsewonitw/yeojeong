<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>로그인 화면</title>

<link href="resources/css/kh_bootstrap.min.css?asd=asdda"
	rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script src="resources/js/kh_bootstrap.min.js"></script>


<style type="text/css">
th, td {
	padding-bottom: 8px;
}

.img_attr {
	height: 45%;
}
</style>





</head>
<body>
	

	<div style="height: 25%;"></div>
			<div
				style="color: rgb(52, 152, 219); margin: auto; font-family: sans-serif; font-size: 30px; text-align: center; ">
				<img
					style="width: auto; height: auto; max-width: 100px; max-height: 100px;"
					src="<%=request.getContextPath()%>/resources/images/logo.png"
					alt="logo"> <b>여정 로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
		</div>
	<form:form modelAttribute="member" class="form-inline">

		<table style="margin: auto;">

			<tr>
				<th>
					<div class="input-group" style="width: 100%">
						<div class="input-group-addon">
							<img class="img_attr"
								src="<%=request.getContextPath()%>/resources/images/login_id.png"
								alt="login_id">
						</div>
						<form:input class="form-control" path="member_id"
							placeholder="아이디" />
					</div>
				</th>
			</tr>
			<tr>
				<th>
					<div class="input-group" style="width: 100%">
						<div class="input-group-addon">
							<img class="img_attr"
								src="<%=request.getContextPath()%>/resources/images/login_password.png"
								alt="login_password">
						</div>
						<form:password class="form-control" path="password"
							placeholder="비밀번호" />
					</div>
				</th>
			</tr>
			<tr>
				<td><label><input type="checkbox" style=""
						name="rememberID" /> 아이디 저장</label></td>
			</tr>
			<tr>
				<th>
					<button style="width: 100%" type="button" class="btn btn-primary">로그인</button>
				</th>
			</tr>
			<tr>
				<th>네이버</th>
			</tr>
			<tr>
				<th>카카오</th>
			</tr>
		</table>
	</form:form>


</body>
</html>