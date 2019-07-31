<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은쪽지 : 여정 쪽지</title>
<link href="<%=request.getContextPath() %>/resources/css/jb_bootstrap.min.css?asd=1" rel="stylesheet">
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
	function winopen(num) {
		window.open("<%=request.getContextPath()%>/message/receivecontent/"+num,"receivecontentOpen",
			"width=740,height=620,left=150,top=150,resizable=no,location=no,menubar=no,toolbar=no,scrollbars=no");
	};
	
	/* 메세지 답장(아이디 클릭) 부분 */
	function transform(sender) {
		window.open("<%=request.getContextPath()%>/message/transform/"+sender,"receivecontentOpen",
			"width=740,height=620,left=150,top=150,resizable=no,location=no,menubar=no,toolbar=no,scrollbars=no");
	};
	
	/* 메세지 삭제 부분 */
	/* 체크박스 전체 선택 */
	$(document).ready(function() {
		$('.all_chk').click(function() {
			$('input[type=checkbox]').prop('checked', this.checked);
		});
	/* 메세지 삭제 */
		$('#delete').click(function() {
			$('input[type=checkbox]:checked').parent().parent().remove();
		});
	});
	
</script>
<div class="top"></div>
<div class="message_bar">
<h3><a href="<%=request.getContextPath()%>/message/receive/" class="a">&nbsp;&nbsp;&nbsp;&nbsp;받은쪽지</a>(${readCount}/${r_count}) | <a href="<%=request.getContextPath()%>/receive" class="a">보낸쪽지</a>
<button type="button" class="btn btn-default" id="delete" name="${delete}">삭제</button></h3>
</div>
<div class="middle">
<table class="table">
	<tr class="trcolor">
		<th width="10%"><input type="checkbox" class="all_chk"></th>
		<th width="20%">보낸사람</th>
		<th width="40%">내용</th>
		<th width="15%">보낸시간</th>
		<th width="15%">읽은시간</th>
	</tr>
	
	<c:if test="${ empty rList }">
	<tr>
		<td colspan="5">쪽지가 없습니다.</td>
	</tr>
	</c:if>
	
	<c:forEach items="${rList}" var="rmsg">
	<c:if test="${ empty rmsg.receive_time }" var="r">
	<tr>
		<th width="10%"><input type="checkbox" class="chk" name="chk_mid" value="${rmsg.message_id}"></th>
		<th width="20%"><a href="#" class="a" onclick="transform('${rmsg.sender_id}');">${rmsg.sender_id}</a></th>
		<th width="40%"><a href="#" class="a" onclick="winopen('${rmsg.message_id}');">새 쪽지 확인</a></th>
		<th width="15%">${ rmsg.send_time }</th>
		<th width="15%">${ empty rmsg.receive_time ? '읽지않음' : rmsg.receive_time }</th>
	</tr>
	</c:if>
	
	<c:if test="${ not r }">
	<tr>
		<td width="10%"><input type="checkbox" class="chk" name="chk_mid" value="${rmsg.message_id}"></td>
		<td width="20%"><a href="#" class="a" onclick="transform('${rmsg.sender_id}');">${rmsg.sender_id}</a></td>
		<td width="40%"><a href="#" class="a" onclick="winopen('${rmsg.message_id}');">
		<!-- 20글자 이상일 경우 ...으로 자르는 코드 -->
           <c:choose>
           <c:when test="${fn:length(rmsg.content) gt 20}">
           <c:out value="${fn:substring(rmsg.content, 0, 20)}....">
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
</table>
</div>
<div class="battom">
<nav>
  <ul class="pagination">
  
  <c:if test="${ beforePageNo ne -1 }">
    <li><a href="<%=request.getContextPath()%>/message/receive/${ beforePageNo }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    </c:if>
    
  <c:forEach var="pageNo" begin="${ startPageNo }" end="${ endPageNo }">
	<c:if test="${ curPage eq pageNo }" var="r">
    <li class="active"><a href="#">${ pageNo }</a></li>
    </c:if>
    <c:if test="${ not r }">
    <li><a href="<%=request.getContextPath()%>/message/receive/${ pageNo }">${ pageNo }</a></li>
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