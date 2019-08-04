package com.tje.yeojeong.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.socket.WebSocketSession;

import com.tje.yeojeong.websocket.ChatInfo;


@Controller
public class WebSocketController {
	@Autowired
	ChatInfo chatInfo;
	
	@GetMapping("/wsClient")
	public String wsClient() {
		return "page/WebSocket_Client";
	}
	
	@GetMapping("/wsAdmin")
	public String wsServer(Model model) {
		for(WebSocketSession session : chatInfo.getChatMap().keySet()) {
			System.out.println(chatInfo.getChatMap().get(session));
		}
		
		model.addAttribute("chatMap",chatInfo.getChatMap());
		return "page/WebSocket_Admin";
	}
}