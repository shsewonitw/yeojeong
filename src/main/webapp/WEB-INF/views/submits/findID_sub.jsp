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

<h2>당신의 아이디는 ${fn:substring(member_result.member_id, 0, fn:length(member_result.member_id)/2  )  } ** ${fn:substring(member_result.member_id, fn:length(member_result.member_id)/2 +1 , fn:length(member_result.member_id)) } 입니다. </h2>




	
		<table style="margin: auto;">
			<tr>
				<td><button type="submit" onclick="location.href='<%= request.getContextPath() %>/findPW'">비밀번호 찾기</button></td>
				<td>
					<button onclick="javascript:self.close();">닫기</button>
				</td>
			</tr>
		</table>
	

</body>
</html>