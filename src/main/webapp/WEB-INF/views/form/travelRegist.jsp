<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=1231">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/ssw.css">
	
<!-- 달력기능 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!--  -->
<script>
$(function() {
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
  
  $( "#datepicker2" ).datepicker({
    dateFormat: 'yy-mm-dd'
  });
});
</script>

<!-- prelude 자리 만들어주는 div  -->
<div style="height: 170px;"></div>
<script type="text/javascript">
	alert(12);
</script>

<div align="center" class="centerDiv">
	<h1 style="color:rgb(52,152,219); font-weight:bold;">여행지 등록</h1>

	<form class="form-horizontal">
		<div align="center" class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">비상 연락처</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="번호를 입력해주세요">
			</div>
		</div>
	
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">국가</label>
			<div class="col-sm-4">

				<!--  -->
				<select class="form-control" name="country">
					<option class="form-control" value="한국">한국</option>
					<option class="form-control" value="중국">중국</option>
					<option class="form-control" value="미국">미국</option>
				</select>
				<!--  -->
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">출국 날짜</label>
			<div class="col-sm-4">
				<input type="text"  class="form-control" id="datepicker1" placeholder="클릭하여 날짜 선택">
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">입국 날짜</label>
			<div class="col-sm-4">
				<input type="text"  class="form-control" id="datepicker2" placeholder="클릭하여 날짜 선택">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" >등록</button>
			</div>
		</div>
	</form>
</div>



<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-ui.js"></script>
