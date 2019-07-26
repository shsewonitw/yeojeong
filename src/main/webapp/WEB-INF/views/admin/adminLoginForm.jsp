<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					alt="logo"> <b>여정 관리자 로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
		</div>
	<form class="form-inline" action="<%=request.getContextPath()%>/admin" method="POST">

		<table style="margin: auto;">

			<tr>
				<th>
					<div class="input-group" style="width: 100%">
						<div class="input-group-addon">
							<img class="img_attr"
								src="<%=request.getContextPath()%>/resources/images/login_id.png"
								alt="login_id">
						</div>
						<input type="text" name="member_id" class="form-control" placeholder="아이디" />
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
						<input type="password" name="password" class="form-control" placeholder="비밀번호" />
					</div>
				</th>
			</tr>

			<tr>
				<th>
					<button type="submit" style="width: 100%"  class="btn btn-primary">로그인</button>
				</th>
			</tr>
		</table>
	</form>


</body>
</html>