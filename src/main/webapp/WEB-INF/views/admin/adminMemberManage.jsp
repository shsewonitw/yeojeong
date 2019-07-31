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
	      <c:if test="${beforePageNo ne -1}">
		      <a href="<%=request.getContextPath()%>/adminMemberManage/${beforePageNo}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
	      </c:if>
	    </li>
	    
	    
		<c:forEach var="pageNo" begin="${startPageNo}" end="${endPageNo}">
			<c:if test="${ curPage eq pageNo }" var="r">
				<li><a href="#">${pageNo }</a></li>
			</c:if>
			<c:if test="${not r }">
				<li><a href="<%=request.getContextPath()%>/adminMemberManage/${pageNo}">${pageNo}</a></li>
			</c:if>
		</c:forEach>	    
	    
	    <li>
	      <c:if test="${afterPageNo ne -1}">
	      <a href="<%=request.getContextPath()%>/adminMemberManage/${afterPageNo}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	      </c:if>
	    </li>
	  </ul>
	</nav>
	
	<!-- 
		<c:if test="${beforePageNo ne -1}">
			<a href="<%=request.getContextPath()%>/message/receive/${beforePageNo}">이전</a>
		</c:if>
		
		<c:forEach var="pageNo" begin="${startPageNo}" end="${endPageNo}">
			<c:if test="${ curPage eq pageNo }" var="r">
				[${pageNo }]
			</c:if>
			<c:if test="${not r }">
				<a href="<%=request.getContextPath()%>/message/receive/${pageNo}">${pageNo}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${afterPageNo ne -1}">
			<a href="<%=request.getContextPath()%>/message/receive/${afterPageNo}">다음</a>
		</c:if>
	 -->
</div>



</body>
</html>