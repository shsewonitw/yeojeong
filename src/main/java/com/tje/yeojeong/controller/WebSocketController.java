package com.tje.yeojeong.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.tje.yeojeong.model.Member;

@Controller
public class WebSocketController {
	
	@GetMapping("/wsClient")
	public String wsClient() {
		return "page/WebSocket_Client";
	}
	
	@GetMapping("/wsServer")
	public String wsServer() {
		return "page/WebSocket_Server";
	}
}
