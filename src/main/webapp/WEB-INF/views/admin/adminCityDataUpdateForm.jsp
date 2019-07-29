<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 . 여행지데이터 업데이트</title>



<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

</head>
<body>
	<script type="text/javascript">
		
	</script>
	<jsp:include page="/WEB-INF/views/admin/prelude_admin.jsp" />

	<div style="height: 280px;"></div>
	
	
	
	

	<jsp:include page="/WEB-INF/views/admin/adminCountryDropdownMenu.jsp" />

	<div style="overflow:hidden;">
		<div style="float:left;">
			<form class="form-horizontal" action="<%=request.getContextPath()%>/adminCityDataInsert" method="POST" enctype="multipart/form-data">
				
				<div class="form-group">
					<label for="country" class="col-sm-2 control-label">국가</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="country" name="country"
							placeholder="국가를 입력해주세요" value="${city_data.country}" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="city" class="col-sm-2 control-label">도시</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="city" name="city"
							placeholder="도시를 입력해주세요" value="${city_data.city}" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="local_time" class="col-sm-2 control-label">시차</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="local_time" name="local_time"
							placeholder="시차를 입력해주세요" value="${city_data.local_time}" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="flight_time" class="col-sm-2 control-label">비행시간</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="flight_time" name="flight_time"
							placeholder="비행시간을 입력해주세요" value="${city_data.flight_time}" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="local_voltage" class="col-sm-2 control-label">사용전압</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="local_voltage" name="local_voltage"
							placeholder="사용전압을 입력해주세요" value="${city_data.local_voltage}" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="visa" class="col-sm-2 control-label">비자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="visa" name="visa"
							placeholder="비자정보를 입력해주세요" value="${city_data.visa}" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="danger_level" class="col-sm-2 control-label">위험지역 레벨</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="danger_level" name="danger_level"
							placeholder="위험지역 레벨을 입력해주세요" value="${city_data.danger_level}" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="image_src" class="col-sm-2 control-label">썸네일</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="image_src" name="image_src"
							placeholder="썸네일" value="${city_data.image_src}" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="image_src" class="col-sm-2 control-label">내부 사진</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="image_src2" name="image_src2"
							placeholder="내부사진등록" value="${city_data.image_src2}" required>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">등록</button>
					</div>
				</div>
				
				
				<input type="hidden" id="position" name="position">
			</form>
		</div>
		<!--  -->
	</div>


</body>
</html>

		