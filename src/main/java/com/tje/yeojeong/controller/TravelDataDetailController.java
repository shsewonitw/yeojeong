package com.tje.yeojeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TravelDataDetailController {

	@GetMapping("/traveldatad")
	public String CityDataDetail() {
		return "form/travelDataDetailForm";
	}
	
}
