<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸쪽지 : 여정 쪽지</title>
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
br {
	display:none;
}
</style>

</head>
<body>
<form action="<%=request.getContextPath()%>/message/send">
<script type="text/javascript">
	// 페이지 새로고침
	$(document).ready(function() {
		$('a').click(function() {
			setTimeout("history.go(0);",1000)
		});
	});
	// 메세지 송신 부분 
	function winopen(num) {
		window.open("<%=request.getContextPath()%>/message/sendcontent/"+num,"sendcontentOpen",
			"width=740,height=620,left=150,top=150,resizable=no,location=no,menubar=no,toolbar=no,scrollbars=no");
	};
	
	// 메세지 답장(아이디 클릭) 부분 
	function transform(receiver) {
		window.open("<%=request.getContextPath()%>/message/transform/"+receiver,"sendcontentOpen",
			"width=740,height=620,left=150,top=150,resizable=no,location=no,menubar=no,toolbar=no,scrollbars=no");
	};
	
	// 메세지 삭제 부분 
	// 체크박스 전체 선택 
	$(document).ready(function() {
		$('#chk_all').click(function() {
			var chk = $('#chk_all').prop('checked');
			if(chk) {
				$('.chk_row').prop('checked', true);
			} else {
				$('.chk_row').prop('checked', false);
			}
		});
	// 메세지 삭제 
	/*
		$('#delete').click(function() {
			$('input[type=checkbox]:checked').parent().parent().remove();
		});
	*/
	});
	
	function deleteMessage() {
		var chkVals = [];
		$('input[type=checkbox]:checked').each(function(i) {
			chkVals.push($(this).val());
		});
		
		$.ajax({
			url : "chk_row",
			type : "POST",
			dataType: "text",
			data : {valueArr:chkVals},
			error: function() {
				alert("service not found");
			},
			success : function(data) {
				
			}
		});
	}
</script>
<div class="top"></div>
<div class="message_bar">
<h3><a href="<%=request.getContextPath()%>/message/receive/" class="a">&nbsp;&nbsp;&nbsp;&nbsp;받은쪽지</a> | <a href="<%=request.getContextPath()%>/message/send/" class="a">보낸쪽지</a>(${s_count})
<input class="btn btn-default" type="submit" id="delete" name="delete" value="삭제"></h3>
</div>
<div class="middle">
<table class="table">
	<tr class="trcolor">
		<th width="10%"><input type="checkbox" class="chk_all"></th>
		<th width="20%">받는사람</th>
		<th width="40%">내용</th>
		<th width="15%">보낸시간</th>
		<th width="15%">읽은시간</th>
	</tr>
	
	<c:if test="${ empty sList }">
	<tr>
		<td colspan="5">쪽지가 없습니다.</td>
	</tr>
	</c:if>
	 
	<c:forEach items="${sList}" var="smsg">
	<c:if test="${ empty smsg.receive_time }" var="s">
	<tr>
		<td width="10%"><input type="checkbox" class="chk" name="chk_row" value="${smsg.message_id}"></td>
		<td width="20%"><a href="#" class="a" onclick="transform('${smsg.receiver_id}');">${smsg.receiver_id}</a></td>
		<td style="text-align:left" width="40%"><a href="" class="a" onclick="winopen('${smsg.message_id}');">
		<!-- ...으로 자르는 코드 -->
           <c:choose>
           <c:when test="${fn:length(smsg.content) gt 200}">
           <c:out value="${fn:substring(smsg.content, 0, 200)}...." escapeXml="false">
		</c:out></c:when>
		<c:otherwise>
           <c:out value="${smsg.content}" escapeXml="false">
             </c:out></c:otherwise>
         </c:choose>
         <!----------------------------------->
         </a></td>
		<td width="15%">${ smsg.send_time }</td>
		<th width="15%">${ empty smsg.receive_time ? '읽지않음' : smsg.receive_time }</th>
	</tr>
	</c:if>
	
	<c:if test="${ not s }">
	<tr>
		<td width="10%"><input type="checkbox" class="chk" name="chk_row" value="${smsg.message_id}"></td>
		<td width="20%"><a href="#" class="a" onclick="transform('${smsg.receiver_id}');">${smsg.receiver_id}</a></td>
		<td style="text-align:left" width="40%"><a href="" class="a" onclick="winopen('${smsg.message_id}');">
		<!-- ...으로 자르는 코드 -->
           <c:choose>
           <c:when test="${fn:length(smsg.content) gt 200}">
           <c:out value="${fn:substring(smsg.content, 0, 200)}...." escapeXml="false">
		</c:out></c:when>
		<c:otherwise>
           <c:out value="${smsg.content}" escapeXml="false">
             </c:out></c:otherwise>
         </c:choose>
         <!----------------------------------->
         </a></td>
		<td width="15%">${ smsg.send_time }</td>
		<td width="15%">${ smsg.receive_time }</td>
	</tr>
	</c:if>
	</c:forEach>
</table>
</div>
<div class="battom">
<nav>
  <ul class="pagination">
  
  <c:if test="${ beforePageNo ne -1 }">
    <li><a href="<%=request.getContextPath()%>/message/send/${ beforePageNo }" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
    </c:if>
    
  <c:forEach var="pageNo" begin="${ startPageNo }" end="${ endPageNo }">
	<c:if test="${ curPage eq pageNo }" var="r">
    <li class="active"><a href="#">${ pageNo }</a></li>
    </c:if>
    <c:if test="${ not r }">
    <li><a href="<%=request.getContextPath()%>/message/send/${ pageNo }">${ pageNo }</a></li>
    </c:if>
  </c:forEach>
  
  <c:if test="${ afterPageNo ne -1 }">
    <li><a href="<%=request.getContextPath()%>/message/send/${ afterPageNo }" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	</c:if>
	
   </ul>
</nav>
</div>
</form>
</body>
</html>