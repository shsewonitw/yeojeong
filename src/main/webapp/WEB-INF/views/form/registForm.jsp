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

<title>회원가입</title>

<link href="resources/css/kh_bootstrap.min.css?asd=asdda"
	rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script src="resources/js/kh_bootstrap.min.js"></script>

<style type="text/css">
.form-control {
	border-radius: 4px 4px 4px 4px;
	border-left-color: #ccc;
	width: 100%;
	height: 40px
}
</style>
<script type="text/javascript">
	$(function() {
		var thisDate = new Date();
		var thisYear = thisDate.getFullYear();
		System.out.println("2");
		alert('${thisYear}');
	});
</script>

</head>
<body>
	<script type="text/javascript">
		alert(11);
	</script>

	<div style="height: 25%;"></div>

	<form:form modelAttribute="member">

		<table
			style="border-spacing: 10px; margin: auto; border-collapse: separate;">
			<tr>
				<th colspan="3"
					style="color: rgb(52, 152, 219); text-align: center; font-family: sans-serif; font-size: 30px;">
					여정 회원가입</th>
			</tr>
			<tr>
				<th colspan="3">
					<form:input size="30" class="form-control" path="member_id" placeholder="아이디" />
				</th>
			<tr>
				<th colspan="3"><form:password size="30" class="form-control"
						path="password" placeholder="비밀번호" /></th>
			</tr>
			<tr>
				<th colspan="3"><form:password size="30" class="form-control"
						path="name" placeholder="이름" /></th>
			</tr>
			<tr>
				<th style="text-align: center;" colspan="3"><form:radiobutton
						path="gender" value="1" label="남자" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <form:radiobutton path="gender"
						value="2" label="여자" /></th>
			</tr>

			<tr>
				<th style="width: 100px">
					<input size="30" type="text" class="form-control" id="" name="year" placeholder="년 (4자)" />
				</th>
				<th style="width: 100px">
					<select style="" id="" class="form-control" name="month">
							<option value="" selected="selected">월</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select>
				</th>
				<th style="width: 100px">
					<input size="30" type="text" class="form-control" id="" path="day" placeholder="일 " />
				</th>
			</tr>
			
			<tr>
				<th colspan="3">
					<form:input size="30" class="form-control" path="member_id" placeholder="이메일(선택)" />
				</th>
			</tr>
			
			<tr>
				<th style="width: 100px">
					<input style="" id="" class="form-control" name="year" />
				</th>
				<th style="width: 100px">
					<input style="" id="" class="form-control" name="month" />
				</th>
				<th style="width: 100px">
					<input style="" id="" class="form-control" name="day" />
				</th>
			</tr>
			<tr>
				<th colspan="3">
					<button style="width: 100%;height: 40px" type="button" class="btn btn-primary">가입</button>
				</th>
			</tr>

		</table>


	</form:form>

</body>
</html>