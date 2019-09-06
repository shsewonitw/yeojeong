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
	
	
	alert("일정이 등록되었습니다.");
	location.href='<%= request.getContextPath()%>/auth/withmelist';
	
</script>
</c:if>

<c:if test="${!result }">
<script type="text/javascript">
	
	
	alert("일정등록에 오류가 발생했습니다.");
	location.href='<%= request.getContextPath()%>/auth/withmelist';
	
</script>
</c:if>
</body>
</html>