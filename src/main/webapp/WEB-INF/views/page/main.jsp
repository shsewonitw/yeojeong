<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css?var=2">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/sky_slide.css?var=1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/full-page-scroll.min.css?var=2">
	
	<!-- JS -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/sky_slide.js?var=1"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jssor.slider-27.5.0.min.js"></script>
	
	
	
	<!-- 1페이지 시작 -->
	<div id="main" class="scroll-container">
		<section class="section1">
			<div class="box hi">
				<video preload="auto" autoplay loop="loop" muted="muted">
				<source src="<%=request.getContextPath() %>/resources/video/test123.mp4" type="video/mp4">
			</video>
		</div>
	</section>
	<!-- 1페이지 끝 -->
	
	<!-- 2페이지 시작 -->
	<section class="section2" style="background-color:#f2f2f2;">
		<div class="tophegiht"></div>
		<!-- 리뷰랭킹 구간 -->
		<div id="part2">
			<div class="ranking_list">
				<div class="ranking_list_jq">
					<h2>요즘 인기 후기 TOP3</h2>
					<div class="ranking_review on">
						<div class="ranking_review_img">
							<div class="review_box">
								<p class="tag_label">
									<span>TOP1</span>
								</p>
									<span class="jq_main_top3_tab_img">
										<span class="alpha"></span>
										<img src="http://image1.hanatour.com/_images/main/top4/ae/ae_126.jpg"
										width="188px" height="212px">
									</span>
									<span class="overflow_cont">
										<strong class="title">
											이탈리아 다녀왔어요.
										</strong>
									</span>
							</div>
						</div>
						<div class="ranking_review_img">
							<div class="review_box">
								<p class="tag_label">
									<span>TOP2</span>
								</p>
									<span class="jq_main_top3_tab_img">
										<span class="alpha"></span>
										<img src="http://image1.hanatour.com/_images/main/top4/cn/cn_64.jpg"
										width="188px" height="212px">
									</span>
									<span class="overflow_cont">
										<strong class="title">
											홍콩 다녀왔어요.
										</strong>
									</span>
							</div>
						</div>
						<div class="ranking_review_img">
							<div class="review_box">
								<p class="tag_label">
									<span>TOP3</span>
								</p>
									<span class="jq_main_top3_tab_img">
										<span class="alpha"></span>
										<img src="http://image1.hanatour.com/_images/main/top4/ua/ua_47.jpg"
										width="188px" height="212px">
									</span>
									<span class="overflow_cont">
										<strong class="title">
											미국 다녀왔어요.
										</strong>
									</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 추천여행지 구간 -->
			<div class="monthTravel"><h2>이 달의 추천 여행지</h2> <!-- 버튼 원본값 width:980px;height:380px; -->
			<div class="month_product">
          <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:588px;height:321px;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="<%=request.getContextPath() %>/resources/images/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:588px;height:321px;overflow:hidden;">
            <div>
                <a href="#"><img data-u="image" src="<%=request.getContextPath()%>/resources/img/1.png" /></a>
            </div>
            <div>
                <a href="#"><img data-u="image" src="<%=request.getContextPath()%>/resources/img/2.png" /></a>
            </div>
            <div>
                <a href="#"><img data-u="image" src="<%=request.getContextPath()%>/resources/img/3.png" /></a>
            </div>
            <div>
                <a href="#"><img data-u="image" src="<%=request.getContextPath()%>/resources/img/1.png" /></a>
            </div>
            <div>
                <a href="#"><img data-u="image" src="<%=request.getContextPath()%>/resources/img/2.png" /></a>
            </div>
            <div>
                <a href="#"><img data-u="image" src="<%=request.getContextPath()%>/resources/img/3.png" /></a>
            </div>
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb051" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
            <div data-u="prototype" class="i" style="width:16px;height:16px;">
                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                    <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                </svg>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora051" style="width:55px;height:55px;top:0px;left:0px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora051" style="width:55px;height:55px;top:0px;right:0px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
            </div>
        </div>
    </div>
    <script type="text/javascript">jssor_1_slider_init();</script>
    <!-- #endregion Jssor Slider End -->
    			</div>
    		</div>
		</div>
      </section>
      <!-- 2페이지 끝 -->
      
      <!-- 3페이지 시작 -->
	      <section class="section3" style="background-color:#DAD9FF;">
			<div class="tophegiht"></div>
			<h2>3페이지</h2>
		</section>
		<!-- 3페이지 끝 -->
		
		<!-- 4페이지 시작 -->
		<section class="section4" style="background-color:wheat;">
			<div class="tophegiht"></div>
			<h2>4페이지</h2>
		</section>
		<!-- 4페이지 끝 -->
		
		<!-- 5페이지 시작 -->
		<section class="section5" style="background-color:#E4F7BA;">
			<div class="tophegiht"></div>
			<h2>5페이지</h2>
		</section>
		<!-- 5페이지 끝 -->
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