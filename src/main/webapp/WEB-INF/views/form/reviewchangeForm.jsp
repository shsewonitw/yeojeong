<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/review.css?var=2">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
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

<title>여행자들의 웃음 수정</title>


</head>
<body>

	<div class="top"></div>
	<div class="titleDIV">여행자들의 웃음(수정)</div>
	
	<div class="formDIV">
		
		<form action="<%=request.getContextPath()%>/reviewchange" method="post" onSubmit="return validate();">
			<hr>
			<p class="name">
				<label>작성자</label>&nbsp;&nbsp;&nbsp;<input class="input" type="text" name="member_id" readonly> 
			</p>
			<hr>
				<label>여행지</label> &nbsp;&nbsp;&nbsp;
				 <select id="b_class" name="country" class="selectbox">
					<option value="">국가</option>
					<option value="대한민국">대한민국</option>
					<option value="베트남">베트남</option>
					<option value="태국">태국</option>
				</select>
				<select id="s_class" name="city" class="selectbox">
					<option value="">도시</option>
				</select>
		
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

window.onload = function() {
	document.getElementById("b_class").onchange = function() { getClass(this.form.b_class.options.selectedIndex) };
}

var classG = new Array(new Array("국가를 선택해주세요"), new Array("서울", "부산", "대구"),
										 new Array("다낭", "호치민", "나트랑"), 
										 new Array("방콕", "푸켓"));

var temp, i=0, j=0;
var cselect;

function getClass(item) {
temp = document.getElementById("s_class");
subCnt = temp.options.length;
	for (i=(subCnt-1); i>0; i--) { temp.options[i] = null }
		for (var j=0; j<classG[item].length; j++) {
			cselect = classG[item][j];
			temp.options[j] = new Option(cselect, cselect)
		}
}

// 별점 처리 
	var s1 = $("#s1").text();
	$('.starRev b').click(function() {
		$(this).parent().children('b').removeClass('on');
		$(this).addClass('on').prevAll('b').addClass('on');
		return false;
	});
</script>

</html>