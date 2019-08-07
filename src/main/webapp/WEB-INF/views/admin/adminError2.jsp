<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ssw.css">

<div style="height: 170px;"></div>

<div
	style="color: rgb(52, 152, 219); margin: auto; font-family: sans-serif; font-size: 30px; text-align: center;">
	<img
		style="width: auto; height: auto; max-width: 100px; max-height: 100px;"
		src="<%=request.getContextPath()%>/resources/images/admin_logo.png"
		alt="logo"> <b>해당 관리자는 이미 접속중입니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>

	<div class="form-group">
			<button type="submit" onclick="location.href='<%=request.getContextPath()%>/admin'" class="btn btn-default">로그인</button>
			<button type="submit" onclick="location.href='<%=request.getContextPath()%>/'" class="btn btn-default">홈으로</button>
	</div>
</div>