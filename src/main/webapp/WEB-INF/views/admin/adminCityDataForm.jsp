<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 . 여행지데이터 업데이트</title>




<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

</head>
<body>
	<script type="text/javascript">
		
	</script>
	<jsp:include page="/WEB-INF/views/admin/prelude_admin.jsp" />

	<div style="height: 280px;"></div>
	
	
	<h1></h1>

	

	<jsp:include page="/WEB-INF/views/admin/adminCountryDropdownMenu.jsp" />

	<div style="overflow:hidden;">
		<div style="float:left;">
				
		<c:if test="${adminCityDataResult eq 'insertOk'}">
			<div class="alert alert-success" role="alert">도시 정보가 정상적으로 추가 되었습니다.</div>
		</c:if> 
		<c:if test="${adminCityDataResult eq 'updateOk'}">
			<div class="alert alert-success" role="alert">도시 정보가 정상적으로 업데이트 되었습니다.</div>
		</c:if> 
		<c:if test="${adminCityDataResult eq 'deleteOk'}">
			<div class="alert alert-success" role="alert">도시 정보가 정상적으로 삭제 되었습니다.</div>
		</c:if> 
			
		</div>
	</div>

</body>
</html>