<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여 정</title>
</head>

<body>
	<script type="text/javascript">

	alert("${ errorMsg }");
	location.href='<%= request.getContextPath()%>/review';
	
	
</script>
</body>
</html>