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
							placeholder="국가를 입력해주세요" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="city" class="col-sm-2 control-label">도시</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="city" name="city"
							placeholder="도시를 입력해주세요" required>
						<span id="positionInfo">　</span>
					</div>
				</div>
				
				<div class="form-group">
					<label for="local_time" class="col-sm-2 control-label">시차</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="local_time" name="local_time"
							placeholder="시차를 입력해주세요" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="flight_time" class="col-sm-2 control-label">비행시간</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="flight_time" name="flight_time"
							placeholder="비행시간을 입력해주세요" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="local_voltage" class="col-sm-2 control-label">사용전압</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="local_voltage" name="local_voltage"
							placeholder="사용전압을 입력해주세요" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="visa" class="col-sm-2 control-label">비자</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="visa" name="visa"
							placeholder="비자정보를 입력해주세요" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="danger_level" class="col-sm-2 control-label">위험지역 레벨</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="danger_level" name="danger_level"
							placeholder="위험지역 레벨을 입력해주세요" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="image_src" class="col-sm-2 control-label">썸네일</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="image_src" name="image_src"
							placeholder="썸네일" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="image_src2" class="col-sm-2 control-label">내부 사진</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="image_src2" name="image_src2"
							placeholder="내부사진등록" required>
					</div>
				</div>
				
			
				
				<div class="form-group">
					<label for="image_src3" class="col-sm-2 control-label">국기 사진</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="image_src3" name="image_src3"
							placeholder="국기사진등록" required>
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
	</div>
		<!--  -->
	

    <div id="map"></div>
    <script>
      function initMap() {
    	var flag = true;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();

        $("#city").on("focusout",function(){
        	var data = "city="+$("#city").val();
        	// 도시명 중복 검사
        	$.ajax({
        		url : "<%=request.getContextPath()%>/adminCityDupleCheck",
        		type : "get",
        		data : data,
        		dataType : "text",
        		async:false,
        		success : function(data) {
        			if (eval(data)) {
        				flag = true;
        			} else {
        				$("#positionInfo").html("<font color='red'>이미 등록된 도시입니다.</font>");
        				flag = false;
        			}
        		},
        		error : function(data) {
        			alert("통신오류(관리자에게 문의하세요.)");
        		}
        	});
			if(!flag){
				return;
			}        	
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
            $("#positionInfo").html("<font color='green'>"+marker.position+"</font>");
          } else {
            // 위도경도 정보 못가져왔을때 
        	  $("#positionInfo").html("<font color='red'>도시명을 확인해주세요</font>");
          }
        });
      }
    
    


	</script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFPpdIjRpRNIAeRsh3PZkN_XlxtAhSpfE&callback=initMap">
    </script>
    
    
	
	
	
</body>
</html>

		