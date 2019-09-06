<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/reviewlist.css?var=11">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<!-- 컨텍스트 메뉴 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/contextmenu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/contextmenuui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/contextmenu.css">


<title>여행자들의 웃음 리스트</title>


</head>
<body>

	<div class="top"></div>
	<div class="titleDIV">여행자들의 웃음 리스트</div>
	
	<div class="formDIV">
		
	<table id="hor-minimalist-b" summary="Employee Pay Sheet">
    <thead>
    	<tr>
        	<th scope="col">#</th>
            <th scope="col">사진</th>
            <th scope="col">내용(제목)</th>
            <th scope="col">작성자</th>
            <th scope="col">국가</th>
            <th scope="col">도시</th>
            <th scope="col">평점</th>
            <th scope="col">조회수</th>
            <th scope="col">댓글수</th>
            <th scope="col">작성시간</th>
        </tr>
    </thead>
    <tbody>
     <c:forEach items="${ reviewlist }" var="r_list">
    	<tr>
        	<td>${ r_list.article_id }</td>
        	<c:if test="${ fn:length(r_list.image_src) < 15 }" var="img"> 
        		<td><img class="not_img" src="<%=request.getContextPath()%>/resources/img/notimg.png"></td>
        	</c:if>
        	<c:if test="${ !img}"> 
        		<td><img class="imgsize" src="<%=request.getContextPath()%>/resources/cityimg/${r_list.image_src}"></td>
        	</c:if>
        	<td><a href="<%=request.getContextPath()%>/datailreview?article_id=${ r_list.article_id }">
        	<!-- 10글자 이상 될 시 ...으로 자르는 코드 -->
        	<c:choose>
	        <c:when test="${fn:length(r_list.content) gt 10}">
	        <c:out value="${fn:substring(r_list.content, 0, 10)}...." escapeXml="false">
	        </c:out></c:when>
	        <c:otherwise>
	        <c:out value="${r_list.content}" escapeXml="false">
      		 </c:out></c:otherwise>
			</c:choose>
			<!--------------------------------- -->
			</a>
        	</td>
        	
        	<td><input type="button" class="namebtn" id="${r_list.member_id}_namebtn" onclick="temp('${r_list.member_id}');" value="${ r_list.name }"></td>
        	
        	<td>${ r_list.country }</td>
        	<td>${ r_list.city }</td>
        	<td>
        		<c:if test="${r_list.review_star == 1}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_1.png" >
        		</c:if>
        		<c:if test="${r_list.review_star == 2}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_2.png">
        		</c:if>
        		<c:if test="${r_list.review_star == 3}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_3.png" >
        		</c:if>
        		<c:if test="${r_list.review_star == 4}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_4.png">
        		</c:if>
        		<c:if test="${r_list.review_star == 5}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_5.png" >
        		</c:if>
        		<c:if test="${r_list.review_star == 6}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_6.png" >
        		</c:if>
        		<c:if test="${r_list.review_star == 7}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_7.png" >
        		</c:if>
        		<c:if test="${r_list.review_star == 8}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_8.png" >
        		</c:if>
        		<c:if test="${r_list.review_star == 9}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_9.png" >
        		</c:if>
        		<c:if test="${r_list.review_star == 10}">
        			<img class="imgsize1" src="<%= request.getContextPath()%>/resources/img/star_10.png" >
        		</c:if>
        	</td>
        	<td>${ r_list.read_count }</td>
        	<td>${ r_list.comment_count }</td>
        	<td>${ r_list.write_time }</td>
        </tr>
        </c:forEach>
    </tbody>
</table>

		
		<c:if test="${ login_member != null }">
		<a href="<%=request.getContextPath()%>/auth/review" class="button">글쓰기</a>
		</c:if>
		
		<span id="paging">
		<c:if test="${ beforePage ne -1 }">
				<a href="<%= request.getContextPath()%>/reviewlist/${beforePage}">이전</a>
				</c:if>
				
				<c:forEach var="pageNo" begin="${startPageNo }" end="${endPageNo }">
				  	<c:if test="${ curPage eq pageNo }" var="r">
				  		<strong>${ pageNo }</strong>
				  	</c:if>	
				  	<c:if test="${ not r }">
					<a href="<%= request.getContextPath()%>/reviewlist/${pageNo}">${pageNo}</a>
					</c:if>	
				</c:forEach>
				
				<c:if test="${ afterPage ne -1 }">
				<a href="<%= request.getContextPath()%>/reviewlist/${afterPage}">다음</a>
				</c:if>
		</span>
		
		<form action="<%= request.getContextPath() %>/reviewlist/serach" method="post">
		<span class="serch">
		<select name="searchItem">
			<option value="name" selected>작성자</option>
			<option value="country">국가</option>
			<option value="city">도시</option>
		</select>
		<input style="margin-top: 3%" type="text" name="searchValue" required> 
		
		<input type="submit" class="button" value="검색">
		</span>
		</form>
	</div>

</body>

<script type="text/javascript">

function temp(member_id){
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


</html>