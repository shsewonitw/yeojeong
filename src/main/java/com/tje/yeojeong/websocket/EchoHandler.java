package com.tje.yeojeong.websocket;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		
		logger.info(session.getId() + "님이 접속하였습니다.");		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info(session.getId() + "님의 메세지 : ", message.getPayload());
		
		for(WebSocketSession sess : sessionList){				
			sess.sendMessage(new TextMessage(session.getPrincipal().getName() + message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		logger.info(session.getId() + "님이 나가셨습니다.");
		System.out.printf("%s 연결종료\n", session.getId());		
	}
}
