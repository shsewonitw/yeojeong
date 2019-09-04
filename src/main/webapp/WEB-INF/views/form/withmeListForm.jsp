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
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/contextmenu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/contextmenuui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/contextmenu.css">

<script type="text/javascript">
// 게시글 삭제 이벤트
$(document).ready(function() {
	$('.btn-default').click(function() {
		var result = confirm("삭제된 게시글은 복구하실 수 없습니다.\n정말 삭제하시겠습니까?");
		if ( result ) {
			location.href='<%=request.getContextPath()%>/withmelist/delete';
		} else {
			return false;
		}
	});
});

// 아이디 클릭 이벤트
function temp(member_id) {
	$.contextMenu({
	    selector: "#"+member_id+"_namebtn",
	    trigger: 'left',
	    callback: function(key, options) {
	    	var m = key;
	        if(m == "edit"){
	        	window.open('<%= request.getContextPath()%>/message/transform/'+member_id,'message','width=740,height=620',true);
	        }
	    },
	    items: {
	        "edit": {name: "쪽지보내기"},
	        "cut": {name: "1:1채팅(미구현)"},
	        "copy": {name: "쓴글 확인(미구현)"},
	    }
	});
}
</script>

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
.namebtn {
	cursor:pointer;
	border: 0;
	outline: 0;
	background-color: white;
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
		<th width="10%">작성자</th>
		<th width="8%">작성일</th>
		<th width="5%">상태</th>
		<th width="7%">관리</th>
	</tr>
	<form action="<%=request.getContextPath()%>/withmelist" method="post">
	<c:if test="${ empty withmelist }">
	<tr>
		<td colspan="11">게시글이 없습니다.</td>
	</tr>
	</c:if>
	<c:forEach items="${withmelist}" var="wlist">
	<tr>
		<td><input type="hidden"></td>
		<td width="15%">${wlist.country} ${wlist.city}</td>
		<td width="15%">${wlist.start_date}</td>
		<td width="15%">${wlist.end_date}</td>
		<!-- 카테고리 성별 -->
		<c:if test="${wlist.category_gender eq 0 }"><td width="5%">무관</td></c:if>
		<c:if test="${wlist.category_gender eq 1 }"><td width="5%">여성</td></c:if>
		<c:if test="${wlist.category_gender eq 2 }"><td width="5%">남성</td></c:if>
		<!-- 카테고리 연령대 -->
		<c:if test="${wlist.category_age eq 0 }"><td width="5%">무관</td></c:if>
		<c:if test="${wlist.category_age eq 1 }"><td width="5%">20대</td></c:if>
		<c:if test="${wlist.category_age eq 2 }"><td width="5%">30대</td></c:if>
		<c:if test="${wlist.category_age eq 3 }"><td width="5%">40대이상</td></c:if>
		<!-- 카테고리 여행스타일 -->
		<c:if test="${wlist.category_style eq 0 }"><td width="5%">무관</td></c:if>
		<c:if test="${wlist.category_style eq 1 }"><td width="5%">관광</td></c:if>
		<c:if test="${wlist.category_style eq 2 }"><td width="5%">맛집</td></c:if>
		<c:if test="${wlist.category_style eq 3 }"><td width="5%">쇼핑</td></c:if>
		<c:if test="${wlist.category_style eq 4 }"><td width="5%">휴양</td></c:if>
		<c:if test="${wlist.category_style eq 5 }"><td width="5%">엑티비티</td></c:if>
		<td width="10%"><input type="button" class="namebtn" id="${wlist.member_id}_namebtn" onclick="temp('${wlist.member_id}');" value="${wlist.name}"></td>
		<td width="8%">${wlist.write_time}</td>
		<td width="5%">상태</td>
		<c:if test="${login_member.member_id eq wlist.member_id}" var="r">
		<td width="7%"><button type="submit" class="btn btn-default" name="article_id">삭제</button></td>
		</c:if>
		<c:if test="${not r}">
		<td width="7%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</c:if>
	</tr>
	</c:forEach>
	</form>
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