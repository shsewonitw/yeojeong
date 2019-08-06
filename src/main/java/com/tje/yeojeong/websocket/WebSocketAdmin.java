package com.tje.yeojeong.websocket;

import java.util.Hashtable;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


@Controller
public class WebSocketAdmin extends TextWebSocketHandler {
	@Autowired
	ChatInfo chatInfo;
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 클라이언트가 연결되면 세션 아이디의 값을 출력
		System.out.printf("%s(관리자)가 연결됨\n", session.getId());
		chatInfo.getAdmin().put("admin", session);
	}
	

	
	// 웹 소켓 클라이언트가 서버측으로 데이터를 전송할 때
		// 실행되는 메소드
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
			String adminMsg = message.getPayload();
			StringTokenizer st = new StringTokenizer(adminMsg,"|");
			String clientId = null;
			String realMsg = null;
			if(st.hasMoreTokens()) {
				clientId = st.nextToken();
				realMsg = st.nextToken();
			}

			
			for(WebSocketSession sess : chatInfo.getChatMap().keySet()) {
				if( sess.getId().equals(clientId) ) {
					sess.sendMessage(new TextMessage(realMsg));
					

					String beforeMsg = chatInfo.getChatMap().get(sess);
					String msg = beforeMsg + "<div class='alert alert-success' role='alert' style='clear:both;float:right;max-width:280px;word-break:break-all;text-align:right;'>"+realMsg+"</div>";
					chatInfo.getChatMap().put(sess,msg);
				}
			}
			
			

		}
		
		@Override
		public void afterConnectionClosed(
				WebSocketSession session, CloseStatus status) throws Exception {
			System.out.printf("%s(관리자)가 연결종료됨\n",session.getId());
			chatInfo.getAdmin().remove("admin");
		}
		
}
