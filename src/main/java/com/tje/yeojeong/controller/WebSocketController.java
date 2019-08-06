package com.tje.yeojeong.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.socket.WebSocketSession;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.websocket.ChatInfo;


@Controller
public class WebSocketController {
	@Autowired
	ChatInfo chatInfo;
	
	@GetMapping("/wsClient")
	public String wsClient() {
		return "webSocket/WebSocket_Client";
	}
	
	@GetMapping("/wsAdmin")
	public String wsServer(Model model,HttpSession session) {
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
			return "admin/adminLoginForm";
		}
		
		model.addAttribute("chatMap",chatInfo.getChatMap());
		return "admin/WebSocket_Admin";
	}
}