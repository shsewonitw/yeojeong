package com.tje.yeojeong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tje.yeojeong.model.City_Data;
import com.tje.yeojeong.service.City_DataSelectAllService;

@Controller
public class TravelDataController {

	@Autowired
	private City_DataSelectAllService cdsaService;
	
	@GetMapping("/traveldata")
	public String CityData(Model model) {
		
		List<City_Data> city_data_list = (List<City_Data>)cdsaService.service();
		
		model.addAttribute("city_data_list",city_data_list);
		
		return "form/travelDataForm";
	}
	
}
