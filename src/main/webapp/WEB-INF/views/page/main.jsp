<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css?var=2">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sky_slide.css?var=1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.min.css?var=2">
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/image.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">	
		
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
	
	
	<!-- JS -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/sky_slide.js?var=1"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jssor.slider-27.5.0.min.js"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
			
	<!-- 1페이지 시작 -->	
	<div id="main" class="scroll-container">
		<section class="section1">
			<div class="box hi">
				<video preload="auto" autoplay loop="loop" muted="muted">
				<source src="<%=request.getContextPath() %>/resources/video/test111.MP4" type="video/mp4">
			</video>
		</div>
	</section>
	<!-- 1페이지 끝 -->
	
	
       
      
      <!-- 3페이지 시작 -->
	      <section class="section3" style="background-color:#DAD9FF;">	      	
			<div class="img" style="background-image: url('<%=request.getContextPath()%>/resources/cityimg/IMG_3609.JPG');">
				<div class="content">
					<h1 class="animated fadeInUp delay-1s">여행자들의 정보</h1>
					<h1 class="animated fadeInUp delay-1s">가고싶은 여행지의 정보를 알아보세요!</h1>
				</div>
				<div class="img-cover"></div>
			</div>			
		</section>
		<!-- 3페이지 끝 -->
		
		<!-- 4페이지 시작 -->
		
		<section class="section4" style="background-color:wheat;">
			<div class="img" style="background-image: url('<%=request.getContextPath()%>/resources/cityimg/IMG_2255.JPG');">

				<div class="content" id="target1">
					<h3 class="animated fadeInUp delay-1s">If you want to go fast, go alone</h3>
					<h2 class="animated fadeInUp delay-2s">If you want to go far</h2>
					<h1 class="animated fadeInUp delay-3s" style="font-size:70px;"><b>go together.</b></h1>

				</div>
				<div class="img-cover"></div>
			</div>						
									
		</section>
				
		<!-- 4페이지 끝 -->		
	</div>	
<script type="text/javascript">	

	new fullScroll({
		displayDots : true,
		dotsPosition : 'left',
		animateTime : 0.7,
		animateFunction : 'ease'
	});

	var elem = document.getElementById("myvideo");

	function openFullscreen() {

		if (elem.requestFullscreen) {

			elem.requestFullscreen();

		} else if (elem.mozRequestFullScreen) { /* Firefox */

			elem.mozRequestFullScreen();

		} else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */

			elem.webkitRequestFullscreen();

		} else if (elem.msRequestFullscreen) { /* IE/Edge */

			elem.msRequestFullscreen();

		}

	}	
</script>