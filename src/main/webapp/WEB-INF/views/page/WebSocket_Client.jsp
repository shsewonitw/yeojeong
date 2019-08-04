<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>

<title>Insert title here</title>

</head>
<body style="overflow:scroll;">
<div style="height:200px;"></div>

<h1> 웹소켓 테스트 페이지 </h1>
<body>
    <!--     채팅창 -->
    <div id="_chatbox">
    <button onclick="wsConnect();">연결</button><button onclick="wsClose();">종료</button>
        <fieldset>
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="sendMessage()" />
        </fieldset>
    </div>

<!-- 말풍선아이콘 클릭시 채팅창 열고 닫기 -->


<script type="text/javascript">


    
    
    var wsocket;
	
    function wsConnect() {
    	if(wsocket != null)
    		return;
    		
    	wsocket = new WebSocket("ws://localhost:8080/yeojeong/wsc");
    	wsocket.onmessage = function(evt){
    		var data = evt.data;
    		$("#messageWindow").html($("#messageWindow").html()
                    + "<p class='chat_content'>관리자 : " + data + "</p>");
    		
    	}
    	wsocket.onclose = function() {
    		$("#messageWindow").html($("#messageWindow").html()
                    + "<p class='chat_content'> 관리자와 연결이 종료 되었습니다. </p>");
    		
    	}
    	wsocket.onopen = function(){
    		$("#messageWindow").html($("#messageWindow").html()
                    + "<p class='chat_content'> 관리자와 연결되었습니다. </p>");
    	}
    }
    
    function wsClose(){
    	if(wsocket == null)
    		return;
    	wsocket.close();
    }
    
	function sendMessage(){
		if(inputMessage.value == ""){
			;
		} else {
            $("#messageWindow").html($("#messageWindow").html()
                    + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
		}
		wsocket.send(inputMessage.value);
		$("#inputMessage").val("");
	}

    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            sendMessage();
        }
    }
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
    
</script>
</body>
</html>