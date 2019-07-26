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

<c:if test="${ result }">
<script type="text/javascript">
	
	
	alert("게시글이 작성 되었습니다");
	location.href='<%= request.getContextPath()%>/form/reviewlist';
	
</script>
</c:if>

<c:if test="${!result }">
<script type="text/javascript">
	
	
	alert("게시글이 작성에 실패했습니다");
	location.href='<%= request.getContextPath()%>/form/reviewlist';
	
</script>
</c:if>
</body>
</html>