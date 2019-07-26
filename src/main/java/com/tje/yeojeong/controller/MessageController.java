package com.tje.yeojeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MessageController {
	
	@GetMapping("/receive")
	public String receiveForm(){
		
		return "form/receiveForm";
	}
	
	@GetMapping("/receivecontent")
	public String receiveMessage(){
		
		return "form/receiveMessage";
	}
}
