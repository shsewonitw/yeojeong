<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body style="overflow:scroll;">
<jsp:include page="/WEB-INF/views/admin/prelude_admin.jsp"/>
<div style="height:200px;"></div>

<div style="margin-left:30px;">
	<a onClick="window.location.reload()" style="cursor: pointer;"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>채팅 새로고침</a>
</div>
<body>
<div id="_chatbox">
<!-- 
	<button onclick="wsConnect();">연결</button><button onclick="wsClose();">종료</button>
-->

	<!-- 채팅창 -->
	<div style="overflow:hidden;">
		
		
			
			<!-- 채팅 목록 -->
			<div style="float:left; margin-left:30px;margin-right:30px;overflow:auto;width:195;height:360px">
				<c:forEach items="${chatMap}" var="chatMap">
					<div class="list-group" style="margin: auto; text-align: center;">
						<a href="javascript:void(0);" onclick="user_click('${chatMap.key.getId()}');" class="list-group-item" id="a_${chatMap.key.getId()}"> user_${chatMap.key.getId()} 의 실시간 문의 </a>
					</div>
				</c:forEach>
			</div>
			
			
			
			<!-- 채팅 내용 -->
			<c:forEach items="${chatMap}" var="chatMap">
			<div style="float:left;display:none;" id="user_${chatMap.key.getId()}_div" class="user_all_div">
				<div id="user_${chatMap.key.getId()}_scrollDiv" style="overflow:auto;width:500px;height:326px;">
					<fieldset>
						<div id="${chatMap.key.getId()}_messageWindow" class="all_messageWindow">
							${chatMap.value}
						</div>
						
						
					</fieldset>
				</div>
				<div style="overflow:hidden;">
					<input id="${chatMap.key.getId()}_inputMessage" class="form-control" type="text" onkeyup="enterkey('${chatMap.key.getId()}')" style="float:left;width:450px;" /> <input type="submit" class="btn btn-default" value="전송" onclick="sendMessage('${chatMap.key.getId()}')" style="float:left;"/>
				</div>
			</div>
			</c:forEach>
		
	</div>
	

</div>

<script type="text/javascript">


//hover속성
$(function(){
	$(".list-group-item").hover(function(){
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
})

function user_click(user_id){
	var select_div = '#user_'+user_id+'_div';
	$(".user_all_div").css("display","none");
	$(select_div).css("display","block");
	var select_a = '#a_'+user_id;
	$('.list-group-item').css("background-color","white");
	$('.list-group-item').css("color","black");
	$(select_a).css("background-color","rgb(52, 152, 219)");
	$(select_a).css("color","rgb(255, 255, 255)");
	
	scrollDown(user_id);
}

</script>

<!-- 웹 소켓 관련 스크립트 -->
<script type="text/javascript">

var wsocket;

function wsConnect(user_id){

	
	wsocket = new WebSocket("ws://localhost:8080/yeojeong/wsa")
	

    // client -> admin
	wsocket.onmessage = function(evt){
   		var data = evt.data;  		
   		var temp = data.split("|");
   		var sender_id = temp[0];
   		var sender_msg = temp[1];

   		$("#"+sender_id+"_messageWindow").html($("#"+sender_id+"_messageWindow").html()
                   + "<div class='alert alert-info' role='alert' style='clear:both;float:left;max-width:280px;word-break:break-all;'>" + sender_msg + "</div>");
   		
   		scrollDown(sender_id);
   	}
   	wsocket.onclose = function() {
   		wsocket.close();
   	}
   	wsocket.onopen = function(){
  		;
   	}
	
}

// admin -> client
function sendMessage(user_id){
	var inputVal = $("#"+user_id+"_inputMessage").val();
	if(inputVal == ""){
		;
	} else if( (inputVal.length > 5) && (inputVal.substring(0,5)=="/all ") ) {
		 $(".all_messageWindow").html($(".all_messageWindow").html()
	                + "<div class='alert alert-danger' role='alert' style='clear:both;float:right;max-width:280px;word-break:break-all;text-align:right;'>-전체메세지-<br>" + inputVal.substr(5) + "</div><br/>");
	}
	else {
        $("#"+user_id+"_messageWindow").html($("#"+user_id+"_messageWindow").html()
                + "<div class='alert alert-success' role='alert' style='clear:both;float:right;max-width:280px;word-break:break-all;text-align:right;'>" + inputVal + "</div><br/>");
	}
	wsocket.send(user_id+"|"+inputVal);
	$("#"+user_id+"_inputMessage").val("");
	
	scrollDown(user_id);
}

//     엔터키를 통해 send함
function enterkey(user_id) {
    if (window.event.keyCode == 13) {
        sendMessage(user_id);
    }
}

function scrollDown(user_id){
	$("#user_"+user_id+"_scrollDiv").scrollTop($("#user_"+user_id+"_scrollDiv").prop("scrollHeight"));
}
wsConnect('${chatMap.key.getId()}');
</script>




</body>
</html>