package com.tje.yeojeong.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.City_DataSelectCityService;
import com.tje.yeojeong.service.City_DataSelectCountryService;
import com.tje.yeojeong.service.MemberLoginService;
import com.tje.yeojeong.service.MemberSearchService;

@Controller
public class AdminController {
	@Autowired
	private MemberLoginService mlService;
	@Autowired
	private MemberSearchService msService;
	@Autowired
	private City_DataSelectCountryService cdsCountryService;
	@Autowired
	private City_DataSelectCityService cdsCityService;
	
	@Controller
	public class TravelRegistController {
		// 관리자 로그인 페이지 호출
		@GetMapping("/admin")
		public String adminLoginForm(HttpSession session) {
			Member member = (Member)session.getAttribute("login_admin");
			if(member != null) {
				return "admin/adminMain";
			}
			return "admin/adminLoginForm";
		}
		
		// 관리자 로그인
		@PostMapping("/admin")
		public String adminLoginSubmit(HttpServletRequest request) {
			String member_id = request.getParameter("member_id");
			String password = request.getParameter("password");
			
			Member member = new Member();
			member.setMember_id(member_id);
			member.setPassword(password);
			
			boolean flag_login = (boolean)mlService.service(member);
			boolean flag_level = ((Member)msService.service(member)).getLevel() == 2;
			
			if(flag_login && flag_level) {
				// 관리자 로그인 성공
				HttpSession session = request.getSession();
				session.setAttribute("login_admin", member);
				return "admin/adminMain";
			}
			else {
				// 관리자 로그인 실패
				return "admin/adminError";
			}
		}
		
		// 관리자 로그아웃
		@GetMapping("/adminLogout")
		public String adminLogoutForm(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			session.removeAttribute("login_admin");
			
			return "admin/adminLoginForm";
		}
		
		// 여행지 업데이트 
		@GetMapping("/adminCityData")
		public String adminCityDataForm(Model model,HttpSession session) {
			// 어드민으로 로그인 되있는지 확인
			Member member = (Member)session.getAttribute("login_admin");
			if(member == null) {
				return "admin/adminLoginForm";
			}
			
			// DB에 저장된 Country 리스트
			List<String> countryList = (List<String>)cdsCountryService.service();
			model.addAttribute("countryList",countryList);
			HashMap<String,List<String>> map = new HashMap<String, List<String>>();
			for(String country : countryList) {
				City_Data city_data = new City_Data();
				city_data.setCountry(country);
				List<String> cityList = (List<String>)cdsCityService.service(city_data);
				map.put(country, cityList);
			}
			model.addAttribute("map",map);
			return "admin/adminCityDataForm";
		}
		
		@GetMapping("/adminCityDataUpdate")
		public String adminCityDataUpdateForm(Model model,HttpSession session) {
			// 어드민으로 로그인 되있는지 확인
			Member member = (Member)session.getAttribute("login_admin");
			if(member == null) {
				return "admin/adminLoginForm";
			}
			
			
			return "admin/adminCityDataUpdateForm";
		}
		
		@GetMapping("/adminCityDataInsert")
		public String adminCityDataInsertForm(Model model,HttpSession session) {
			// 어드민으로 로그인 되있는지 확인
			Member member = (Member)session.getAttribute("login_admin");
			if(member == null) {
				return "admin/adminLoginForm";
			}
			
			
			return "admin/adminCityDataInsertForm";
		}
	}
}
