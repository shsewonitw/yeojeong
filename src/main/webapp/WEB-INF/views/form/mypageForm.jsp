<%@page import="com.tje.yeojeong.model.Travel_regist"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tje.yeojeong.model.Review_view"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link href="<%=request.getContextPath()%>/resources/css/kh_bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/kh_mypage.css?asd=sdds" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/kh_bootstrap.min.js"></script>

<!-- 달력기능 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery.min.js"></script> -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!--  -->
<script>
$(function(){
	// id 값 지정할시 작동안함
	$(".start_date").datepicker({
	    dateFormat: 'yy-mm-dd'
	  });
	$(".end_date").datepicker({
	    dateFormat: 'yy-mm-dd'
	  });
	
	
});



function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    removeAll(targetE);

    
    $.ajax({
		url : "<%=request.getContextPath()%>/cityAjax",
		type : "post",
		data : "country=" + val,
		dataType : "text",
		success : function(data) {
			if (eval(data)) {
				var str = data.substr(2,data.length-4);
				var str = str.split('","');
				str.forEach(function(element){
					
					addOption(element, targetE);
				})
			} else {
				alert("false");
			}
		},
		error : function(data) {
			alert("통신오류(관리자에게 문의하세요.)");
		}
	});
    
    
}function addOption(value, e){
    var o = new Option(value);
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}


function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}
</script>


<script type="text/javascript">

	var flag_tel = false;
	
	var telCheck_1 = /\s/g;
	var telCheck_2 = /^[0-9]{11,11}$/;
	var tel ="${sessionScope.login_member.tel }";
	
	function tel_keyup() {
		if($("#tel_input").val()==tel){
			$("#span_tel").text("현재 전화번호와 같습니다.");
			$("#span_tel").css("color", "red")
			flag_tel = false;
		}else if($("#tel_input").val() == "") {
			$("#span_tel").text("전화번호를 입력하세요.");
			$("#span_tel").css("color", "red")
			flag_tel = false;
			return;
		} else if (telCheck_1.test($("#tel_input").val())) {
			$("#span_tel").text("공백을 포함하지 않습니다.");
			$("#span_tel").css("color", "red")
			flag_tel = false;
			return;
		} else if (!telCheck_2.test($("#tel_input").val())) {
			$("#span_tel").text("전화번호 11자리를 확인하세요.");
			$("#span_tel").css("color", "red")
			flag_tel = false;
			return;
		} else {
			var year = $("#tel_input").val();
			flag_tel = true;
			$("#span_tel").css("color", "blue");
			$("#span_tel").text("사용 가능한 전화번호입니다.");
		}
	};

	$(document).ready(function() {
		
		
		
		$(".trip_delete_btn").on("click",function(){
			if (confirm("정말 삭제하시겠습니까??") == true){    
				// 내여행 정보 삭제
			
			var travelRegist = new Object();
			travelRegist.travel_id = $(this).parents("div.trip_div").find(".travel_id").val();
			travelRegist.member_id = "${sessionScope.login_member.member_id}";
			travelRegist.help_tel = $(this).parents("div.trip_div").find(".help_tel").val();
			travelRegist.start_date = $(this).parents("div.trip_div").find(".start_date").val();
			travelRegist.end_date = $(this).parents("div.trip_div").find(".end_date").val();
			travelRegist.country = $(this).parents("div.trip_div").find(".country").val();
			travelRegist.city = $(this).parents("div.trip_div").find(".city").val();
			var travelRegistJsonObject = JSON.stringify(travelRegist);
			
			$.ajax({
				url : "<%=request.getContextPath()%>/auth/mypageTravelRegistDelete",
				type : "post",
				contentType : "application/json; charset=UTF-8",
				data : travelRegistJsonObject,
				dataType : "text",
				success : function(data) {
					if (eval(data)) {
						alert("삭제가 완료 되었습니다.");
					} else {
						alert("삭제에 실패하였습니다.(관리자에게 문의하세요.)");
					}

				},
				error : function(data) {
					alert("통신오류(관리자에게 문의하세요.)");
				}
			});
			} else {   
				// 내여행 정보 삭제 취소
			    return;
			}
		});
		
		$(".trip_update_btn").on("click",function(){
//	 		```````````````````내여행 변경버튼 툴렀을때 입력창 검사//
			

			var help_tel = $(this).parents("div.trip_div").find(".help_tel").val();
			var countrySelect = $(this).parents("div.trip_div").find(".country").val();
			var citySelect = $(this).parents("div.trip_div").find(".city").val();
			var start_dateSelect = $(this).parents("div.trip_div").find(".start_date").val();
			var end_dateSelect = $(this).parents("div.trip_div").find(".end_date").val();
			var startDate = start_dateSelect;
	        var startDateArr = startDate.split('-');
	          
	        var endDate = end_dateSelect;
	        var endDateArr = endDate.split('-');
	                  
	        var startDateCompare = new Date(startDateArr[0], startDateArr[1], startDateArr[2]);
	        var endDateCompare = new Date(endDateArr[0], endDateArr[1], endDateArr[2]);
	        
			var telCheck_1 = /\s/g;
			var telCheck_2 = /^[0-9]{11,11}$/;
			
			// 번호 검사
			if (help_tel == "") {
				alert("전화번호를 입력하세요.");
				help_tel.focus();
				return;
			} else if (telCheck_1.test(help_tel)) {
				alert("전화번호는 공백을 포함하지 않습니다.");
				help_tel.focus();
				return;
			} else if (!telCheck_2.test(help_tel)) {
				alert("전화번호 11자리를 확인하세요.");
				help_tel.focus();
				return;
			// 나라 검사
			} else if (countrySelect==""||countrySelect=="default") {
				alert("나라를 선택하세요.");
				return;
			// 도시 검사
			}else if (citySelect==""||citySelect=="default"){
				alert("도시를 선택하세요.");
				return;
			// 날짜 검사
			}else if (startDateCompare.getTime() > endDateCompare.getTime()){
				alert("입국날짜가 출국 날짜 보다 빠를 수 없습니다.");
				return;
//			 	```````````````````````````````````````````````//	
			}else{
				if (confirm("정말 변경하시겠습니까??") == true){   
					// 내여행 정보 변경
					var travelRegist = new Object();
					travelRegist.travel_id = $(this).parents("div.trip_div").find(".travel_id").val();
					travelRegist.member_id = "${sessionScope.login_member.member_id}";
					travelRegist.help_tel = $(this).parents("div.trip_div").find(".help_tel").val();
					travelRegist.start_date = $(this).parents("div.trip_div").find(".start_date").val();
					travelRegist.end_date = $(this).parents("div.trip_div").find(".end_date").val();
					travelRegist.country = $(this).parents("div.trip_div").find(".country").val();
					travelRegist.city = $(this).parents("div.trip_div").find(".city").val();
					var travelRegistJsonObject = JSON.stringify(travelRegist);
					
					$.ajax({
						url : "<%=request.getContextPath()%>/auth/mypageTravelRegistUpdate",
						type : "post",
						contentType : "application/json; charset=UTF-8",
						data : travelRegistJsonObject,
						dataType : "text",
						success : function(data) {
							if (eval(data)) {
								alert("일정이 변경되었습니다.");
							} else {
								alert("일정 변경에 실패하였습니다.(관리자에게 문의하세요.)");
							}
		
						},
						error : function(data) {
							alert("통신오류(관리자에게 문의하세요.)");
						}
					});
				}else{   
					// 내여행 정보 변경 취소
				    return;
				}

			}
		});
// 		```````````````````````````````````동행 요청 리스트 수락 및 css 적용//
	function hoverColor_withme(selector,css,color){
		selector.css(css,color);
	}

		$(".request_btn").hover(function(){
							var s =$(this).css("background-color");
							hoverColor_withme($(this),"color","black");
							hoverColor_withme($(this),"background-color", "#dcdcdc");
							if(s=="rgb(52, 152, 219)"){
								hoverColor_withme($(this),"background-color", "rgb(52, 152, 219)");
								hoverColor_withme($(this),"color", "white");
							}
						},function(){
							var s =$(this).css("background-color");
							hoverColor_withme($(this),"color", "black");
							hoverColor_withme($(this),"background-color", "white");
							 if(s=="rgb(52, 152, 219)"){
								 hoverColor_withme($(this),"background-color", "rgb(52, 152, 219)");
								 hoverColor_withme($(this),"color", "white");
							}
						});
		// 동행 요청 리스트 버튼 구별 함수
		function withme_btn(statue_val, request_id_val){
			$.ajax({
				url : "<%=request.getContextPath()%>/auth/mypageWithMe",
				type : "post",
				data : "statue_val=" +statue_val+"&request_id_val=" + request_id_val,
				dataType : "text",
				success : function(data) {
					if (eval(data)) {
						alert("수락요청이 완료되었습니다.");
					} else {
						alert("수락요청에 실패하였습니다.(관리자에게 문의하세요.)");
					}

				},
				error : function(data) {
					alert("통신오류(관리자에게 문의하세요.)");
				}
			});
		}
		
		$(".request_btn").on("click",function() {
			
			var id_check = $(this).attr("id");
			
			var ac = $(this).parent().find(".request_btn").eq(0).attr("id");
			var ref = $(this).parent().find(".request_btn").eq(1).attr("id");
			var hol = $(this).parent().find(".request_btn").eq(2).attr("id");
			
			var request_id_val = $(this).parents("div#seperate_div").find(".receive_request_id").val();
			var statue_val = null;
			
			if(id_check==ac){
				statue_val = "수락";
			} else if(id_check==ref){
				statue_val = "거절";
			} else if(id_check==hol){
				statue_val = "요청대기중";
			}
			
			for(var i = 0 ; i <= 2;i++){
				hoverColor_withme($(this).parent().find(".request_btn").eq(i),"background-color", "white");
				hoverColor_withme($(this).parent().find(".request_btn").eq(i),"color", "black");
			}
			hoverColor_withme($(this),"background-color", "rgb(52, 152, 219)");
			hoverColor_withme($(this),"color", "white");
			
			if(id_check==ac){
				// 수락 눌렀을시
				withme_btn(statue_val, request_id_val);
			} else if(id_check==ref){
				// 거절 눌렀을시
				withme_btn(statue_val, request_id_val);
			} else if(id_check==hol){
				// 보류 눌렀을시
				withme_btn(statue_val, request_id_val);
			}
			
			
			
			
			
		});
// 		```````````````````````````````````//
		
		// 리스트 클릭시 색변경
			function display_change(data){
				$("#haveBeen").css("display","none");
				$("#write").css("display","none");
				$("#withMe").css("display","none");
				$("#trip").css("display","none");
				$("#myInformation").css("display","none");
				$("#" + data).css("display","block");
			}
		function hoverColor(selector,css,color){
			selector.css(css,color);
		}
	
			$(".list").hover(function(){
								var s =$(this).css("background-color");
								hoverColor($(this),"color","black");
								hoverColor($(this),"background-color", "#dcdcdc");
								if(s=="rgb(52, 152, 219)"){
					 				hoverColor($(this),"background-color", "rgb(52, 152, 219)");
					 				hoverColor($(this),"color", "white");
								}
							},function(){
								var s =$(this).css("background-color");
								hoverColor($(this),"color", "black");
								hoverColor($(this),"background-color", "white");
								 if(s=="rgb(52, 152, 219)"){
										hoverColor($(this),"background-color", "rgb(52, 152, 219)");
										hoverColor($(this),"color", "white");
								}
							});
				$(".direction").on("click",function() {
							hoverColor($(".direction").parent(),"background-color", "white");
							hoverColor($(".direction").parent(),"color", "black");
							hoverColor($(this).parent(),"background-color", "rgb(52, 152, 219)");
							hoverColor($(this).parent(),"color", "white");
// 							`````````````````다른목록 클릭시 제어//
							var me = $(this).attr("onclick");
							
							var haveBeen ="location.href ='#haveBeenPa'";
							var write =	"location.href ='#writePa'";
							var withMe ="location.href ='#withMePa'";
							var trip ="location.href ='#tripPa'";
							var myInformation ="location.href ='#myInformationPa'";
							if(me == haveBeen){
								display_change("haveBeen");
							}else if(me == write){
								display_change("write");
							}else if(me == withMe){
								display_change("withMe");
							}else if(me == trip){
								display_change("trip");
							}else if(me == myInformation){
								display_change("myInformation");
							}
// 							`````````````````````````````//
							
						});
// 				``````````````mypagelistname값으로 목록 클릭(페이지 전환시 url//
// 		 		```````````````이 바뀌면서 내가 보고 있던 목록을 유지 시켜줌)

				// 시작페이지
				var dis = "withMe";
				
				if("${mypagelistname}"||!("${mypagelistname}"== "")){
				list_click("${mypagelistname}");
				}else{
				
					list_click(dis);
				}
				
				function list_click(name){
						$("#" + name + "2").click();
				}
// 				```````````````````````````````````````````````

//					`````````````````````````동행요청리스트 수락 거정 버튼시 css조정//
// 				function cha(data, one, two, three){
// 					$(one).css("visibility","visible");
// 					$(two).css("visibility","visible");
// 					$(three).css("visibility","visible");
					
// 					$("#" + data).css("visibility","hidden");
// 				}
				
// 					$("#withme_btn button").on("click",function(){
// 						var id_check = $(this).attr("id");
						
// 						var ac = $(this).parent().find("button").eq(0);
// 						var ref = $(this).parent().find("button").eq(1);
// 						var hol = $(this).parent().find("button").eq(2);
						
// 							cha(id_check, ac, ref, hol);
							
							
// 						var request_id_val = $(this).parents("div#seperate_div").find(".receive_request_id").val();
// 						var statue_val = $(this).parents("div#seperate_div").find(".receive_statue").val();
// 							alert(request_id_val);
// 							alert(statue_val);
							
// 					});
//						``````````````````````````````````//
			});
				
	
	function tel_change() {
		
			if(!flag_tel){
				alert("휴대전화를 확인하세요");
				$("#tel_input").focus();
				all_flag = false;
				return;
			}
		
		if (confirm("번호가 틀리면 정확한 매칭이 어렵습니다.번호를 바꾸시겠습니까?")) {
			
			var memberObject = new Object();
			memberObject.member_id = "${sessionScope.login_member.member_id}";
			memberObject.tel = $("#tel_input").val();
			
			var memberJsonObject = JSON.stringify(memberObject);
			
			$.ajax({
				url : "<%=request.getContextPath()%>/tel_change",
				type : "post",
				contentType : "application/json; charset=UTF-8",
				data : memberJsonObject,
				dataType : "text",
				success : function(data) {
					if (eval(data)) {
						alert("번호변경  성공");
					} else {
						alert("번호변경 실패(관리자에게 문의 하세요)");
					}

				},
				error : function(data) {
					alert("통신오류(관리자에게 문의하세요.)");
				}
			});
		} else {

		}
	}
	
	
	
</script>


</head>
<body>
	<div style="height: 200px;"></div>


	<div class="row" id="list_div">
		<div class="col-md-3">
			<ul>

				<li class="list">
					<div id="haveBeen2" class="direction" onclick="location.href ='#haveBeenPa'">내가
						다녀온 곳</div>
				</li>

				<li class="list">
					<div id="write2" class="direction" onclick="location.href ='#writePa'">내가
						쓴글</div>
				</li>
				<li class="list">
					<div id="withMe2" class="direction" onclick="location.href ='#withMePa'">동행
						요청 리스트</div>
				</li>
				<li  class="list">
					<div id="trip2" class="direction" onclick="location.href ='#tripPa'">내여행</div>
				</li>
				<li  class="list"
					>
					<div id="myInformation2" class="direction" onclick="location.href ='#myInformationPa'">내정보</div>
				</li>
			</ul>
		</div>



		<div class="col-md-9">
			<!-- 		``````````````````	내가쓴글 페이지 -->

			<%
				List<Review_view> content = (List<Review_view>) request.getAttribute("rList");
				List<String> subcontent = new ArrayList<String>();
				String substr;
					if(content == null){
						
						
					}else{
						for (int i = 0; i < content.size(); i++) {
							try {
								substr = content.get(i).getContent().substring(0, 20) + "...";
							} catch (Exception e) {
								substr = content.get(i).getContent();
							}
							subcontent.add(substr);
						}
					}
				
				request.setAttribute("subcontent", subcontent);
			%>


			<%!
				public String formatTimeString(Date tempDate) {
	
					int SEC = 60;
					int MIN = 60;
					int HOUR = 24;
					int DAY = 30;
					int MONTH = 12;
			
					long curTime = System.currentTimeMillis();
			
					long regTime = tempDate.getTime();
			
					long diffTime = (curTime - regTime) / 1000;
			
					String msg = null;
					if (diffTime < SEC) {
						// sec
						msg = "방금 전";
					} else if ((diffTime /= SEC) < MIN) {
						// min
						msg = diffTime + "분 전";
					} else if ((diffTime /= MIN) < HOUR) {
						// hour
						msg = (diffTime) + "시간 전";
					} else if ((diffTime /= HOUR) < DAY) {
						// day
						msg = (diffTime) + "일 전";
					} else if ((diffTime /= DAY) < MONTH) {
						// day
						msg = (diffTime) + "달 전";
					} else {
						msg = (diffTime) + "년 전";
					}
					return msg;
				}
			%>

			<%
				List<Review_view> write_time = (List<Review_view>) request.getAttribute("rList");
				int size = 0;
				List<String> date = new ArrayList<String>();
				if(write_time==null){
					
				} else{
					size = write_time.size();
					for (int i = 0; i < write_time.size(); i++) {
						date.add(formatTimeString(write_time.get(i).getWrite_time()));
					}
				}
				
				
				request.setAttribute("date", date);
			%>
			<c:if test="${ not empty rList and rList.size() ne 0}" var="r" >
				<div id="write" class="info_box">
					<c:forEach begin="0" end="${rList.size()-1}" var="i">
						<div class="write_body_div">
							<div style="padding: 20px">
								<div id="write_sub_div">
									<div class="write_head_div" >
										<div style="float: left;">
											<span>${ rList[i].name }</span>
											<span>${ date[i] }</span>
										</div>
										<div style="float: right;">
											<span>${ rList[i].country }</span>
											<span>${ rList[i].city }</span>
										</div>
		
										<div class="write_bottom_div"><a href=""><b>${subcontent[i]}</b></a></div>
										<div>
											<span>평점 ${ rList[i].review_star }&nbsp;&nbsp;</span>
											<span>댓글${ rList[i].comment_count }</span>
										</div>
									</div>
									
									<div id="write_img_div" OnClick="" >
										<img id="write_img" class="img-thumbnail" src="<%=request.getContextPath()%>/resources/cityimg/${ rList[i].image_src }">
									</div>
								</div>
	
							</div>
						</div>
					</c:forEach>
				
					<ul class="pagination">
						<c:if test="${beforePageNo ne -1}">
							<li>
								<a href="<%=request.getContextPath()%>/auth/mypage/${beforePageNo}">  <span aria-hidden="true">&laquo;</span></a>
							</li>
						</c:if>
		
						<c:forEach var="pageNo" begin="${startPageNo}" end="${endPageNo}">
							<c:if test="${ curPage eq pageNo }" var="r">
								<li>
									<a id="page_num_a" href="#">${pageNo}</a>
								</li>
							</c:if>
							<c:if test="${ not r }">
								<li>
									<a href="<%=request.getContextPath()%>/auth/mypage/${pageNo}">${pageNo}</a>
								</li>
							</c:if>
						</c:forEach>
		
						<c:if test="${afterPageNo ne -1}">
							<li>
								<a href="<%=request.getContextPath()%>/auth/mypage/${afterPageNo}"> <span aria-hidden="true">&raquo;</span></a>
							</li>
						</c:if>
					</ul>	
					</div>
				</c:if>
				<c:if test="${not r }">
					<div id="write" class="info_box">
						<div style="text-align: center;">글이 없습니다.</div>
					</div>
				</c:if>
			
			<!-- 			``````````````````````` -->

			<!-- 		``````````````````	내정보 페이지 -->
			<div id="myInformation" class="info_box" style="display: block;">
				<div class="myInformationHeader">내
					정보</div>
				<div class="myInformationBody">
					${sessionScope.login_member.member_id }</div>
				<div class="myInformationBody">
					${sessionScope.login_member.name }</div>
				<div class="myInformationBody">
					${sessionScope.login_member.birthString }</div>
				<div class="myInformationBody">
					${sessionScope.login_member.email }</div>
				<div class="myInformationBody"
					style="padding-right: 30px; width: 100%">
					<div class="tel_box">
						<input class="form-control" id="tel_input" required
							value="${sessionScope.login_member.tel }" onkeyup="tel_keyup();">
						<button id="tel_btn" type="button" class="btn btn-primary"
							onclick="tel_change();">번호변경</button>
					</div>
					<div>
						<span id="span_tel"></span>
					</div>
				</div>
			</div>
			<!-- 			``````````````````````` -->
			
			
			<!-- 		``````````````````	내여행 페이지 -->
			<div id="trip" class="info_box" >
				<c:forEach items="${TravelRegistList }" var="travelList" varStatus="status">
					<form>
						<div class="trip_div">
							<div class="tripHeader">${travelList.country} ${travelList.city} 일정</div>
							<div class="trip_tel_div" >
								<span><label for="help_tel" style="display: inline-block;"><b>비상연락처&nbsp;&nbsp;&nbsp;</b></label></span>
								<span><input id="help_tel" name="help_tel" class="form-control help_tel" value="${travelList.help_tel }" placeholder="번호를 입력해주세요"></span>
								<span><input type="hidden" id="travel_id" class="travel_id" name="travel_id" value="${travelList.travel_id }"></span>
							</div>
							
							<div id="trip_form_div">
								<span>
									<b>국가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
								</span>
								<span>
									<select class="date_selcet country" name="country" id="selOne" onchange="doChange(this, 'selTwo${status.index}')">
										<option value="default">---국가 선택---</option>
											<c:forEach items="${countryList}" var="country">
												<c:if test="${travelList.country == country }" var="r">
													<option value="${country}" selected>${country}</option>
												</c:if>	
												<c:if test="${!r}" >
													<option value="${country}">${country}</option>
												</c:if>	
											</c:forEach>
									</select >
									<select class="date_selcet city" name="city" id="selTwo${status.index}">
										<option value="default">---도시 선택---</option>
											<option value="${travelList.city}" selected>${travelList.city}</option>
									</select>
								</span>
							
							</div>
							
							<div class="date_div">
								<span><label for="start_date" style="display: inline-block;"><b>출국날짜&nbsp;&nbsp;&nbsp;</b></label></span>
								<span><input name="start_date" value="${travelList.start_date }" class="form-control start_date" placeholder="클릭하여 날짜 선택"  autocomplete="off"></span>
							</div>
							<div class="date_div">
								<span><label for="end_date" style="display: inline-block;"><b>입국날짜&nbsp;&nbsp;&nbsp;</b></label></span>
								<span><input name="end_date" value="${travelList.end_date }" class="form-control end_date"  placeholder="클릭하여 날짜 선택"  autocomplete="off" ></span>
							</div>
							<div style="padding-left: 30px;">
								<button type="button" class="btn btn-primary trip_update_btn">변경</button>
								<button id="trip_delete_btn" type="button" class="btn btn-primary trip_delete_btn">삭제</button>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
			<!-- 			``````````````````````` -->
			
			<!-- 		``````````````````	동행 요청리스트 -->
			<div id="withMe" class="info_box">
			
				<ul class="nav nav-tabs" role="tablist" id="myTab">
				  <li role="presentation" class="active"><a href="#requestReceive" aria-controls="requestReceive" role="tab" data-toggle="tab">요청 받은 리스트</a></li>
				  <li role="presentation"><a href="#requestSend" aria-controls="requestSend" role="tab" data-toggle="tab">요청 보낸 리스트</a></li>
				</ul>
	
				<div class="tab-content">
				<!-- 요청 받은 리스트 -->
				  <div role="tabpanel" class="tab-pane fade in active" id="requestReceive">
					<c:forEach items="${withmeRequestReceive }" var="Receive" varStatus="statu">
						<div class="withme__body_div" id="seperate_div">
							<input type="hidden" class="receive_request_id" name="request_id" value="${Receive.request_id }"/>
							<input type="hidden" class="receive_statue" name="statue" value="${Receive.statue }"/>
								<div style="padding: 5px;">
									보낸사람 : ${Receive.name }
								</div>
								<div style="padding: 5px;">
									보낸사람성별 : ${Receive.genderString }
								</div>
								<div style="padding: 5px;">
									나라<br>${Receive.country }
								</div>
								<div style="padding: 5px;">
									시티<br>${Receive.city }
								</div>
								<div style="padding: 5px;">
									출국날짜<br>${Receive.start_dateString }
								</div>
								<div style="padding: 5px;">
									입국날짜<br>${Receive.end_dateString }
								</div>
								<div id="withme_btn" >
								
									<div class="request_btn" id="ac${statu.index }" ><div id="ac${statu.index }" onclick="">수락</div></div>
									<div class="request_btn" id="ref${statu.index }" ><div id="ref${statu.index }" onclick="">거절</div></div>
									<div class="request_btn" id="hol${statu.index }"><div id="hol${statu.index }" onclick="">보류</div></div>
									<script type="text/javascript">
 										var status = "${Receive.statue }";
 										var index = "${statu.index }";
										if(status == '수락'){ 
											$('#ac'+index).css("background-color","rgb(52, 152, 219)"); 
											$('#ac'+index).css("color","white"); 
										} 
 										if(status == '거절'){ 
											$('#ref'+index).css("background-color","rgb(52, 152, 219)"); 
											$('#ref'+index).css("color","white"); 
										} 
										if(status == '요청대기중'){ 
											$('#hol'+index).css("background-color","rgb(52, 152, 219)"); 
											$('#hol'+index).css("color","white"); 
										} 
									</script> 

								</div>
								
						</div>
					
					
					</c:forEach>


				  </div>
				<!-- ------------------ -->
				
				<!-- 요청 보낸 리스트 -->
				  <div role="tabpanel" class="tab-pane fade in" id=requestSend>
					<c:forEach items="${withmeRequestSend }" var="Send" varStatus="statu">
						<div class="withme__body_div withme__body_div${statu.index }">
							<input type="hidden" name="request_id" value="${Send.request_id }"/>
								
								<div style="padding: 5px;">
									받는사람 : ${Send.name }
								</div>
								<div style="padding: 5px;">
									받는사람성별 : ${Send.genderString }
								</div>
								<div style="padding: 5px;">
									나라<br>${Send.country }
								</div>
								<div style="padding: 5px;">
									시티<br> ${Send.city }
								</div>
								<div style="padding: 5px;">
									출국날짜<br>${Send.start_dateString }
								</div>
								<div style="padding: 5px;">
									입국날짜<br> ${Send.end_dateString }
								</div>
								<div style="padding: 5px;">
									상태 : ${Send.statue }
								</div>
								<div class="request_delete_btn" id="ac${statu.index }" ><div id="ac${statu.index }" onclick="deleteWithMeRquest('${Send.request_id }', 'withme__body_div${statu.index }');">삭제</div></div>
								<div class="request_delete_btn" id="ac${statu.index }" ><div id="ac${statu.index }" onclick="">쪽지보내기</div></div>
								
						</div>
					
					</c:forEach>
				  <script type="text/javascript">
				  function deleteWithMeRquest(data, data2){
					  if(confirm("정말 삭제하시겠습니까??") == true){
						$.ajax({
							url : "<%=request.getContextPath()%>/auth/deleteWithMeRquest",
							type : "post",
							data : "request_id_val=" + data +"&div=" + data2,
							dataType:"json",
							success : function(data) {
								
								if (eval(data.result)) {
									alert("요청이 삭제되었습니다.");
									$("." + data.div).remove();
									
								} else {
									alert("요청 삭제에 실패하였습니다.(관리자에게 문의하세요.)");
								}

							},
							error : function(data) {
								alert("통신오류(관리자에게 문의하세요.)");
							}
						});
					  } else {
						  alert("삭제가 취소 되었습니다.");
					  }
				  }
				  
				  </script>
				  
				  </div>
				<!-- ------------------ -->
				</div>

			</div>
			<!-- 			``````````````````````` -->
			
		</div>

	</div>








</body>
</html>

