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
<link href="<%=request.getContextPath()%>/resources/css/kh_bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/kh_bootstrap.min.js"></script>

<style type="text/css">
a {
	text-decoration:none;
	cursor: pointer;
	color: black;
}
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;font-size: 18px}

#myInformation {
	border: solid thin #ddd;
	border-radius: 4px;
	text-align: left;
}

.direction {
	cursor: pointer;
	line-height: 40px
}

.list {
	list-style: none;
	text-align: left;
	border-radius: 2px 2px 2px 2px/2px 2px 2px 2px;
	padding-left: 30px;
	height: 40px;
	margin: 4px;
	list-style: none;
}

.info_box {
	display: none;
}

.myInformationHeader {
	border-radius: 4px 4px 4px 4px;
	padding-left: 20px;
	height: 60px;
	background-color: #f5f5f5;
	font-size: 20px;
	vertical-align: bottom;
}

#tel_btn {
	border-radius: 0px 4px 4px 0px/0px 4px 4px 0px;
}

#tel_input {
	border-radius: 4px 0px 0px 4px/4px 0px 0px 4px;
	border-left-color: #ddd;
}

.myInformationBody {
	box-sizing: border-box;
	line-height: 40px;
	padding-left: 30px;
	height: 40px;
	margin: 4px;
}

.tel_box input {
	vertical-align: top;
}

.tel_box button {
	vertical-align: top;
}

.hover {
	color: black;
	background-color: #dcdcdc;
}
</style>

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
		
		
// 		$(".direction").parent().on("mouseover",function(){
// 			 var s =$(this).css("background-color");
// 			 $(this).css("background-color","#dcdcdc").css("color", "black");
// 			 if(s=="rgb(52, 152, 219)"){
// 				 $(this).css("background-color","rgb(52, 152, 219)").css("color", "white");
// 			 }
// 		});
// 		$(".direction").parent().on("mouseout",function(){
// 			 var s =$(this).css("background-color");
// 			 $(this).css("background-color","white").css("color", "black");
// 			 if(s=="rgb(52, 152, 219)"){
// 				 $(this).css("background-color","rgb(52, 152, 219)").css("color", "white");
// 			 }
// 		});
			function display_change(data){
				$("#haveBeen").css("display","none");
				$("#write").css("display","none");
				$("#withMe").css("display","none");
				$("#trip").css("display","none");
				$("#myInformation").css("display","none");
				$("#" + data).css("display","block");
			}
		
			$(".list").hover(function(){
								var s =$(this).css("background-color");
								$(this).css("color", "black").css("background-color", "#dcdcdc");
								if(s=="rgb(52, 152, 219)"){
					 				 $(this).css("background-color","rgb(52, 152, 219)").css("color", "white");
								}
							},function(){
								var s =$(this).css("background-color");
								$(this).css("color", "black").css("background-color", "white");
								 if(s=="rgb(52, 152, 219)"){
									 $(this).css("background-color","rgb(52, 152, 219)").css("color", "white");
								}
							});
				$(".direction").on("click",function() {
							$(".direction").parent().css("background-color","white").css("color", "black");
							$(this).parent().css("background-color","rgb(52, 152, 219)").css("color", "white");
							
// 							`````````````````다른목록 클릭시 제어//
							var me = $(this).attr("onclick");
							
							var haveBeen ="location.href ='#haveBeen'";
							var write =	"location.href ='#write'";
							var withMe ="location.href ='#withMe'";
							var trip ="location.href ='#trip'";
							var myInformation ="location.href ='#myInformation'";
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
				var dis = "trip";
				
				if("${mypagelistname}"||!("${mypagelistname}"== "")){
				list_click("${mypagelistname}");
				}else{
				
					list_click(dis);
				}
				
				function list_click(name){
						$("#" + name + "2").click();
				}
// 				```````````````````````````````````````````````
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
<body style="overflow: auto;">
	<div style="height: 200px;"></div>


	<div class="row"
		style="text-align: center; margin-left: 10%; margin-right: 10%;">
		<div class="col-md-3">
			<ul>

				<li class="list">
					<div id="haveBeen2" class="direction" onclick="location.href ='#haveBeen'">내가
						다녀온 곳</div>
				</li>

				<li class="list">
					<div id="write2" class="direction" onclick="location.href ='#write'">내가
						쓴글</div>
				</li>
				<li class="list">
					<div id="withMe2" class="direction" onclick="location.href ='#withMe'">동행
						요청 리스트</div>
				</li>
				<li  class="list">
					<div id="trip2" class="direction" onclick="location.href ='#trip'">내여행</div>
				</li>
				<li  class="list"
					>
					<div id="myInformation2" class="direction" onclick="location.href ='#myInformation'">내정보</div>
				</li>
			</ul>
		</div>



		<div class="col-md-9">
			<!-- 		``````````````````	내가쓴글 페이지 -->

			<%
				List<Review_view> content = (List<Review_view>) request.getAttribute("rList");
				List<String> subcontent = new ArrayList<String>();
				String substr;

				for (int i = 0; i < content.size(); i++) {
					try {
						substr = content.get(i).getContent().substring(0, 20) + "...";
					} catch (Exception e) {
						substr = content.get(i).getContent();
					}
					subcontent.add(substr);
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
				int size = write_time.size();
				List<String> date = new ArrayList<String>();
				for (int i = 0; i < write_time.size(); i++) {
					date.add(formatTimeString(write_time.get(i).getWrite_time()));
				}
				request.setAttribute("date", date);
			%>

			<div id="write" class="info_box">
				<c:forEach begin="0" end="${rList.size()-1}" var="i">
					<div
						style="border: solid thin #ddd; margin: 10px; border-radius: 4px; text-align: left; overflow: hidden;">
						<div style="padding: 20px">

							<div style="float: left; line-height: 40px;width: 70%">
								<div style="float: left;">
									<span>${ rList[i].name }</span>
									<span>${ date[i] }</span>
								</div>
								<div style="float: right;">
									<span>${ rList[i].country }</span>
									<span>${ rList[i].city }</span>
								</div>

								<div style="display: inline-block; width: 75%"><a><b>${subcontent[i]}</b></a></div>
								<div>
									<span>평점 ${ rList[i].review_star }&nbsp;&nbsp;</span>
									<span>댓글${ rList[i].comment_count }</span>
								</div>
							</div>
							<div OnClick="#" style="float: right;cursor: pointer;">
								<img class="img-thumbnail"
									style="max-width: 100px; max-height: 100px; width: 100%; height: 100%;"
									src="<%=request.getContextPath()%>/resources/img/${ rList[i].image_src }">
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
								<a href="#" style="background-color:rgb(52, 152, 219);color:white;" >${pageNo}</a>
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
			<!-- 			``````````````````````` -->

			<!-- 		``````````````````	내정보 페이지 -->
			<div id="myInformation" class="info_box"
				style="border: solid thin #ddd; border-radius: 4px; text-align: left;">
				<div class="myInformationHeader" style="line-height: 60px">내
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
							value="${sessionScope.login_member.tel }"
							style="width: 70%; float: left;" onkeyup="tel_keyup();">
						<button id="tel_btn" type="button" class="btn btn-primary"
							onclick="tel_change();" style="float: left;">번호변경</button>
					</div>
					<div>
						<span id="span_tel" style="color: red;"></span>
					</div>
				</div>
			</div>
			<!-- 			``````````````````````` -->
			
			
			<!-- 		``````````````````	내여행 페이지 -->
			<div id="trip" class="info_box"
				style="border: solid thin #ddd; border-radius: 4px; text-align: left;overflow: hidden;">
				<div class="myInformationHeader" style="line-height: 60px">내 여행</div>
				<div style="line-height: 40px;padding-left: 30px;height: 40px;margin: 4px;">
					<span><label for="help_tel" style="display: inline-block;"><b>비상연락처&nbsp;&nbsp;&nbsp;</b></label></span>
					<span><input id="help_tel" name="help_tel" size="20" class="form-control" style="width: 50%;display: inline-block;border-radius: 4px 4px 4px 4px;border-left-color: #ddd;"></span>
				</div>
				<div style="line-height: 40px;padding-left: 30px;height: 40px;margin: 4px;">
					<span><label for="help_tel" style="display: inline-block;"><b>출국날짜&nbsp;&nbsp;&nbsp;</b></label></span>
					<span><input id="help_tel" name="help_tel" size="20" class="form-control" style="width: 50%;display: inline-block;border-radius: 4px 4px 4px 4px;border-left-color: #ddd;"></span>
				</div>
				<div style="line-height: 40px;padding-left: 30px;height: 40px;margin: 4px;">
					<span><label for="help_tel" style="display: inline-block;"><b>입국날짜&nbsp;&nbsp;&nbsp;</b></label></span>
					<span><input id="help_tel" name="help_tel" size="20" class="form-control" style="width: 50%;display: inline-block;border-radius: 4px 4px 4px 4px;border-left-color: #ddd;"></span>
				</div>
				<div style="padding-left: 30px;">
					<button type="button" class="btn btn-primary">변경</button>
					<button type="button" class="btn btn-primary">삭제</button>
				</div>
				여행 정보 
				여행삭제
			   	 member_id를 통해 정보 꺼내로기
			  	 country 
		  	 	 city 
			</div>
			<!-- 			``````````````````````` -->
		</div>

	</div>








</body>
</html>

