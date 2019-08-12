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
	
</style>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
</head>
<body style="height: 100%; overflow: scroll;">
<!-- prelude 제외 -->
<div style="height:200px;"></div>
<div style="height:100%;">
<div id="div_menu"></div>

<div id="div_con">

<div align="left">
	<h3>
		<font>자주 묻는 질문 FAQ |</font>
	</h3>
	<hr size="5" noshade>	
</div>
 
<div id="aside"> 
<div align="center" class="panel-group" id="accordion" > <!-- accordion 1 -->
   <div>
   
        <div class="panel-heading"> <!-- panel-heading -->
            <h4 class="panel-title"> <!-- title 1 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionOne">
              Q. 여권을 분실 또는 소매치기를 당했어요.              
            </a>            
           </h4>           
        </div>
		<!-- panel body -->
        <div id="accordionOne" class="panel-collapse collapse">
          <div class="panel-body">
           	A. 가까운 경찰서에 분실신고를 해주세요.<br> 
			이 후 가까운 대사관 혹은 총영사관에 여권 분실 신고를 하고 여행 증명서나 단수여권을 발급 받으셔야 합니다.<br>
			임시 여권 발급 시, 사진이 필요하므로, 여행 출발전 혹시 모를 사태에 대비해 여권 복사본과 사진을 미리 준비하시면 도움이 됩니다.<br>
			단, 여권 분실 후, 신고방법에 대한 내용은 각 나라별로 상이 할 수 있습니다.<br>			
          </div>          
          <hr size="5" noshade>
        </div>
  </div>
  
   <div>  <!-- accordion 2 -->
	  
          <div class="panel-heading"> 
          <h4 class="panel-title"> <!-- title 2 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionTwo">
              Q. 여행시 환자가 발생했을때 어떻게 하나요?
            </a>
          </h4>
          </div>
		 <!-- panel body -->
        <div id="accordionTwo" class="panel-collapse collapse">
          <div class="panel-body">
            A. 현지 의료기관에 방문하여 진료 및 치료를 받도록 하며, 의료진의 소견서와 영수증을 꼭 수령하셔야만 귀국 후, 보험처리가 가능합니다.<br>
			여행지에서 발생한 의료 서비스의 경우 여행지에서 진료 받은 내용을 토대로 여행자 보험에 가입한 보험사에 비용을 신청 할 수 있습니다.<br>
			보험청구시 	필요서류 : 의사 소견서 또는 병원 진단서, 치료비 영수증, 여권 카피본, 은행 통장 사본, 전화번호, 사고 내역서, 치료비 명세서 등<br>
			기존 병력이 있거나 치과 치료, 한방 치료, 성형 부분은 제한이 될 수 있으니 자세한 사항은 보험사의 안내를 받으셔야 합니다.<br>
          </div>
          <hr size="5" noshade>
        </div>
		
   </div>
   
    <div>  <!-- accordion 3 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 3 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionThree">
              Q. 매너팁은 무엇인가요?
            </a>
          </h4>
        </div>
		
        <div id="accordionThree" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 호텔, 식당 등에서 발생되는 비용으로 따로 정해진 금액은 없습니다. 약 1$ 정도의 비용을 지불하는 경우도 있으며, 결제금액의 약 10%를 지불하는 경우도 있습니다. <br>
        	매너 팁은 의무경비가 아니므로 소비자의 자율적 선택 사항으로 지불 여부에 따른 불이익은 없습니다.
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 <div>  <!-- accordion 4 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 4 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionFour">
              Q. 해외여행시 국내에서 사용하는 전기제품을 사용할 수 있나요?
            </a>
          </h4>
        </div>
		
        <div id="accordionFour" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 각 나라별로 사용하는 전압에 차이가 있습니다.<br>
			때문에 여행 출발 전, 담당자 혹은 홈페이지 상품 안내 페이지에 기재된 해당 여행지의 전압을 미리 숙지하시어, 전자 제품을 가지고 가시는게 좋습니다.<br>
			자세한 내용은 여행상품 예약 시, 담당자에게 문의해 주시면 빠르게 안내 받을 수 있습니다.<br>
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 <div>  <!-- accordion 5 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 5 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionFive">
              Q. 어플리케이션에 오류가 있습니다. 어디로 연락해야 하나요?
            </a>
          </h4>
        </div>
		
        <div id="accordionFive" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. '문의하기'을 통해 문의해 주세요.<br>
        	 오류를 발견하여 신고해 주시면 다른 여행자들에게 큰 도움이 됩니다.<br> 
        	 오류를 줄이고 더욱 편리하게 여행을 준비할 수 있도록 노력하는 여정이 되겠습니다.<br>
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 <div>  <!-- accordion 6 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 6 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionSix">
              Q. 비밀번호를 잊어버렸습니다. 어떻게 찾을 수 있나요?
            </a>
          </h4>
        </div>
		
        <div id="accordionSix" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 로그인 화면에서 '비밀번호 찾기'를 클릭하고 가입시 기입한 이메일 주소를 적어주세요. 해당 이메일로 임시 비밀번호를 발송해 드립니다.
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 <div>  <!-- accordion 7 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 7 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionSeven">
              Q. 해외여행자 보험이란?
            </a>
          </h4>
        </div>
		
        <div id="accordionSeven" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 여행 도중에 우연히 발생하게 되는 각종 사고 및 질병, 조난 시 구조비용, 휴대품의 도난 손해 등의 보상을 목적으로 하는 보험입니다.<br> 
			해외여행자보험의 실손의료비는 여러 보험사에 중복 계약을 했더라도 중복보상이 안되고 비례보상으로 처리됩니다. <br>
			(단 , 사망보험금은 중복보상 가능) <br>
		    ( 휴대품 손해, 배상책임도 비례보상으로 처리)<br> 
                      국내에서 상해 및 질병으로 치료 받는 경우 발생한 실손의료비에 대해 100% 보상을 받을 수 없다. 자기부담금이 설정되어 있어 그만큼의 비용을 제외하고 보상을 받을 수 있다.<br> 
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 <div>  <!-- accordion 8 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 8 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionEight">
              Q. 여행경보제도란?
            </a>
          </h4>
        </div>
		
        <div id="accordionEight" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 여행경보제도는 특정 국가(지역) 여행·체류시 특별한 주의가 요구되는 국가 및 지역에 경보를 지정하여 위험수준과 이에 따른 안전대책(행동지침)의 기준을 안내하는 제도입니다.<br> 
        	 우리국민의 안전에 대한 위험(위협)을 중요한 기준으로 해당 국가(지역)의 치안정세와 기타 위험요인을 종합적으로 판단하여 <br>
        	  안전대책의 기준을 판단할 수 있도록 중·장기적 관점에서 여행경보를 지정·공지하고 있습니다.<br>
			이미 미국, 영국, 캐나다, 호주, 뉴질랜드 등의 국가에서 유사한 제도를 운영하고 있어, 안전한 해외여행에 기여하고 있습니다. 
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 <div>  <!-- accordion 9 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 9 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionNine">
              Q. 여행지의 정보를 알고 싶습니다.
            </a>
          </h4>
        </div>
		
        <div id="accordionNine" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 상단의 여행 -> 여행지 정보 페이지에 시차, 비행시간(직항), 비자등을 확인하실 수 있습니다.  
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 <div>  <!-- accordion 10 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 10 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionTen">
              Q. 유럽에서 쓰는 화폐는 어떤건가요?
            </a>
          </h4>
        </div>
		
        <div id="accordionTen" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. EU 회원국 중에 유로화를 사용하는 국가는 독일, 프랑스 , 이탈리아 , 벨기에 , 핀란드, 록셈부르크 , 스페인 , <br> 
        	     포르투갈, 슬로바키아 , 슬로베니아 , 그리스 , 라트비아, 에스토니아, 아일랜드, 오스트리아 , 벨기에, 몰타 등입니다.<br>
			     크로아티아 , 불가리아 , 폴란드 , 체코 , 헝가리 , 루마니아 , 스웨덴 등은 유료화사용 미참가국입니다. <br>
			     그 외의 국가에서도 자체 화폐 외에도 유로화와 달러가 모두 통용되고 있습니다.<br>
			     그밖에 봉사료도 유로화로 지불하시면 됩니다.
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 
 <div>  <!-- accordion 11 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 11 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionEleven">
              Q. 군 미필자도 해외여행을 갈 수 있나요?
            </a>
          </h4>
        </div>
		
        <div id="accordionEleven" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 07.1.1.부터 24세이하자에 대한 ;국외여행허가제가 폐지되어 24세가 되는 해 12월말까지는 별도의 허가절차 없이 국외여행이 가능합니다. <br> 
			     다만, 24세 이하자라 하더라고 공익근무요원 등으로 대체복무중인 사람은 국외여행허가를 받아야 합니다.<br>
                           또한, 25세 이후까지 계속 국외에 체재하고자 할 경우에는 25세가 되는 해 1월 15일까지 여행목적에 따른 구비서류를 갖추어 병무청장의 국외여행기간연장허가를 받아야 합니다.<br>
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
<div>  <!-- accordion 12 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 12 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionTwelve">
              Q. 국내에서 사용하는 전기제품을 해외에서도 사용할 수 있나요?
            </a>
          </h4>
        </div>
		
        <div id="accordionTwelve" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 방문하시는 국가에따라 다르나, 대부분의 국가가 상이한 전압 시스템을 사용하기 때문에 따로 어댑터가 필요합니다.<br>
        	      또한 전압은 같으나 사용 규격(크기 또는 모양)이 다른 경우도 많습니다. <br>
			     인천공항에서는 대부분의 어댑터를 판매하고 있으며, 한국인이 많이 방문하는 호텔의 경우 프론트에서 어댑터 대여가 가능하기도 합니다.<br>
                            다만, 호텔대여같은경우 한정수량을 제공하고있기때문에 ,별도로 미리 준비하여 방문하시길 권장드립니다.<br>
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
 
 <div>  <!-- accordion 13 -->
	
        <div class="panel-heading">
          <h4 class="panel-title"> <!-- title 13 -->
            <a data-toggle="collapse" data-parent="#accordion" href="#accordionThirteen">
              Q. 해외에서 카드사용시 환율은?
            </a>
          </h4>
        </div>
		
        <div id="accordionThirteen" class="panel-collapse collapse">
          <!-- panel body -->
          <div class="panel-body">
        	A. 해외에서 카드를 사용할 경우 환율 적용 시점을 알아두면 유용합니다. <br>
			     환율 적용시점은 각 카드사마다 상이하오니 해당 카드사에 문의 부탁 드립니다.<br>
			     세계 어느 나라에서 사용하시더라도 모든 거래 금액은 미 달러화로 전환 후 원화로 청구됩니다.<br> 
			     예를 들어 유럽에서 유로화로 결제하실 경우 미화로 전환하여 청구됩니다.<br>
			     해외에서 카드를 분실하면 최대한 빨리 해당 카드사에 신고하는 것이 중요합니다.<br>
			     이를 위해서는 출국 전에 미리 카드사의 긴급 연락처를 메모해두는 것이 좋습니다.<br>
			     또 장기 체류자가 해외에서 카드를 분실하였을 경우, 현지에서 긴급 대체 카드 발급을 신청하면 이틀 내에 새로운 카드를 발급 받을 수 있습니다.<br>
        </div>
        <hr size="5" noshade>
    </div> 
 </div>
	 
</div>
</div>



</div>
<div id="div_menu2"></div>
</div>
</body>
</html>