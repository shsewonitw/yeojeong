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

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>

</head>
<body>
	r 52 g 152 b 219

	<form:form modelAttribute="member">

		<table>
		<tr>
				<th style="color: rgb(52,152,219); font-family: sans-serif;">여정 로그인</th>
			</tr>
			<tr>
				<th><form:input path="member_id" /></th>
			</tr>
			<tr>
				<th><form:password path="password" /></th>
			</tr>
			<tr>
				<th><inputcheckbox path="checkbox" label="아이디 저장" /></th>
			</tr>
			<tr>
				<th><input type="submit" value="로그인"></th>
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