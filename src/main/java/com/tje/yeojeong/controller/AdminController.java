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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.City_DataInsertService;
import com.tje.yeojeong.service.City_DataSelectCityService;
import com.tje.yeojeong.service.City_DataSelectCountryService;
import com.tje.yeojeong.service.City_DataSelectOneService;
import com.tje.yeojeong.service.City_DataUpdateService;
import com.tje.yeojeong.service.MemberLoginService;
import com.tje.yeojeong.service.MemberSearchIDService;
import com.tje.yeojeong.setting.UtilFile;

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
	@Autowired
	private City_DataSelectOneService cdsoService;
	@Autowired
	private City_DataUpdateService cduService;
	
	// 관리자 로그인 페이지 호출
	@GetMapping("/admin")
	public String adminLoginForm(HttpSession session) {
		Member member = (Member) session.getAttribute("login_admin");
		if (member != null) {
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

		boolean flag_login = (boolean) mlService.service(member);
		boolean flag_level = ((Member) msService.service(member)).getLevel() == 2;

		if (flag_login && flag_level) {
			// 관리자 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("login_admin", member);
			return "admin/adminMain";
		} else {
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
	public String adminCityDataForm(Model model, HttpSession session) {
		// 어드민으로 로그인 되있는지 확인
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
			return "admin/adminLoginForm";
		}

		// DB에 저장된 Country 리스트
		CountryList(model);

		return "admin/adminCityDataForm";
	}

	@GetMapping("/adminCityDataUpdate")
	public String adminCityDataUpdateForm(Model model, HttpSession session, HttpServletRequest request) {
		// 어드민으로 로그인 되있는지 확인
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
			return "admin/adminLoginForm";
		}
		
		// DB에 저장된 Country 리스트
		CountryList(model);

		String city = request.getParameter("city");
		City_Data city_data = new City_Data();
		city_data.setCity(city);
		city_data = (City_Data)cdsoService.service(city_data);
		model.addAttribute("city_data",city_data);
		
		return "admin/adminCityDataUpdateForm";
	}

	
	@PostMapping("/adminCityDataUpdate")
	public String adminCityDataUpdateSubmit(@RequestParam("image_src") MultipartFile uploadFile1,
			@RequestParam("image_src2") MultipartFile uploadFile2,@RequestParam("image_src3") MultipartFile uploadFile3, MultipartHttpServletRequest mpRequest,
			HttpSession session, HttpServletRequest request, Model model) {
		// 어드민으로 로그인 되있는지 확인
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
			return "admin/adminLoginForm";
		}

		
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		String local_time = request.getParameter("local_time");
		String flight_time = request.getParameter("flight_time");
		String local_voltage = request.getParameter("local_voltage");
		String visa = request.getParameter("visa");
		String strDanger_level = request.getParameter("danger_level");
		String strCity_code = request.getParameter("city_code");
		// 위도 경도 가져오는 코드
		String position = request.getParameter("position");
		position = position.substring(1, position.length() - 1);
		String latitude = null;
		String longitude = null;
		StringTokenizer st = new StringTokenizer(position, ", ");
		if (st.hasMoreTokens()) {
			latitude = st.nextToken();
			longitude = st.nextToken();
		}

		int danger_level = 0;
		int city_code = 0;
		try {
			danger_level = Integer.parseInt(strDanger_level);
			city_code = Integer.parseInt(strCity_code);
		} catch (Exception e) {
			System.out.println("parseInt 에러");
		}
		UtilFile utilFile = new UtilFile();
		String image_src = utilFile.fileUpload(mpRequest, uploadFile1);
		String image_src2 = utilFile.fileUpload(mpRequest, uploadFile2);
		String image_src3 = utilFile.fileUpload(mpRequest, uploadFile2);
		
		// 사용자가 이미지는 업로드 안했을 경우 원래 이미지로 대체
		if(image_src.length()<=14) {
			image_src = request.getParameter("image_src_hidden");
		}
		if(image_src2.length()<=14) {
			image_src2 = request.getParameter("image_src2_hidden");
		}
		if(image_src3.length()<=14) {
			image_src3 = request.getParameter("image_src3_hidden");
		}
		
		System.out.println("으아아아아아악~~!~!~!~!~!:" +image_src.length());
		City_Data city_data = new City_Data(city_code, country, city, local_time, flight_time, local_voltage, visa,
				latitude, longitude, danger_level, image_src, image_src2, image_src3);
		cduService.service(city_data);

		// DB에 저장된 Country 리스트
		CountryList(model);

		return "admin/adminCityDataUpdateForm";

	}
	
	@GetMapping("/adminCityDataInsert")
	public String adminCityDataInsertForm(Model model, HttpSession session) {
		// 어드민으로 로그인 되있는지 확인
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
			return "admin/adminLoginForm";
		}

		// DB에 저장된 Country 리스트
		CountryList(model);

		return "admin/adminCityDataInsertForm";
	}

	@PostMapping("/adminCityDataInsert")
	public String adminCityDataInsertSubmit(@RequestParam("image_src") MultipartFile uploadFile1,
			@RequestParam("image_src2") MultipartFile uploadFile2, @RequestParam("image_src3") MultipartFile uploadFile3,  MultipartHttpServletRequest mpRequest,
			HttpSession session, HttpServletRequest request, Model model) {
		// 어드민으로 로그인 되있는지 확인
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
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

		// 위도 경도 가져오는 코드
		String position = request.getParameter("position");
		position = position.substring(1, position.length() - 1);
		String latitude = null;
		String longitude = null;
		StringTokenizer st = new StringTokenizer(position, ", ");
		if (st.hasMoreTokens()) {
			latitude = st.nextToken();
			longitude = st.nextToken();
		}

		int danger_level = 0;
		try {
			danger_level = Integer.parseInt(strDanger_level);
		} catch (Exception e) {
			System.out.println("위험지역레벨 인트값 안들어옴");
		}
		UtilFile utilFile = new UtilFile();
		String image_src = utilFile.fileUpload(mpRequest, uploadFile1);
		String image_src2 = utilFile.fileUpload(mpRequest, uploadFile2);
		String image_src3 = utilFile.fileUpload(mpRequest, uploadFile3);

		City_Data city_data = new City_Data(city_code, country, city, local_time, flight_time, local_voltage, visa,
				latitude, longitude, danger_level, image_src, image_src2, image_src3);

		if( (City_Data)cdsoService.service(city_data) == null ) {
			cdiService.service(city_data);
		}
		else {
			return "admin/errorPage";
		}
		// DB에 저장된 Country 리스트
		CountryList(model);

		return "admin/adminCityDataInsertForm";

	}

	private void CountryList(Model model) {
		// DB에 저장된 Country 리스트
		List<String> countryList = (List<String>) cdsCountryService.service();
		model.addAttribute("countryList", countryList);
		HashMap<String, List<String>> map = new HashMap<String, List<String>>();
		for (String country : countryList) {
			City_Data city_data = new City_Data();
			city_data.setCountry(country);
			List<String> cityList = (List<String>) cdsCityService.service(city_data);
			map.put(country, cityList);
		}
		model.addAttribute("map", map);
	}
}
