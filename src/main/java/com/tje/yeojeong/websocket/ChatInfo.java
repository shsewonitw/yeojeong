package com.tje.yeojeong.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;
import org.springframework.web.socket.WebSocketSession;

@ApplicationScope
@Component
public class ChatInfo {
	HashMap<WebSocketSession, String> chatMap = new HashMap<WebSocketSession, String>();

	HashMap<String,WebSocketSession> admin = new HashMap<String, WebSocketSession>();
	
	public ChatInfo() {
	}

	public HashMap<WebSocketSession, String> getChatMap() {
		return chatMap;
	}

	public HashMap<String, WebSocketSession> getAdmin() {
		return admin;
	}

	
	
}
