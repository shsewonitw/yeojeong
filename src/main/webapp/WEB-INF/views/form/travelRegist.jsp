<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ssw.css">
	
<!-- 달력기능 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!--  -->
<script>
$(function() {
  $( "#start_date" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
  
  $( "#end_date" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>

<style type="text/css">
th, td {
	padding-bottom: 30px;
}

</style>

<!-- 다중 셀렉트 박스 -->
<script type="text/javascript">
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

    
    $.ajax({
		url : "<%=request.getContextPath()%>/cityAjax",
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
				alert("false");
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
<!--  -->

<!-- prelude 자리 만들어주는 div  -->
<div style="height: 170px;"></div>
<script type="text/javascript">
	alert(13332);
</script>
<!-- ----------test----------------------------------------- -->
<form action="<%=request.getContextPath()%>/travelRegist" method="POST">
<table style="margin:auto; text-align:center; align:center;">
	<tr>
		<th colspan="3" style="padding-bottom:0px;">
			<h1 style="color:rgb(52,152,219); font-weight:bold; text-align:center;"><img style="width: auto; height: auto; max-width: 100px; max-height: 100px;"
				src="<%=request.getContextPath()%>/resources/images/logo.png"
				alt="logo"><b>여행지 등록</b></h1>
		</th>
	</tr>
	
	<tr>
		<th>
			<label  for="help_tel"><b>비상 연락처</b>&nbsp;&nbsp;&nbsp;</label>
		</th>
		<th colspan="2">
			<input type="text" id="help_tel" name="help_tel" class="form-control" placeholder="번호를 입력해주세요">
		</th>
	</tr>

	<tr>
		<th>
			<label  for="help_tel"><b>국가</b>&nbsp;&nbsp;&nbsp;</label>
		</th>
		<th>
			<select class="form-control" name="country" id="selOne"
				onchange="doChange(this, 'selTwo')">
				<option value="default">---국가 선택---</option>
				<c:forEach items="${countryList}" var="country">
					<option value="${country}">${country}</option>	
				</c:forEach>
			</select> 
		</th>
		<th>
			<select class="form-control" name="city" id="selTwo">
				<option value="default">---도시 선택---</option>
			</select>
		</th>
	</tr>
	
	<tr>
		<th>
			<label  for="start_date"><b>출국 날짜</b>&nbsp;&nbsp;&nbsp;</label>
		</th>
		<th colspan="2">
			<input type="text" name="start_date" class="form-control" id="start_date" placeholder="클릭하여 날짜 선택" autocomplete="off">
		</th>
	</tr>
	
	<tr>
		<th>
			<label  for="end_date"><b>입국 날짜</b>&nbsp;&nbsp;&nbsp;</label>
		</th>
		<th colspan="2">
			<input type="text" name="end_date" class="form-control" id="end_date" placeholder="클릭하여 날짜 선택" autocomplete="off">
		</th>
	</tr>
	
	<tr>
		<th colspan="3" style="text-align:center;">
			<button type="submit" class="btn btn-default" >등록</button>
		</th>
	</tr>
</table>
</form>



<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-ui.js"></script>
