package com.tje.yeojeong.appcontroller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tje.yeojeong.model.City_Data;
import com.tje.yeojeong.service.City_DataSelectAllService;
import com.tje.yeojeong.service.City_DataSelectOneService;

@Controller
public class Android_TravelDataController {

	@Autowired
	private City_DataSelectAllService cdsaService;
	@Autowired
	private City_DataSelectOneService cdsoService;
	
	
	Gson gson = new Gson();
	
	@GetMapping(value="/android_traveldata",produces="application/json; charset=utf8")
	@ResponseBody
	public String CityData(Model model, HttpServletRequest request) {
		
		List<City_Data> city_data_list = (List<City_Data>)cdsaService.service();
		
		String json_city_data_list = gson.toJson(city_data_list);
		System.out.println(request.getContextPath());
		
		return json_city_data_list;
	}
	
	
	@GetMapping(value="/android_traveldatad", produces="application/json; charset=utf8")
	@ResponseBody
	public String CityDataDetail(HttpServletRequest request) {
		String city =request.getParameter("city");
		
		City_Data model = new City_Data();
		model.setCity(city);
		City_Data city_data =  (City_Data)cdsoService.service(model);
		request.setAttribute("city_data", city_data);
		return "form/travelDataDetailForm";
	}
	

}
