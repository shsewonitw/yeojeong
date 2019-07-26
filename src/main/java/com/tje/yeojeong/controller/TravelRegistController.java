package com.tje.yeojeong.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.model.Travel_regist;
import com.tje.yeojeong.service.TravelRegistInsertService;

@Controller
public class TravelRegistController {
	
	@Autowired
	private TravelRegistInsertService triService;
	
	@GetMapping("/travelRegist")
	public String travelRegistForm() {

		return "form/travelRegist";
	}
	

	

	@PostMapping("/travelRegist")
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
}
