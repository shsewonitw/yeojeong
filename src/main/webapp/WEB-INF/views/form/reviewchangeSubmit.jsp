<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 결과</title>
</head>
<body>

<c:if test="${ result}">
<script type="text/javascript">
	
	
	alert("게시글 수정 완료");
	location.href='<%= request.getContextPath()%>/reviewlist';
	
</script>
</c:if>

<c:if test="${!result}">
<script type="text/javascript">
	
	
	alert("게시글 수정 실패");
	location.href='<%= request.getContextPath()%>/reviewlist';
	
</script>
</c:if>
</body>
</html>