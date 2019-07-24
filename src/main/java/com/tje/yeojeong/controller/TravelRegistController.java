package com.tje.yeojeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.tje.yeojeong.model.Member;

@Controller
public class TravelRegistController {
	
	@GetMapping("/travelRegist")
	public String travelRegist() {
		
		return "form/travelRegist";
	}
}
