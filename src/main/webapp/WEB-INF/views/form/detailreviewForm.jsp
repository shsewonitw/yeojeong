<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/datilreview.css?var=33">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>

<script type="text/javascript">

function insert_comment() {
	alert("댓글할꺼")
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
		<label></label>
			<span class="starRev">
			  <b class="starR1 on" id="s1">0.5</b>
			  <b class="starR2" id="s2">1</b>
			  <b class="starR1" id="s3">1.5</b>
			  <b class="starR2" id="s4">2</b>
			  <b class="starR1" id="s5">2.5</b>
			  <b class="starR2" id="s6">3</b>
			  <b class="starR1" id="s7">3.5</b>
			  <b class="starR2" id="s8">4</b>
			  <b class="starR1" id="s9">4.5</b>
			  <b class="starR2" id="s10">5</b>
			</span>
			별점 개발 안되서 테스트${detailreview.review_star }
			<br><br>
			<hr>
			<label>후기 내용</label><br><br>
			<textarea>${detailreview.content }</textarea>
			<hr>
			<div class="buttonmargin">
			<a href="<%=request.getContextPath()%>" class="button">수정</a>
			<a href="<%=request.getContextPath()%>" class="button">삭제</a>
			</div>
		<!-- 댓글 -->		
		<form id="comment_form" action="<%= request.getContextPath() %>/comment" method="post">
		<label>댓글</label>
		<hr>
			<textarea name="content" style="height: 20%;" placeholder="댓글을 입력하세요"></textarea>
			<div class="buttoncomment">
			<input type="button" value="등록" class="button" onclick="insert_comment();">
			</div>
		</form>
	</div>

</body>


<script type="text/javascript">


// 별점 처리 
	var s1 = $("#s1").text();
	$('.starRev b').click(function() {
		$(this).parent().children('b').removeClass('on');
		$(this).addClass('on').prevAll('b').addClass('on');
		return false;
	});
</script>

</html>