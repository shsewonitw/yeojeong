<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="overflow:scroll;">
<div style="height:200px;"></div>

<h1> 웹소켓 테스트 관리자페이지 </h1>

<body>
<div id="_chatbox">
	<button onclick="wsConnect();">연결</button><button onclick="wsClose();">종료</button>
	<fieldset>
	<c:forEach items="${chatMap}" var="chatMap">
		${chatMap.key.getId()}
		${chatMap.value}
	</c:forEach>
		<div id="messageWindow"></div>
		<br /><input id="inputMessage" type="text" onkeyup="enterkey()" />
		<input type="submit" value="send" onclick="sendMessage()" />
	</fieldset>
</div>

<script type="text/javascript">

var wsocket;

function wsConnect(){
	if(wsocket != null)
		return;
	
	wsocket = new WebSocket("ws://localhost:8080/yeojeong/wsa")
}
</script>

</body>
</html>