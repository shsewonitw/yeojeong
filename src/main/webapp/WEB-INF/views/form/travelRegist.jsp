<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

    if(val == '한국'){
        addOption('전주', targetE);
        addOption('대구', targetE);
        addOption('제주', targetE);
    }
    else if(val == '중국'){
        addOption('북경', targetE);
        addOption('상해', targetE);
        addOption('장가계', targetE);
    }
    else if(val == '미국'){
        addOption('워싱턴', targetE);
        addOption('로스엔젤레스', targetE);
        addOption('하와이', targetE);
    }
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
				<option value="한국">한국</option>
				<option value="중국">중국</option>
				<option value="미국">미국</option>
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
<!--
<div align="center" class="centerDiv">
	<h1 style="color:rgb(52,152,219); font-weight:bold;">여행지 등록</h1>

	<form class="form-horizontal" action="<%=request.getContextPath()%>/travelRegist" method="POST">
		<div class="form-group">
			<label  for="inputEmail3" class="col-sm-2 control-label">비상 연락처</label>
			<div class="col-sm-4">
				<input type="text" name="help_tel" class="form-control" placeholder="번호를 입력해주세요">
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">국가</label>
			<div class="col-sm-4">

				<div class="col-sm-6">
				<select class="form-control" name="country" id="selOne"
					onchange="doChange(this, 'selTwo')">
					<option value="default">---국가 선택---</option>
					<option value="한국">한국</option>
					<option value="중국">중국</option>
					<option value="미국">미국</option>
				</select> 
				<select class="form-control" name="city" id="selTwo">
					<option value="default">---도시 선택---</option>
				</select>
				</div>
				
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">출국 날짜</label>
			<div class="col-sm-4">
				<input type="text" name="start_date" class="form-control" id="start_date" placeholder="클릭하여 날짜 선택" autocomplete="off">
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">입국 날짜</label>
			<div class="col-sm-4">
				<input type="text"  name="end_date" class="form-control" id="end_date" placeholder="클릭하여 날짜 선택" autocomplete="off">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" >등록</button>
			</div>
		</div>
	</form>
</div>

-->





<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-ui.js"></script>
