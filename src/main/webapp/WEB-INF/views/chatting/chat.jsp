<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/sockjs.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#sendBtn").click(function() {
			sendMessage();
		});
	});
	
	var socket;
	socket = new SockJS("ws://192.168.0.30:8080/yeojeong/chat");
	
	socket.onmessage = onMessage;
	socket.onClose = onClose;
	
	function sendMessage(evt) {
		socket.send($("#message").val());
	}
	
	function onMessage(evt) {
		 var data = evt.data;
	     $("#data").append(data + "<br/>");		
	}
	
	function onClose(evt) {
		$("#data").append("연결 끊김");
	}
</script>
<meta charset="UTF-8">
<title>관리자 채팅</title>
</head>
<body>
	<div style="height:200px;"></div>
	
	<input type="text" id="message" />

    <input type="button" id="sendBtn" value="전송" />

    <div id="data"></div>

</body>
</html>