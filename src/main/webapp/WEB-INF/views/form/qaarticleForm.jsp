<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<meta charset="UTF-8">
<title>자주 묻는 질문</title>
</head>
<body>
 
<script type="text/javascript">
alert(222);</script>
 
<div style="width:100%; height:200px;"></div>
<div align="left">
	<h3>
		<font>자주 묻는 질문 |</font>
	</h3>
		
</div>
 
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" align="center">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          [공지] 티켓/투어 서비스가 모하지 서비스로 변경 오픈 안내
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        [공지] 티켓/투어 서비스가 모하지 서비스로 변경 오픈 안내
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          [공지] 기존 가이드북/맵북 서비스 종료 안내
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
       	 안녕하세요. 믿을 수 있는 여행팁, 투어팁스입니다:)<br> 더 많은 도시의 신속하고 정확한 가이드북 서비스를 제공하기 위하여 기존 가이드북과 맵북 서비스는 12월 21일로 종료되었습니다.<br> 
		그 동안 기존 가이드북과 맵북을 사용해 주신 회원님들 감사드리며, 앞으로 주기적으로 업데이트가 되는 인쇄전용 버전과 모바일전용 버전 가이드북 서비스를 이용 부탁드립니다.<br> 감사합니다.<br>
		새로운 가이드북 서비스 다운받기 >> 
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          [공지]	휴대폰 번호가 변경되었습니다. 시스템에서 어떻게 변경해야 하나요?
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        	카카오 인재영입 페이지에 로그인하신 다음, 내지원정보 > 기본정보에 들어가셔서 휴대폰 번호를 변경하실 수 있습니다.
      </div>
    </div>
  </div>  
</div>




</body>
</html>