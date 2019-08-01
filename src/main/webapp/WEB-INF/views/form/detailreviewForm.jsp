<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/datilreview.css?var=33">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<script type="text/javascript">

// 댓글 등록 
function insert_comment() {
	var comment_data = $("#comment_form").serialize();
	
	$.ajax({
		url:'<%=request.getContextPath()%>/commentinsert',
		type:"post",		
		contentType: 
			"application/x-www-form-urlencoded; charset=utf-8",
		data: comment_data,
		dataType:"json",
		success:function(result){			
			if( eval(result.result) )  {
				var commentTag = "<b id='comment_" + result.comment_id + "''></b>";
				commentTag += "<b>";
				commentTag += result.member_id;
				commentTag += "</b>";
				commentTag += "&nbsp";
				commentTag += "&nbsp";
				commentTag += "&nbsp";
				commentTag += result.write_time + "<br>";
				commentTag += result.content;
				commentTag += "<button class='btn-red' onclick='delete_comment(" + result.comment_id + ");'>삭제</button>";
				commentTag += "<hr>";
				$("#comment_div").append(commentTag);
			} else {
				alert('댓글 작성에서 문제 발생1');	
			}
			
		},
		error: function(result) {
			alert('댓글 작성에서 문제 발생2');					
		}
	});
}

var comment_count = ${commentSize};
function delete_comment(comment_id) {
	$.ajax({
		url:'<%=request.getContextPath()%>/commentdelete',
		type:"post",
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		data:"comment_id=" + comment_id,
		dataType:"text",
		success:function(result){			
			if( eval(result) ) {						
				var selector = "#comment_" + comment_id;
				$(selector).remove();
				alert("삭제 되었습니다")
				comment_count -= 1;
				$("#comment_count").text("댓글("+ comment_count+")");
				
				if( comment_count == 0 ) {
					$("#comment_table").remove();
					$("#comment_area").append("<h4>댓글이 존재하지 않습니다.</h4>");
				}
			} else {
				alert('댓글 삭제과정에서 문제 발생1');		
			}
				
		},
		error:function(result){
			alert('댓글 삭제과정에서 문제 발생2');	
		}
	});
}

	
</script>

<title>웃음들의 후기</title>


</head>
<body>

	<div class="top"></div>
	<div class="titleDIV"> ${detailreview.name}님의 여행 후기</div>
	
	<div class="formDIV">
		
			<hr>
				<label>글번호</label>&nbsp;&nbsp;&nbsp;${detailreview.article_id } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>작성자</label>&nbsp;&nbsp;&nbsp;${detailreview.name } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>작성시간</label> &nbsp;&nbsp;&nbsp;${detailreview.write_time } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>조회수</label> &nbsp;&nbsp;&nbsp;${detailreview.read_count }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>댓글수</label> &nbsp;&nbsp;&nbsp;${detailreview.comment_count }
				
				<hr>
				<label>여행지</label> &nbsp;&nbsp;&nbsp;
				${detailreview.country } / 
				${detailreview.city } 
		<hr>
		<label>평점</label>
		
			<span class="star-input">
		  	<span class="input">
		  	 <input type="radio" name="review_star" id="p1" value="${detailreview.review_star }" readonly><label for="p1">${detailreview.review_star }</label>
		  	</span>
		  	<output for="star-input"><b>${detailreview.review_star }</b>점</output>
			</span>
			<br><br>
			<hr>
			<label>후기 내용</label><br><br>
			<textarea readonly>${detailreview.content }</textarea>
			
			<div class="buttonmargin">
			<c:if test="${ login_member.member_id eq detailreview.member_id}">
			<a href="<%=request.getContextPath()%>/reviewchange" class="button">수정</a>
			<a href="<%=request.getContextPath()%>/reviewdelete" class="button">삭제</a>
			</c:if>
			</div>
			<hr>
			<br>
		<!-- 댓글 삭제 -->
		<div id="comment_area">
		<label><span id="comment_count">댓글(${commentSize})</span></label><br>
		<div id="comment_table">
		<c:forEach items="${ commentList }" var="comment">
		<div id="comment_${comment.comment_id}">
			<b>${ comment.member_id }</b>&nbsp;&nbsp;&nbsp;${ comment.write_time }<br>
			${ comment.content }
			
			<c:if test="${ login_member.member_id eq detailreview.member_id}">
			<button class="btn-red" onclick="delete_comment(${comment.comment_id});">삭제</button>
			</c:if>
		<br>
		<hr>
		</div>
		</c:forEach>
		</div>
		</div>
		
		<!-- 댓글 입력 -->
	<form id="comment_form" action="<%= request.getContextPath() %>/commentinsert" method="post">
		<input type="hidden" name="article_id" value="${ detailreview.article_id }">
		<div id="comment_div"></div>
			<input type="hidden" name="member_id" value="${ login_member.name }">
			<textarea id="testest" name="content" style="height: 20%;" placeholder="${ login_member != null ? '댓글을 입력하세요' : '로그인 해야 작성할 수 있습니다'}"
			${ login_member != null ? '' : 'readonly'  }></textarea>
			<div class="buttoncomment">
			<input type="button" value="등록" class="button" onclick="insert_comment();">
			</div>
		</form>
	
</div>
</body>

<script type="text/javascript">
//별점 처리 
var starRating = function(){
var $star = $(".star-input"),
  $result = $star.find("output>b");
$(document)
.on("focusin", ".star-input>.input", function(){
$(this).addClass("focus");
})
.on("focusout", ".star-input>.input", function(){
var $this = $(this);
setTimeout(function(){
  if($this.find(":focus").length === 0){
    $this.removeClass("focus");
  }
}, 100);
})
.on("change", ".star-input :radio", function(){
$result.text($(this).next().text());
})
.on("mouseover", ".star-input label", function(){
$result.text($(this).text());
})
.on("mouseleave", ".star-input>.input", function(){
var $checked = $star.find(":checked");
if($checked.length === 0){
  $result.text("0");
} else {
  $result.text($checked.next().text());
}
});
};
starRating();
</script>

</html>