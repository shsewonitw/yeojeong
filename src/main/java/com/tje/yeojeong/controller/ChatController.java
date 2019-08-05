package com.tje.yeojeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {
	
	@GetMapping("/chat")
	public String AdminChat() {
		return "chatting/chat";
	}
}
