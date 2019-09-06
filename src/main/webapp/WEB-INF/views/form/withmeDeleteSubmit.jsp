<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이갈래 : 여정 같이갈래</title>
<link href="<%=request.getContextPath() %>/resources/css/jb_bootstrap.min.css?asd=asdda" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/js/jb_bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<style type="text/css">
.a:link {color:#3498DB;text-decoration:none;}
.a:visited {color:#3498DB;text-decoration:none;}
.a:active {color:#3498DB;text-decoration:none;}
.a:hover {color:#3498DB;text-decoration:none;}
div {
	display:block;
}
.top {
	height:auto;
}
.middle {
	margin:0 auto;
	padding:30% 10% 0;
	height:auto;
}
.column_center {
	position:relative;
	text-align:center;
    float:center;
    width:auto;
}
.textarea {
	margin:0 auto;
	padding:2% 0 0;
	height:auto;
}
.form-control {
	resize:none;
}
.text_byte {
	position:absolute;
	margin:0 auto;
	padding:1% 0 0;
	right:0;
	height:auto;
}
.bottom {
	height:auto;
}
</style>

</head>
<body>
<div class="top"></div>
<div class="middle" role="main">
	<div class="column_center">
		<c:if test="${ result }">
<script type="text/javascript">
	
	alert("게시글이 삭제되었습니다");
	location.href='<%= request.getContextPath()%>/auth/withmelist';
	
</script>
</c:if>
	</div>
</div>
<div class="bottom">
</div>

</body>
</html>