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
		src="<%=request.getContextPath()%>/resources/images/logo.png"
		alt="logo"> <b>로그인이 필요한 서비스입니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>

	<div class="form-group">
			<button type="submit" class="btn btn-default">로그인</button>
			<button type="submit" class="btn btn-default">홈으로</button>
	</div>
</div>