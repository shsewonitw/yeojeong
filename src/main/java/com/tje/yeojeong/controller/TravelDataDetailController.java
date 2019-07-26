package com.tje.yeojeong.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.tje.yeojeong.model.City_Data;
import com.tje.yeojeong.service.City_DataSelectOneService;

@Controller
public class TravelDataDetailController {

	@Autowired
	private City_DataSelectOneService cdsoService;
	
	@GetMapping("/traveldatad")
	public String CityDataDetail(HttpServletRequest request) {
		String city =request.getParameter("city");
		
		City_Data model = new City_Data();
		model.setCity(city);
		
		City_Data city_data =  (City_Data)cdsoService.service(model);
		request.setAttribute("city_data", city_data);
		return "form/travelDataDetailForm";
	}
		
}
