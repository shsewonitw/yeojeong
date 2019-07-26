<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <!-- CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/carousel.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.min.css">
	
	<!-- JS -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/carousel.js"></script>
	
	
	
	
	<div id="main" class="scroll-container">
	
		<section class="section1">
			<div class="box hi">
				<video preload="auto" autoplay loop="loop" muted="muted">
				<source src="<%=request.getContextPath() %>/resources/video/test123.mp4" type="video/mp4">

			</video>
		</div>
	</section>


	<section class="section2">
		<div class="tophegiht"></div>
		<div class="monthTravel">이 달의 추천 여행지</div>


	</section>


	<section class="section3">
		<div class="tophegiht"></div>
        <div class="monthTravel">이 달의 추천 여행지</div>
          <div class="carousel">
        <div class="view">
            <ul class="list">
                <li>
                   <ul>
                       <li class="a1"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/1.png"></a></li>
                       <li class="a2"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/1.png"></a></li>
                       <li class="a3"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/1.png"></a></li>
                   </ul>
                </li>
                <li>
                    <ul>
                       <li class="a4"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/2.png"></a></li>
                       <li class="a5"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/2.png"></a></li>
                       <li class="a6"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/2.png"></a></li>
                   </ul>
                </li>
                <li>
                    <ul>
                       <li class="a7"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/3.png"></a></li>
                       <li class="a8"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/3.png"></a></li>
                       <li class="a9"><a href="#"><img class="carouselImg" src="<%=request.getContextPath()%>/resources/img/3.png"></a></li>
                   </ul>
                </li>
            </ul>
        </div>
        <p class="prev">이<br>전</p>
        <p class="next">다<br>음</p>
    </div>
 
      </section>
		
		
		<section class="section3">
			<div class="tophegiht"></div>
			
		</section>
		
		
		<section class="section4">
			<div class="tophegiht"></div>
			<h2>4페이지</h2>
		</section>
		<section class="section5">
			<div class="tophegiht"></div>
			<h2>5페이지</h2>
		</section>
	</div>
	
	</section>


	<section class="section4">
		<div class="tophegiht"></div>
		<h2>4페이지</h2>
	</section>
	<section class="section5">
		<div class="tophegiht"></div>
		<h2>5페이지</h2>
	</section>
</div>



>>>>>>> origin/ss

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