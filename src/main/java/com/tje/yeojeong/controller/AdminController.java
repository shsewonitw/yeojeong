package com.tje.yeojeong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.City_DataInsertService;
import com.tje.yeojeong.service.City_DataSelectCityService;
import com.tje.yeojeong.service.City_DataSelectCountryService;
import com.tje.yeojeong.service.MemberLoginService;
import com.tje.yeojeong.service.MemberSearchIDService;

@Controller
public class AdminController {
	@Autowired
	private MemberLoginService mlService;
	@Autowired
	private MemberSearchIDService msService;
	@Autowired
	private City_DataSelectCountryService cdsCountryService;
	@Autowired
	private City_DataSelectCityService cdsCityService;
	@Autowired
	private City_DataInsertService cdiService;
	
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
			
			/*
			 * <!-- city_code(int), country(string), city(string), local_time(string), flight_time(string), 
			 * 	local_voltage(string), visa(string), latitude(string), logitude(string), danger_level(int) -->
			 	city_code int auto_increment primary key,
				country varchar(20) not null,
			    city varchar(20) not null,
			    local_time timestamp not null,
			    flight_time varchar(20) not null,
			    local_voltage varchar(20) not null,
			    visa varchar(20) not null,
			    latitude varchar(20) not null,
			    logitude varchar(20) not null,
			    danger_level int not null
			 */
		}
		
		@PostMapping("/adminCityDataInsert")
		public String adminCityDataInsertSubmit(HttpSession session,HttpServletRequest request) {
			// 어드민으로 로그인 되있는지 확인
			Member member = (Member)session.getAttribute("login_admin");
			if(member == null) {
				return "admin/adminLoginForm";
			}
			
			int city_code = 0;
			String country = request.getParameter("country");
			String city = request.getParameter("city");
			String local_time = request.getParameter("local_time");
			String flight_time = request.getParameter("flight_time");
			String local_voltage = request.getParameter("local_voltage");
			String visa = request.getParameter("visa");
			String strDanger_level = request.getParameter("danger_level");
			String image_src = request.getParameter("image_src");
			
			// 위도 경도 가져오는 코드
			String position = request.getParameter("position");
			position = position.substring(1,position.length()-1);
			String latitude = null;
			String longitude = null;
			StringTokenizer st = new StringTokenizer(position, ", ");
			if(st.hasMoreTokens()) {
				latitude = st.nextToken();
				longitude = st.nextToken();
			}
			
			int danger_level=0;
			try{
				danger_level = Integer.parseInt(strDanger_level);
			} catch(Exception e) {
				System.out.println("위험지역레벨 인트값 안들어옴");
			}
			City_Data model = new City_Data(city_code,country,city,local_time,flight_time,local_voltage,visa,latitude,longitude,danger_level,image_src);
			
			cdiService.service(model);
			
			return "admin/adminCityDataInsertForm";
			
		
		}
	}
}
