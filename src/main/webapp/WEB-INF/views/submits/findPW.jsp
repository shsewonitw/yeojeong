<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript">


$(function(){
	
	
});


</script>

<title>비밀번호 찾기</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/findPW" method="post">
		<table style="margin: auto;">
			<tr>
				<td colspan="2">아이디 : <input type="text" name="member_id">
				</td>
			</tr>
			<tr>
				<td colspan="2">이메일 : <input type="text" name="email">
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="찾기"></td>
				<td>
					<button href="#" onclick="javascript:self.close();">닫기</button>
				</td>
			</tr>

		</table>
	</form>

</body>
</html>