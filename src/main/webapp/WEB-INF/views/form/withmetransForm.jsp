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
div {
	display:block;
}
.div_body {
	width:80%;
	margin:0 auto;
}
.top {
	height:auto;
}
.middle {
	margin:0 auto;
	padding:2% 10% 0;
	height:auto;
}
.column_center {
	position:relative;
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
.write_btn {
	position:absolute;
	left:95%;
	transform:translate(-5%);
}
.bottom {
	position:absolute;
	left:50%;
	transform:translate(-50%);
	height:auto;
}
</style>
</head>
<body>
<form action="<%=request.getContextPath()%>/transformsubmit" method="post">
<div class="top"></div>
<div class="div_body">
<div class="withme_bar">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;같이갈래?</h3>
</div>
<div class="middle" role="main">
<table class="table">
	<tr class="trcolor">
		<th width="5%">#</th>
		<th width="20%">작성자</th>
		<th width="20%">아이디</th>
		<th width="5%">성별</th>
		<th width="15%">연령</th>
		<th width="15%">스타일</th>
		<th width="5%">조회수</th>
		<th width="15%">작성날짜</th>
	</tr>
	
	<c:if test="${ empty withmelist }">
	<tr>
		<td colspan="8">게시글이 없습니다.</td>
	</tr>
	</c:if>
	
	<c:forEach items="${withmelist}" var="wlist">
	<tr>
		<td width="5%">${wlist.article_id}</td>
		<td width="20%">${wlist.name}</td>
		<td width="20%">${wlist.member_id}</td>
		<td width="5%">${wlist.category_gender}</td>
		<td width="15%">${wlist.category_age}</td>
		<td width="15%">${wlist.category_style}</td>
		<td width="5%">${wlist.write_time}</td>
		<td width="15%">${wlist.read_count}</td>
	</tr>
	</c:forEach>
</table>
</div>
	<div class="write_btn">
		<a class="btn btn-primary" href="<%=request.getContextPath()%>/transform" role="button">글쓰기</a>
	</div>
<div class="bottom">
<nav>
  <ul class="pagination">
  
  <c:if test="${ beforePageNo ne -1 }">
    <li><a href="<%=request.getContextPath()%>/withmelist${ beforePageNo }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    </c:if>
    
  <c:forEach var="pageNo" begin="${ startPageNo }" end="${ endPageNo }">
	<c:if test="${ curPage eq pageNo }" var="r">
    <li class="active"><a href="#">${ pageNo }</a></li>
    </c:if>
    <c:if test="${ not r }">
    <li><a href="<%=request.getContextPath()%>/withmelist${ pageNo }">${ pageNo }</a></li>
    </c:if>
  </c:forEach>
  
  <c:if test="${ afterPageNo ne -1 }">
    <li><a href="<%=request.getContextPath()%>/withmelist${ afterPageNo }" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	</c:if>
	
   </ul>
</nav>
</div>
</div>
</form>
</body>
</html>