package com.tje.yeojeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	
	@GetMapping("/review")
	public String reviewForm(){
		
		return "form/ReviewForm";
	}
}
