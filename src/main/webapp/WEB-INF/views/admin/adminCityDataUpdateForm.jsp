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

	<jsp:include page="/WEB-INF/views/admin/prelude_admin.jsp" />

	<div style="height: 280px;"></div>
	
	
	
	

	<jsp:include page="/WEB-INF/views/admin/adminCountryDropdownMenu.jsp" />

	<div style="overflow:hidden;">
		<div style="float:left; margin:auto;">
			<form class="form-horizontal" id="updateForm" action="<%=request.getContextPath()%>/adminCityDataUpdate" method="POST" enctype="multipart/form-data">
				
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
				<span style="padding-left:20px;">현재 이미지: <a href="<%=request.getContextPath()%>/resources/cityimg/${city_data.image_src}" target="_blank">${city_data.image_src}</a></span>
					<label for="image" class="col-sm-2 control-label">썸네일</label>
					<div class="col-sm-10">
						<input type="file"  class="form-control" id="image_src" name="image_src"
							placeholder="썸네일">
						<input type="hidden" name="image_src_hidden" value="${city_data.image_src}">
					</div>
						
	


				</div>
				
				<div class="form-group">
				<span style="padding-left:20px;">현재 이미지: <a href="<%=request.getContextPath()%>/resources/cityimg/${city_data.image_src2}" target="_blank">${city_data.image_src2}</a></span>
					<label for="image2" class="col-sm-2 control-label">내부 사진</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="image_src2" name="image_src2"
							placeholder="내부사진등록">
						<input type="hidden" name="image_src2_hidden" value="${city_data.image_src2}">
					</div>
				</div>
				
				<div class="form-group">
				<span style="padding-left:20px;">현재 이미지: <a href="<%=request.getContextPath()%>/resources/cityimg/${city_data.image_src3}" target="_blank">${city_data.image_src3}</a></span>
					<label for="image3" class="col-sm-2 control-label">국기 사진</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="image_src3" name="image_src3"
							placeholder="국기사진등록">
						<input type="hidden" name="image_src3_hidden" value="${city_data.image_src3}">
					</div>
				</div>
				
						<input type="hidden" name="city_code" value="${city_data.city_code}">
				<input type="hidden" id="position" name="position">
			</form>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button onclick="document.getElementById('updateForm').submit();" class="btn btn-default">수정</button>
					</div>
					<div class="col-sm-offset-2 col-sm-10">
						<button onclick="deleteButton('${city_data.city_code}');" class="btn btn-default">삭제</button>
					</div>
				</div>
				
				

		</div>
		<!--  -->
	</div>


    <div id="map"></div>
    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();

        $("#city").on("focusout",function(){
        	geocodeAddress(geocoder, map);
        	
        })
      }

      function geocodeAddress(geocoder, resultsMap) {

		var address = $("#city").val();
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
            $("#position").val(marker.position);
          } else {
            // 위도경도 정보 못가져왔을때 
          }
        });
      }
    
      
	function deleteButton(city_code){
		alert(city_code+" - 삭제버튼!!");
	}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFPpdIjRpRNIAeRsh3PZkN_XlxtAhSpfE&callback=initMap">
    </script>

</body>
</html>

		