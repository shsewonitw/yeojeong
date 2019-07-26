<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/datilreview.css?var=1">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">

	
</script>

<title>웃음들의 후기</title>


</head>
<body>

	<div class="top"></div>
	<div class="titleDIV"> 님의 여행 후기</div>
	
	<div class="formDIV">
		
		<form action="#">
			<hr>
				<label>글번호</label>&nbsp;&nbsp;&nbsp;<input class="input" type="text" name="article_id"> &nbsp;&nbsp;&nbsp;
				<label>작성자</label>&nbsp;&nbsp;&nbsp;<input class="input" type="text" name="name"> &nbsp;&nbsp;&nbsp;
				<label>작성시간</label> &nbsp;&nbsp;&nbsp;<input class="input" type="text" name="write_time"> &nbsp;&nbsp;&nbsp;
				<label>조회수</label> &nbsp;&nbsp;&nbsp;<input class="input" type="text" name="read_count"> &nbsp;&nbsp;&nbsp;
				<label>댓글수</label> &nbsp;&nbsp;&nbsp;<input class="input" type="text" name="comment_count"> 
				
				<hr>
				<label>여행지</label> &nbsp;&nbsp;&nbsp;
				<input class="input" type="text" name="country"> 
				<input class="input" type="text" name="city"> 
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
			<br><br>
			<hr>
			<label>후기 내용</label><br><br>
			<textarea name="content"></textarea>
			<hr>
			
			별점 개발 안되서 테스트<input type="text" name="review_star">
			<hr>
			<input type="submit" value="글 작성">
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