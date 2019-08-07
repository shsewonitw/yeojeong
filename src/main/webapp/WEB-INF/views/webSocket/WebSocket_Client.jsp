<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sw_bootstrap.css?wer=121">
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>

<title>Insert title here</title>

</head>
<body style="overflow:scroll;">

    <!--     채팅창 -->
    <div id="_chatbox">
	    <button class="btn btn-default" onclick="wsConnect();">연결</button><button class="btn btn-default" onclick="wsClose();">종료</button>
	    <div id="scrollDiv" style="overflow:auto;width:500px;height:326px;">
			<fieldset>
				<div id="messageWindow"></div>
			</fieldset>
		</div>
		<div style="overflow:hidden;">
		 	<input id="inputMessage" class="form-control" type="text" onkeyup="enterkey()" style="float:left;width:450px;"/><input type="submit" class="btn btn-default" value="전송" onclick="sendMessage()" style="float:left;" />
		</div>
    </div>



<script type="text/javascript">


    
    
    var wsocket;
	
    function wsConnect() {
    
    	if(wsocket != null){
    		
    		return;
    		
    	}
    		
    	wsocket = new WebSocket("ws://192.168.0.30:8080/yeojeong/wsc");
    	wsocket.onmessage = function(evt){
    		var data = evt.data;
    		if( data.length > 5 && data.substring(0,5)=="/all ") {
    			$("#messageWindow").html($("#messageWindow").html()
                        + "<div class='alert alert-danger' role='alert' style='clear:both;float:left;max-width:280px;word-break:break-all;'>-전체메세지-<br>" + data.substr(5) + "</div>");
    		}
    		else {
    		$("#messageWindow").html($("#messageWindow").html()
                    + "<div class='alert alert-info' role='alert' style='clear:both;float:left;max-width:280px;word-break:break-all;'>" + data + "</div>");
    		}
    		scrollDown();
    		
    	}
    	wsocket.onclose = function() {
    		$("#messageWindow").html($("#messageWindow").html()
                    + "<div class='alert alert-info' role='alert' style='clear:both;float:left;max-width:280px;word-break:break-all;'>관리자와 연결이 종료 되었습니다. </div>");
    		wsocket = null;
    		scrollDown();
    		
    	}
    	wsocket.onopen = function(){
    		$("#messageWindow").html($("#messageWindow").html()
                    + "<div class='alert alert-info' role='alert' style='clear:both;float:left;max-width:280px;word-break:break-all;'>관리자에게 메세지를 보내주세요. 이 페이지를 나가거나 연결을 종료하면 대화내용은 저장되지 않습니다. </div>");
    		scrollDown();
    	}
    }
    
    function wsClose(){
    	if(wsocket == null)
    		return;
    	wsocket.close();
    }
    
    // client -> admin
	function sendMessage(){
		if(inputMessage.value == ""){
			;
		} else {
            $("#messageWindow").html($("#messageWindow").html()
                    + "<div class='alert alert-success' role='alert' style='clear:both;float:right;max-width:280px;word-break:break-all;text-align:right;'>" + inputMessage.value + "</div>");
            scrollDown();
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

    function scrollDown(){
    	$("#scrollDiv").scrollTop($("#scrollDiv").prop("scrollHeight"));
    }
</script>
</body>
</html>