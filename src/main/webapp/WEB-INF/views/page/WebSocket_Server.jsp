<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="overflow:scroll;">
<div style="height:200px;"></div>

<h1> 웹소켓 테스트 페이지 </h1>
<body>
    <!--     채팅창 -->
    <div id="_chatbox" style="display: none">
        <fieldset>
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="send()" />
        </fieldset>
    </div>
    <img class="chat" src="<%=request.getContextPath()%>/resources/images/logo_modify.png" />
</body>
<!-- 말풍선아이콘 클릭시 채팅창 열고 닫기 -->
<script>
    $(".chat").on({
        "click" : function() {
            if ($(this).attr("src") == "<%=request.getContextPath()%>/resources/images/logo_modify.png") {
                $(".chat").attr("src", "<%=request.getContextPath()%>/resources/images/next_btn.png");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "<%=request.getContextPath()%>/resources/images/next_btn.png") {
                $(".chat").attr("src", "<%=request.getContextPath()%>/resources/images/logo_modify.png");
                $("#_chatbox").css("display", "none");
            }
        }
    });
</script>
<script type="text/javascript">
    
    function send() {
        if (inputMessage.value == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
        }
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";
    }
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
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