<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이갈래 : 여정 같이갈래</title>
<link href="<%=request.getContextPath() %>/resources/css/jb_bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/js/jb_bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<style type="text/css">
.a:link {color:#3498DB;text-decoration:none;}
.a:visited {color:#3498DB;text-decoration:none;}
.a:active {color:#3498DB;text-decoration:none;}
.a:hover {color:#3498DB;text-decoration:none;}
.top {
	height:170px;
}
.div_body {
	width:80%;
	margin:0 auto;
}
.withme_bar {
	height:auto;
}
.middle {
	height:534px;
}
.trcolor {
	background-color:#F4F4F4;
}
th, td {
	text-align:center;
}
.write_btn {
	position:absolute;
	left:15%;
}
.bottom {
	position:relative;
	left:44%;
	height:auto;
}
</style>
</head>
<body>
<div class="top"></div>
<div class="div_body">
<div class="withme_bar">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;같이갈래?</h3>
</div>
<div class="middle">
<table class="table">
	<tr class="trcolor">
		<th><input type="hidden" value="No"></th>
		<th width="15%">여행지</th>
		<th width="15%">출국일</th>
		<th width="15%">입국일</th>
		<th width="5%">성별</th>
		<th width="10%">연령</th>
		<th width="10%">스타일</th>
		<th width="5%">조회수</th>
		<th width="10%">작성자</th>
		<th width="10%">작성일</th>
		<th width="5%">상태</th>
	</tr>
	
	<c:if test="${ empty withmelist }">
	<tr>
		<td colspan="11">게시글이 없습니다.</td>
	</tr>
	</c:if>
	
	<c:forEach items="${withmelist}" var="wlist">
	<tr>
		<td><input type="hidden" name="article_id" value="${wlist.article_id}"></td>
		<td width="15%">${wlist.country} ${wlist.city}</td>
		<td width="15%">${wlist.start_date}</td>
		<td width="15%">${wlist.end_date}</td>
		<td width="5%">${wlist.category_genderString}</td>
		<td width="10%">${wlist.category_age}</td>
		<td width="10%">${wlist.category_style}</td>
		<td width="5%">${wlist.read_count}</td>
		<td width="10%">${wlist.name}</td>
		<td width="10%">${wlist.write_time}</td>
		<td width="5%">상태</td>
	</tr>
	</c:forEach>
</table>
</div>
	<div class="write_btn">
		<a class="btn btn-primary" href="<%=request.getContextPath()%>/transform" role="button">일정등록</a>
	</div>
<div class="bottom">
<nav>
  <ul class="pagination">
  
  <c:if test="${ beforePageNo ne -1 }">
    <li><a href="<%=request.getContextPath()%>/withmelist/${ beforePageNo }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    </c:if>
    
  <c:forEach var="pageNo" begin="${ startPageNo }" end="${ endPageNo }">
	<c:if test="${ curPage eq pageNo }" var="r">
    <li class="active"><a href="#">${ pageNo }</a></li>
    </c:if>
    <c:if test="${ not r }">
    <li><a href="<%=request.getContextPath()%>/withmelist/${ pageNo }">${ pageNo }</a></li>
    </c:if>
  </c:forEach>
  
  <c:if test="${ afterPageNo ne -1 }">
    <li><a href="<%=request.getContextPath()%>/withmelist/${ afterPageNo }" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	</c:if>
	
   </ul>
</nav>
</div>
</div>
</body>
</html>