<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/review.css?var=11">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.selectlist.css?var=12">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.selectlist.js"></script>

<script type="text/javascript">

function validate(){
	var extensions = new Array("jpg","jpeg","gif","png","bmp");  //이곳에 업로드 가능한 확장자 기재
	var image_file = document.form.image_file.value;
	var image_length = document.form.image_file.value.length;
	var pos = image_file.lastIndexOf('.') + 1;
	var ext = image_file.substring(pos, image_length);
	var final_ext = ext.toLowerCase();
	for (i = 0; i < extensions.length; i++){
		if(extensions[i] == final_ext){
		return true;
		}
	}
		alert(extensions.join(', ') +"파일만 등록 가능합니다.");
	return false;
	}
	
	
</script>

<title>여행자들의 웃음</title>


</head>
<body>

	<div class="top"></div>
	<div class="titleDIV">여행자들의 웃음</div>
	
	<div class="formDIV">
		
		<form action="<%=request.getContextPath()%>/review" method="post" onSubmit="return validate();">
			<hr>
			<p class="name">
				<label>작성자</label>&nbsp;&nbsp;&nbsp;<input class="input" type="text" name="member_id"> 
			</p>
			<hr>
				<label>여행지</label> &nbsp;&nbsp;&nbsp;
				 <input class="input" type="text" name="country"> 
				 <input class="input" type="text" name="city"> 
		
		<hr>
		<label>평점</label>
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
			이미지 업로드 : <input type="file" name="image_src">
			별점 개발 안되서 테스트<input type="text" name="review_star">
			<hr>
			<input type="submit" value="글 작성" class="submitmagin">
		</form>
	</div>

</body>


<script type="text/javascript">
$(function(){
	$('select').selectlist({
		zIndex: 10,
		width: 200,
		height: 30
	});		
})



	// 별점 처리 
	var s1 = $("#s1").text();
	$('.starRev b').click(function() {
		$(this).parent().children('b').removeClass('on');
		$(this).addClass('on').prevAll('b').addClass('on');
		return false;
	});
</script>

</html>