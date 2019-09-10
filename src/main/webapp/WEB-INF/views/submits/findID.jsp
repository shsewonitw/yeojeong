<%@page import="org.apache.commons.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<c:if test="${ not empty id_result }">
	<script type="text/javascript">
	alert("${id_result}");
	</script>
	
</c:if>
<body>
	<form action="<%= request.getContextPath() %>/findID" method="post">
		<table style="margin: auto;">
			<tr>
				<td colspan="2">이름 &nbsp; : <input type="text" name="name">
				</td>
			</tr> 
			<tr>
				<td colspan="2">이메일 : <input type="text" name="email">
				</td>
			</tr>
			<tr>
				<td style="text-align: right;"><input type="submit" value="찾기"></td>
				<td>
					<button href="#" onclick="javascript:self.close();">닫기</button>
				</td>
			</tr>

		</table>
	</form>

</body>
</html>