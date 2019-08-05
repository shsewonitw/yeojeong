package com.tje.yeojeong.websocket;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	// 연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info(session.getId(), "님이 연결됨");
	}
	
	// 사용자가 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info(session.getId(),message.getPayload());
			for(WebSocketSession sess : sessionList){
				sess.sendMessage(new TextMessage(session.getId() +" : "+ message.getPayload()));
        }
	}
	
	// 사용자 아웃
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {		
		sessionList.remove(session);
		logger.info(session.getId(), "님이 나감");
				
	}
}
