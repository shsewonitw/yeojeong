<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이갈래 : 여정 같이갈래</title>
</head>
<body>

<c:if test="${ result }">
<script type="text/javascript">
	
	
	alert("게시글이 작성되었습니다");
	location.href='<%= request.getContextPath()%>/withmelist';
	
</script>
</c:if>

<c:if test="${!result }">
<script type="text/javascript">
	
	
	alert("게시글 작성에 실패했습니다");
	location.href='<%= request.getContextPath()%>/withmelist';
	
</script>
</c:if>
</body>
</html>