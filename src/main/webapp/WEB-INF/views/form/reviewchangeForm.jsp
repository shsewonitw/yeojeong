<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/reviewchange.css?var=2">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
<script type="text/javascript">
<!-- 다중 셀렉트박스 -->
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

    
    $.ajax({
		url : "<%=request.getContextPath()%>/reviewcityAjax",
		type : "post",
		data : "country=" + val,
		dataType : "text",
		success : function(data) {
			if (eval(data)) {
				var str = data.substr(2,data.length-4);
				var str = str.split('","');
				str.forEach(function(element){
					addOption(element, targetE);
				})
			} else {
				alert("등록에 실패했습니다.");
			}
		},
		error : function(data) {
			alert("통신오류(관리자에게 문의하세요.)");
		}
	});
}	

function addOption(value, e){
    var o = new Option(value);
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}
</script>

<title>여행자들의 웃음 수정</title>


</head>
<body>

	<div class="top"></div>
	<div class="titleDIV">여행자들의 웃음 수정</div>
	
	<div class="formDIV">
		
		<form action="<%=request.getContextPath()%>/reviewchange" method="post" enctype="multipart/form-data">
			<hr>
			<input type="hidden" name="article_id" value="${ articleNo.article_id }">
			<p class="name">
				<label>작성자</label>&nbsp;&nbsp;&nbsp;${login_member.name }
			</p>
			<hr>
				<label>여행지</label> &nbsp;&nbsp;&nbsp;
				 <select name="country" id="selOne" class="selectbox" onchange="doChange(this, 'selTwo')">
				 <option value="">국가</option>
					<c:forEach items="${countryList }" var ="country" >
					<option value="${country}">${country }</option>
				</c:forEach>
				</select>

				<select id="selTwo" name="city" class="selectbox">
					<option value="default">도시</option>
				</select>
		
		<hr>
		<label>평점</label>
			<span class="star-input">
		  <span class="input">
		    <input type="radio" name="review_star" id="p1" value="1"><label for="p1">1</label>
		    <input type="radio" name="review_star" id="p2" value="2"><label for="p2">2</label>
		    <input type="radio" name="review_star" id="p3" value="3"><label for="p3">3</label>
		    <input type="radio" name="review_star" id="p4" value="4"><label for="p4">4</label>
		    <input type="radio" name="review_star" id="p5" value="5"><label for="p5">5</label>
		    <input type="radio" name="review_star" id="p6" value="6"><label for="p6">6</label>
		    <input type="radio" name="review_star" id="p7" value="7"><label for="p7">7</label>
		    <input type="radio" name="review_star" id="p8" value="8"><label for="p8">8</label>
		    <input type="radio" name="review_star" id="p9" value="9"><label for="p9">9</label>
		    <input type="radio" name="review_star" id="p10" value="10"><label for="p10">10</label>
		  </span>
		  <output for="star-input"><b>0</b>점</output>
		</span>
			<br><br>
			<hr>
			<label>후기 내용</label><br><br>
			<textarea name="content">${detail.content }</textarea>
			<hr>
			이미지 업로드 : <input type="file" name="image_src">
			<hr>
			
			<input type="submit" value="글 작성" class="submitmagin">
			
		</form>
	</div>

</body>


<script type="text/javascript">



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