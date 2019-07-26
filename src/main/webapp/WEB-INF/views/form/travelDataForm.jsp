<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/main.css?asd=56">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
	<style type="text/css">
	#div_menu{
		width: 20%;
		height: 300px;
		float: left;		
		text-align: left;		
	}
	
	#div_con{
		width: 60%;
		height: 300px;
		float: left;
		background-size: 100%100%;
		text-align: left;		
	}
	
	#div_menu2{
		width: 20%;
		height: 300px;
		float: right;		
		text-align: left;		
	}
	#scale {
		transform: scale(1);
  		-webkit-transform: scale(1);
  		-moz-transform: scale(1);
  		-ms-transform: scale(1);
		-o-transform: scale(1);
  		transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
	}
	#scale:hover {
	  	transform: scale(1.2);
	  	-webkit-transform: scale(1.2);
	  	-moz-transform: scale(1.2);
	  	-ms-transform: scale(1.2);
	  	-o-transform: scale(1.2);
	}
	#img {
		width:325px;
		height:280px;
		overflow:hidden	
	}
	
	
</style>
<meta charset="UTF-8">
<title>여행지 정보</title>
</head>
<body style="height:100%; overflow:scroll;">

<div style="height:200px;"></div>
<div style="height:100%;">
<div id="div_menu"></div>

<div id="div_con">

<div align="center"><h1>여행지 정보</h1><p>가고싶은 여행지를 선택하세요.</p><hr size="5" noshade></div>

<div id="traveldata">

	<form action="<%=request.getContextPath()%>/form/traveldata" method="post">
	<!-- 나라별 정보 링크 -->
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>프랑스 파리</h4>
			<!-- 클릭시 디테일화면으로  -->
			<a href="<%=request.getContextPath()%>/traveldatad?city=파리">
				<img src="<%=request.getContextPath()%>/resources/cityimg/france.jpg" alt="프랑스" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>이탈리아 로마</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=로마">
				<img src="<%=request.getContextPath()%>/resources/cityimg/itary.jpg" alt="이탈리아" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>스위스 알프스</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=알프스">
				<img src="<%=request.getContextPath()%>/resources/cityimg/swis.jpg" alt="스위스" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">
		<h4>헝가리 부다페스트</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=부다페스트">
				<img src="<%=request.getContextPath()%>/resources/cityimg/hungary.jpg" alt="헝가리" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>스페인 마드리드</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=마드리드">
				<img src="<%=request.getContextPath()%>/resources/cityimg/spain.jpg" alt="스페인" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>체코 프라하</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=프라하">
				<img src="<%=request.getContextPath()%>/resources/cityimg/czech.jpg" alt="체코" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">
		<h4>오스트리아 빈</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=빈">
				<img src="<%=request.getContextPath()%>/resources/cityimg/austria.jpg" alt="오스트리아" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>중국 상하이</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=상하이">
				<img src="<%=request.getContextPath()%>/resources/cityimg/china.jpg" alt="중국" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>			
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>필리핀 보라카이</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=보라카이">	
				<img src="<%=request.getContextPath()%>/resources/cityimg/borakai.jpg" alt="보라카이" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>아이스란드 레이캬비크</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=레이캬비크">
				<img src="<%=request.getContextPath()%>/resources/cityimg/iceland.jpg" alt="아이슬란드" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>대한민국 제주도</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=제주도">
				<img src="<%=request.getContextPath()%>/resources/cityimg/jeju.jpg" alt="제주도" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	
	<div align="center" class="col-sm-5 col-md-3" id="scale">	
		<h4>태국 방콕</h4>
			<a href="<%=request.getContextPath()%>/traveldatad?city=방콕">
				<img src="<%=request.getContextPath()%>/resources/cityimg/thai.jpg" alt="태국" class="img-circle" style="width:180px; height:180px;">
			</a>
			<hr size="5" noshade>
	</div>
	</form>
</div>

</div>

<div id="div_menu2"></div>
</div>
</body>
</html>