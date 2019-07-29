<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 . 여행지데이터 업데이트</title>



<style type="text/css">
.mainDiv {
	margin: auto;
	margin-top: 20px;
	align: center;
	width: 50%;
	height: auto;
}

@import url(https://fonts.googleapis.com/css?family=Lato);

body {
	margin: 0;
}

nav {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100px;
	padding: 0 0;
	box-sizing: border-box;
}

nav::before {
	position: absolute;
	top: 5%;
	left: 0;
	width: 100%;
	color: black;
	font: 400 24px/1 'Lato', sans-serif;
	text-align: center;
}

/* common */
nav ul {
	position: relative;
	margin: 0;
	padding: 0;
	list-style: none;
}

nav ul::after {
	display: block;
	clear: both;
	content: '';
}

nav ul li {
	position: relative;
	float: left;
	border: 2px solid black;
}

nav
 
ul
 
li
:not
 
(
:first-child
 
)
{
border-left
:
 
none
;


}
nav ul li:hover {
	background-color: rgba(255, 255, 255, .3);
}

nav ul li a {
	display: inline-block;
	padding: 1em 4em;
	color: black;
	font: 400 18px/1 'Lato', sans-serif;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
}

nav ul ul {
	position: absolute;
	top: 100%;
	left: -2px;
}

nav ul ul li {
	float: none;
	margin: 0;
}

nav
 
ul
 
ul
 
li
:not
 
(
:first-child
 
)
{
border
:
 
2
px
 
solid
 
black
;

	
border-top
:
 
none
;


}
nav ul ul ul {
	position: absolute;
	top: -2px;
	left: 100%;
}

/* DEMO #5 */
.nav05 ul li {
	perspective: 300px;
}

.nav05 ul ul {
	visibility: hidden;
	opacity: 0;
	transition: .3s ease-in-out;
	transform: rotateX(-90deg) rotateY(0);
	transform-origin: 0 0;
}

.nav05 ul ul li {
	perspective: 1500px;
}

.nav05 ul ul ul {
	transform: rotateX(0) rotateY(-90deg);
}

.nav05 ul li:hover>ul {
	visibility: visible;
	opacity: 1;
	transform: rotateX(0) rotateY(0);
}
</style>




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
	
	
	
	<div class="mainDiv">

	<!-- 드롭다운 메뉴 -->
		<div style="display:inline-block;">
			<nav class="nav05">
				<ul>
					<li><a href="#" style="text-decoration: none;">리스트</a> 
						<ul>
						<li><a>도시 추가</a></li>
							<c:forEach items="${countryList }" var="country">
								<li><a href="#" style="text-decoration: none;">${country}</a>
									<ul>
										<c:forEach items="${map}" var="map">
											<c:if test="${map.key eq country}">
												<c:forEach items="${map.value }" var="city">
													<li><a
														href="<%=request.getContextPath()%>/adminCityDataUpdate"
														style="text-decoration: none;">${city}</a></li>
												</c:forEach>
											</c:if>
										</c:forEach>
									</ul></li>
							</c:forEach>
						</ul></li>
				</ul>
			</nav>
		</div>


		<div style="display:inline-block;">
			<form class="form-horizontal" action="<%=request.getContextPath()%>/adminCityDataInsert" method="POST">
				
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
					<label for="image_src" class="col-sm-2 control-label">사진</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="image_src" name="image_src"
							placeholder="사진등록" required>
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
    
      $(function(){
    	  $("#alertButton").on("click",function(){
    	    	alert(marker.position);
    	   })
      })
    
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFPpdIjRpRNIAeRsh3PZkN_XlxtAhSpfE&callback=initMap">
    </script>
    
    
    <button id="alertButton">alertButton</button>
	
	
	
</body>
</html>

		