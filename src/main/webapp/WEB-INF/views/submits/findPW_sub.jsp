<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>

<h2>당신의 비밀번호는 ${ member_result.password } 입니다.</h2>




	
		<table style="margin: auto;">
			<tr>
				<td>
					<button onclick="javascript:self.close();">닫기</button>
				</td>
			</tr>
		</table>
	

</body>
</html>