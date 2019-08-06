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
	
	<!-- 2페이지 시작 -->
	
	<section class="section2" style="background-color:#f2f2f2;">
	<div class="tophegiht"></div>
	
		<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	<!--페이지-->

	<div class="carousel-inner">
		<h3>인기 후기 게시판 TOP3</h3>
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="<%=request.getContextPath()%>/resources/cityimg/" style="width:100%; height: 100%;" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 1</h1>
					<p>텍스트 1</p>
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="<%=request.getContextPath()%>/resources/cityimg/" style="width:100%;" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 2</h1>
					<p>텍스트 2</p>
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%; height: 100%;" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
					<h1>Slide 3</h1>
					<p>텍스트 3</p>
				</div>
			</div>
		</div>
		<!--슬라이드3-->
	</div>
	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>

      </section>
      
      <!-- 2페이지 끝 -->
      
      
      <!-- 3페이지 시작 -->
	      <section class="section3" style="background-color:#DAD9FF;">	      	
			<div class="img" style="background-image: url('<%=request.getContextPath()%>/resources/cityimg/IMG_3609.JPG');">
				<div class="content">
					<h3 class="animated fadeInUp delay-1s">여행자들의 정보</h3>
				</div>
				<div class="img-cover"></div>
			</div>			
		</section>
		<!-- 3페이지 끝 -->
		
		<!-- 4페이지 시작 -->
		
		<section class="section4" style="background-color:wheat;">
			<div class="img" style="background-image: url('<%=request.getContextPath()%>/resources/cityimg/IMG_E2255.JPG');">
				<div class="content">
					<h3 class="animated fadeInUp infinite delay-1s">여행자들의 정보</h3>
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