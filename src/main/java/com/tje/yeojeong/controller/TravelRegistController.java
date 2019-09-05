package com.tje.yeojeong.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
import com.google.gson.JsonArray;
import com.tje.yeojeong.model.City_Data;
import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.model.Travel_regist;
import com.tje.yeojeong.service.City_DataSelectCityService;
import com.tje.yeojeong.service.City_DataSelectCountryService;
import com.tje.yeojeong.service.TravelRegistInsertService;

@Controller
public class TravelRegistController {
	
	@Autowired
	private TravelRegistInsertService triService;
	@Autowired
	private City_DataSelectCountryService cdsCountryService;
	@Autowired
	private City_DataSelectCityService cdsCityService;
	
	
	@GetMapping("/auth/travelRegist")
	public String travelRegistForm(Model model) {
		
		// DB에 저장된 Country 리스트
		List<String> countryList = (List<String>) cdsCountryService.service();
		model.addAttribute("countryList", countryList);
		
		return "form/travelRegist";
	}
	
	
	
	
	@PostMapping("/auth/travelRegist")
	public String travelRegistSubmit(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member login_member = (Member)session.getAttribute("login_member");
		
		if(login_member == null) {
			return "error/needLogin";
		}
		
		String member_id = login_member.getMember_id();
		String help_tel = request.getParameter("help_tel");
		
		String strStart_date = request.getParameter("start_date");
		String strEnd_date = request.getParameter("end_date");
		// String 으로 받아온 날짜값 Date로 변환
		Date start_date = null;
		Date end_date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			start_date = sdf.parse(strStart_date);
			end_date = sdf.parse(strEnd_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		
		System.out.println("나라: "+country);
		System.out.println("도시: "+city);
		
		Travel_regist travel_regist = new Travel_regist(0,member_id,help_tel,start_date,end_date,country,city);
		
		// DB에 여행일정 등록
		boolean flag = (boolean)triService.service(travel_regist);
		
		
		
		if(flag) {
			// 여행등록성공
			return "form/travelRegistSubmit";
		}
		else {
			// 여행등록실패
			return "error/travelRegistError";
		}
		

	}
	
	@RequestMapping(value="/cityAjax",method=RequestMethod.POST,produces="application/jason;charset=utf8")
	@ResponseBody
	public String cityAjax(@RequestParam(value = "country") String country) {
		System.out.println(country);
		City_Data city_data = new City_Data();
		city_data.setCountry(country);
		
		List<City_Data> city_data_list = (List<City_Data>)cdsCityService.service(city_data);
		Gson gson = new Gson();
		String jsonPlace = gson.toJson(city_data_list);
		System.out.println(jsonPlace);
		return jsonPlace;
	}
	
	
}
