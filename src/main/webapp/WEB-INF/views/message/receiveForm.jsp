<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지 : 여정 쪽지</title>
<link href="resources/css/jb_bootstrap.min.css?asd=asdda" rel="stylesheet">
<script src="resources/js/jb_bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>

<style type="text/css">
.a:link {color:#3498DB;text-decoration:none;}
.a:visited {color:#3498DB;text-decoration:none;}
.a:active {color:#3498DB;text-decoration:none;}
.a:hover {color:#3498DB;text-decoration:none;}
.top {
	height:170px;
}
.message_bar {
	height:auto;
}
.middle {
	height:auto;
}
th, td {
	text-align:center;
}
.trcolor {
	background-color:#F4F4F4;
}
.battom {
	position:absolute;
	left:50%;
	transform:translate(-50%);
	height:auto;
}
</style>

</head>
<body>

<script type="text/javascript">
/* 메세지 수신 부분 */
function winopen() {
	window.open("<%=request.getContextPath()%>/receivecontent","receivecontentOpen",
		"width=740,height=620,left=150,top=150,resizable=no,location=no,menubar=no,toolbar=no,scrollbars=no");
};

/* 메세지 답장(아이디 클릭) 부분 */
function transform() {
	window.open("<%=request.getContextPath()%>/transform","receivecontentOpen",
		"width=740,height=620,left=150,top=150,resizable=no,location=no,menubar=no,toolbar=no,scrollbars=no");
};
</script>

<div class="top"></div>
<div class="message_bar">
<h3><a href="<%=request.getContextPath()%>/receive" class="a">　받은쪽지</a>(${readCount}/${r_count}) | <a href="<%=request.getContextPath()%>/receive" class="a">보낸쪽지</a>
<button type="button" class="btn btn-default">삭제</button></h3>
</div>
<div class="middle">
<table class="table">
	<tr class="trcolor">
		<th width="10%"><input type="checkbox" name="all_chk"></th>
		<th width="20%">보낸사람</th>
		<th width="40%">내용</th>
		<th width="15%">보낸시간</th>
		<th width="15%">읽은시간</th>
	</tr>
	
	<c:forEach items="${rList}" var="rmsg">
	<c:if test="${ empty rmsg.receive_time }" var="r">
	<tr>
		<th width="10%"><input type="checkbox" name="${rmsg.message_id}"></th>
		<th width="20%"><a href="#" class="a" onclick="transform();">${rmsg.sender_id}</a></th>
		<th width="40%"><a href="<%=request.getContextPath()%>/message/receivecontent/${rmsg.message_id}" class="a">새 메세지 확인</a></th>
		<th width="15%">${ rmsg.send_time }</th>
		<th width="15%">${ empty rmsg.receive_time ? '읽지않음' : rmsg.receive_time }</th>
	</tr>
	</c:if>
	
	<c:if test="${ not r }">
	<tr>
		<td width="10%"><input type="checkbox" name="${rmsg.message_id}"></td>
		<td width="20%"><a href="#" class="a" onclick="transform();">${rmsg.sender_id}</a></td>
		<td width="40%"><a href="<%=request.getContextPath()%>/message/receivecontent/${rmsg.message_id}" class="a">${rmsg.content}
		<!-- 10글자 이상 될 시 ...으로 자르는 코드 -->
           <c:choose>
           <c:when test="${fn:length(rmsg.content) gt 10}">
           <c:out value="${fn:substring(rmsg.content, 0, 10)}....">
		</c:out></c:when>
           <c:otherwise>
           <c:out value="${rmsg.content}">
             </c:out></c:otherwise>
         </c:choose>
         <!----------------------------------->
         </a></td>
		<td width="15%">${ rmsg.send_time }</td>
		<td width="15%">${ rmsg.receive_time }</td>
	</tr>
	</c:if>
	</c:forEach>
	<c:if test="${ not message_id }">
	<tr>
		<td colspan="5"><a href="#" class="a" onclick="winopen();">쪽지가 없습니다.</a></td>
	</tr>
	</c:if>
</table>
</div>
<div class="battom">
<nav>
  <ul class="pagination">
  
  <c:if test="${ beforePageNo ne -1 }">
    <li class="active"><a href="<%=request.getContextPath()%>/message/receive/${ beforePageNo }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    </c:if>
    
  <c:forEach var="pageNo" begin="${ startPageNo }" end="${ endPageNo }">
	<c:if test="${ curPage eq pageNo }" var="r">
    <li class="active">${ pageNo }<span class="sr-only">(current)</span></li>
    </c:if>
    <c:if test="${ not r }">
    <li class="active"><a href="<%=request.getContextPath()%>/message/receive/${ pageNo }">${ pageNo }<span class="sr-only">(current)</span></a></li>
    </c:if>
  </c:forEach>
  
  <c:if test="${ afterPageNo ne -1 }">
    <li><a href="<%=request.getContextPath()%>/message/receive/${ afterPageNo }" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	</c:if>
	
   </ul>
</nav>
</div>
</body>
</html>