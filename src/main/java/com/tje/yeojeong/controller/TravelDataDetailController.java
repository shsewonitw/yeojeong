package com.tje.yeojeong.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TravelDataDetailController {

	@GetMapping("/traveldatad")
	public String CityDataDetail(HttpServletRequest request) {
		String city =request.getParameter("city");
		return "form/travelDataDetailForm";
	}
		
}
