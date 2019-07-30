<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여정 관리자페이지</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>


</head>
<body style="width:100%; height:100%;">
<script type="text/javascript">
</script>
<jsp:include page="/WEB-INF/views/admin/prelude_admin.jsp"/>

<div style="height:200px;"></div>

<div style="width:80%; margin:auto;">

	<div class="list-group" style="width:40%; margin:auto; text-align:center;">
		<c:forEach items="${member_list}" var="member">
			<a href="#" class="list-group-item">${member.member_id} (${member.name})</a>
		</c:forEach>
	</div>
	
	<nav style="margin:auto; text-align:center;">
	  <ul class="pagination">
	    <li>
	      <a href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <li><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li>
	      <a href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>



</body>
</html>