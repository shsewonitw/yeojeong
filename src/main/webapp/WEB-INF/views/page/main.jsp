<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/main.css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>




<div id="main" class="scroll-container">

	<section class="section1">
		<div class="box hi">
			<video preload="auto" autoplay loop="loop" muted="muted">
				<source
					src="<%=request.getContextPath()%>/resources/video/test123.mp4"
					type="video/mp4">
			</video>
		</div>
	</section>


	<section class="section2">
		<div class="tophegiht"></div>
		<div class="monthTravel">이 달의 추천 여행지</div>


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