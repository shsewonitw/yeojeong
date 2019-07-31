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

$(function(){
	$(".list-group-item").hover(function(){
		var s =$(this).css("background-color");
		$(this).css("color", "black").css("background-color", "#dcdcdc");
		if(s=="rgb(52, 152, 219)"){
				 $(this).css("background-color","rgb(52, 152, 219)").css("color", "white");
		}
	},function(){
		var s =$(this).css("background-color");
		$(this).css("color", "black").css("background-color", "white");
		 if(s=="rgb(52, 152, 219)"){
			 $(this).css("background-color","rgb(52, 152, 219)").css("color", "white");
		}
	});
})

function member_click(member_id){
	var select_div = '#div_'+member_id;
	$(".div_member_all").css("display","none");
	$(select_div).css("display","block");
	var select_a = '#a_'+member_id;
	$('.list-group-item').css("background-color","white");
	$('.list-group-item').css("color","black");
	$(select_a).css("background-color","rgb(52, 152, 219)");
	$(select_a).css("color","rgb(255, 255, 255)");
}

</script>
<jsp:include page="/WEB-INF/views/admin/prelude_admin.jsp"/>

<div style="height:200px;"></div>

<div style="width:80%; margin:auto;">

	<div class="list-group" style="width:40%; margin:auto; text-align:center;">
		<c:forEach items="${member_list}" var="member">
			<a href="javascript:void(0);" onclick="member_click('${member.member_id}');" class="list-group-item" id="a_${member.member_id}">${member.member_id} (${member.name})</a>
		</c:forEach>
	</div>
	
	<nav style="margin:auto; text-align:center;">
	  <ul class="pagination">
	    
	      <c:if test="${beforePageNo ne -1}">
		      <li><a href="<%=request.getContextPath()%>/adminMemberManage/${beforePageNo}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a></li>
	      </c:if>
	    
	    
	    
		<c:forEach var="pageNo" begin="${startPageNo}" end="${endPageNo}">
			<c:if test="${ curPage eq pageNo }" var="r">
				<li><a href="#" style="background-color:rgb(52, 152, 219);color:white;">${pageNo }</a></li>
			</c:if>
			<c:if test="${not r }">
				<li><a href="<%=request.getContextPath()%>/adminMemberManage/${pageNo}">${pageNo}</a></li>
			</c:if>
		</c:forEach>	    
	    
	    
	      <c:if test="${afterPageNo ne -1}">
	      <li><a href="<%=request.getContextPath()%>/adminMemberManage/${afterPageNo}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a> </li>
	      </c:if>
	   
	  </ul>
	</nav>
	
	<c:forEach items="${member_list}" var="member">
		<div id="div_${member.member_id}" class="div_member_all">
			<h1>${member.member_id}</h1>
		</div>
	</c:forEach>
</div>



</body>
</html>