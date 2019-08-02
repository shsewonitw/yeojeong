package com.tje.yeojeong.controller;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoController extends TextWebSocketHandler{

	// 웹 소켓 클라이언트가 서버로 연결될 때,
		// 각 클라이언트마다 한번만 실행되는 메소드
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			// 클라이언트가 연결되면 세션 아이디의 값을 출력
			System.out.printf("%s가 연결됨\n",session.getId());
		}
		
		// 웹 소켓 클라이언트가 서버측으로 데이터를 전송할 때 실행되는 메소드
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			System.out.printf("%s로부터 [%s]를 받음\n",session.getId(), message.getPayload());
			
			// 세션을 사용하여 클라이언트에게 텍스트 메세지를 전송
			session.sendMessage(new TextMessage("echo : " + message.getPayload()));
		}
		
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			System.out.printf("%s가 연결종료됨\n",session.getId());
		}
}
