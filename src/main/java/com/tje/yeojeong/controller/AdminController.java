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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.City_DataCountService;
import com.tje.yeojeong.service.City_DataDeleteService;
import com.tje.yeojeong.service.City_DataInsertService;
import com.tje.yeojeong.service.City_DataSelectCityService;
import com.tje.yeojeong.service.City_DataSelectCountryService;
import com.tje.yeojeong.service.City_DataSelectOneService;
import com.tje.yeojeong.service.City_DataUpdateService;
import com.tje.yeojeong.service.MemberAllService;
import com.tje.yeojeong.service.MemberAllWithPagingService;
import com.tje.yeojeong.service.MemberCountService;
import com.tje.yeojeong.service.MemberLoginService;
import com.tje.yeojeong.service.MemberSearchCountService;
import com.tje.yeojeong.service.MemberSearchIDService;
import com.tje.yeojeong.service.MemberSearchWithPagingService;
import com.tje.yeojeong.service.MemberUpdateByAdminService;
import com.tje.yeojeong.service.Review_viewCountService;
import com.tje.yeojeong.service.TravelRegistCountService;
import com.tje.yeojeong.service.Withme_viewCountService;
import com.tje.yeojeong.service.Withme_requestCountService;
import com.tje.yeojeong.setting.AdminLoginData;
import com.tje.yeojeong.setting.PagingInfo;
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
	@Autowired
	private City_DataDeleteService cddService;
	@Autowired
	private PagingInfo pagingInfo;
	@Autowired
	private MemberAllWithPagingService mawpService;
	@Autowired
	private MemberCountService mcService;
	@Autowired
	private MemberSearchWithPagingService mswpService;
	@Autowired
	private MemberSearchCountService mscService;
	@Autowired
	private MemberUpdateByAdminService mubaService;
	@Autowired
	private TravelRegistCountService trcService;
	@Autowired
	private City_DataCountService cdcService;
	@Autowired
	private Withme_requestCountService wmrcService;
	@Autowired
	private Withme_viewCountService wmvcService;
	@Autowired
	private Review_viewCountService rvcService;
	@Autowired
	private AdminLoginData adminLoginData;
	// 관리자 로그인 페이지 호출
	@GetMapping("/admin")
	public String adminLoginForm(HttpSession session,HttpServletRequest request) {
		Member member = (Member) session.getAttribute("login_admin");
		if (member != null) {
			
			// 여정 통계자료 
			HashMap<String, Object> result = (HashMap<String, Object>)mcService.service();
			int member_total_count = (int)result.get("totalCount");
			int travel_regist_count = (int)trcService.service();
			int city_data_count = (int)cdcService.service();
			int withme_request_count = (int)wmrcService.service();
			int withme_view_count = (int)wmvcService.service();
			int review_view_count = (int)rvcService.service();
			request.setAttribute("member_total_count", member_total_count);
			request.setAttribute("travel_regist_count", travel_regist_count);
			request.setAttribute("city_data_count", city_data_count);
			request.setAttribute("withme_request_count", withme_request_count);
			request.setAttribute("withme_view_count", withme_view_count);
			request.setAttribute("review_view_count", review_view_count);
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
		boolean flag_level = ( msService.service(member) != null ) && ((Member) msService.service(member)).getLevel() == 2;

		if (flag_login && flag_level) {
			
			// 로그인 시도한 어드민 아이디가 이미 접속중
			if( (adminLoginData.getMap().get("login_admin") != null ) && adminLoginData.getMap().get("login_admin").getMember_id().equals(member.getMember_id())) {
				System.out.println("로그인 시도한 어드민 아이디가 이미 접속중");
				return "admin/adminError2";
			}
			
			// 관리자 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("login_admin", member);
			adminLoginData.getMap().put("login_admin", member);
			
			// 여정 통계자료 
			HashMap<String, Object> result = (HashMap<String, Object>)mcService.service();
			int member_total_count = (int)result.get("totalCount");
			int travel_regist_count = (int)trcService.service();
			int city_data_count = (int)cdcService.service();
			int withme_request_count = (int)wmrcService.service();
			int withme_view_count = (int)wmvcService.service();
			int review_view_count = (int)rvcService.service();
			request.setAttribute("member_total_count", member_total_count);
			request.setAttribute("travel_regist_count", travel_regist_count);
			request.setAttribute("city_data_count", city_data_count);
			request.setAttribute("withme_request_count", withme_request_count);
			request.setAttribute("withme_view_count", withme_view_count);
			request.setAttribute("review_view_count", review_view_count);
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
		adminLoginData.getMap().remove("login_admin");
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
		city_data = (City_Data) cdsoService.service(city_data);
		model.addAttribute("city_data", city_data);

		return "admin/adminCityDataUpdateForm";
	}

	@PostMapping("/adminCityDataUpdate")
	public String adminCityDataUpdateSubmit(@RequestParam("image_src") MultipartFile uploadFile1,
			@RequestParam("image_src2") MultipartFile uploadFile2,
			@RequestParam("image_src3") MultipartFile uploadFile3, MultipartHttpServletRequest mpRequest,
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
		
		if (image_src.length() <= 14) {
			image_src = request.getParameter("image_src_hidden");
		}
		if (image_src2.length() <= 14) {
			image_src2 = request.getParameter("image_src2_hidden");
		}
		if (image_src3.length() <= 14) {
			image_src3 = request.getParameter("image_src3_hidden");
		}

		System.out.println("으아아아아아악~~!~!~!~!~!:" + image_src.length());
		City_Data city_data = new City_Data(city_code, country, city, local_time, flight_time, local_voltage, visa,
				latitude, longitude, danger_level, image_src, image_src2, image_src3);
		cduService.service(city_data);

		// DB에 저장된 Country 리스트
		CountryList(model);
		
		request.setAttribute("adminCityDataResult", "updateOk");
		return "admin/adminCityDataForm";

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
			@RequestParam("image_src2") MultipartFile uploadFile2,
			@RequestParam("image_src3") MultipartFile uploadFile3, MultipartHttpServletRequest mpRequest,
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

		if ((City_Data) cdsoService.service(city_data) == null) {
			cdiService.service(city_data);
		} else {
			return "admin/errorPage";
		}
		// DB에 저장된 Country 리스트
		CountryList(model);

		
		request.setAttribute("adminCityDataResult", "insertOk");
		return "admin/adminCityDataForm";

	}

	@GetMapping("/adminCityDataDelete")
	public String adminCityDataDeleteForm(Model model, HttpSession session, HttpServletRequest request) {
		// 어드민으로 로그인 되있는지 확인
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
			return "admin/adminLoginForm";
		}
		String strCity_code = request.getParameter("city_code");
		int city_code = Integer.parseInt(strCity_code);
		City_Data city_data = new City_Data();
		city_data.setCity_code(city_code);
		cddService.service(city_data);

		// DB에 저장된 Country 리스트
		CountryList(model);

		request.setAttribute("adminCityDataResult", "deleteOk");
		return "admin/adminCityDataForm";
	}

	
	// 멤버관리 with 페이징
	///////////////////////////////////////////////////////////////////////////////////////
	private String adminMemberManageForm(
			Integer page, Model model, HttpSession session) {
		
		// 어드민으로 로그인 되있는지 확인
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
			return "admin/adminLoginForm";
		}
		
		
		HashMap<String, Object> args = 
				new HashMap<String, Object>();		
		
		args.put("curPageNo", page);		
	
		
		model.addAttribute("member_list", mawpService.service(args));
		
		HashMap<String, Integer> result = 
			(HashMap<String, Integer>)mcService.service();
		model.addAttribute(
				"member_count", result.get("totalCount"));
		
		int totalPageCount = (int)result.get("totalPageCount");
		// 시작페이지와 종료페이지 처리
		// 현재 페이지가 3인경우 한 화면에 보여줄 범위는 5
		// 시작은 1, 종료는 5
		// 시작 -> 현재페이지 / 페이지범위 + 1
		// 종료 -> 시작 + 범위 - 1
		int startPageNo =
			(page % pagingInfo.getPageRange() == 0 ? page-1 : page) 
			/ pagingInfo.getPageRange() * pagingInfo.getPageRange() + 1;
		
		int endPageNo = startPageNo + pagingInfo.getPageRange() - 1;
		if( endPageNo > totalPageCount )
			endPageNo = totalPageCount;
		
		// 이전, 다음
		// 이전을 만드는 경우 시작이 1이 아닐 때
		// 이전페이지의 값은 시작 - 페이지점위
		// 다음을 만드는 경우 종료가 마지막 페이지가 아닐 때
		// 다음페이지의 값은 다음 + 1
		int beforePageNo = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPageNo = endPageNo != totalPageCount ? endPageNo + 1 : -1;
		
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("beforePageNo", beforePageNo);
		model.addAttribute("afterPageNo", afterPageNo);
		model.addAttribute("curPage", page);
		return "admin/adminMemberManage";
	}
	
	@GetMapping("/adminMemberManage/{pageNo}")
	public String adminMemberManageFormWithPageNo(
			@PathVariable("pageNo") Integer page,
			Model model, HttpSession session) {
		return adminMemberManageForm(page, model, session);
	}
		
	@GetMapping("/adminMemberManage")
	public String adminMemberManageFormWithNoPageNo(			
			Model model, HttpSession session) {
		return adminMemberManageForm(1, model, session);
	}
	///////////////////////////////////////////////////////////////////////////////////////
	
	
	// 멤버관리 with 페이징, 검색
	///////////////////////////////////////////////////////////////////////////////////////
	private String adminMemberManageSearchForm(
			Integer page, Model model, HttpSession session, HttpServletRequest request, String searchValue) {
		
		// 어드민으로 로그인 되있는지 확인
		Member member = (Member) session.getAttribute("login_admin");
		if (member == null) {
			return "admin/adminLoginForm";
		}
		
		
		HashMap<String, Object> args = 
				new HashMap<String, Object>();		
		
		args.put("curPageNo", page);		
		args.put("searchValue",searchValue);
		
		request.setAttribute("searchValue", searchValue);
		
		model.addAttribute("member_list", mswpService.service(args));
		
		HashMap<String, Integer> result = 
			(HashMap<String, Integer>)mscService.service(searchValue);
		model.addAttribute(
				"member_count", result.get("totalCount"));
		
		int totalPageCount = (int)result.get("totalPageCount");
		// 시작페이지와 종료페이지 처리
		// 현재 페이지가 3인경우 한 화면에 보여줄 범위는 5
		// 시작은 1, 종료는 5
		// 시작 -> 현재페이지 / 페이지범위 + 1
		// 종료 -> 시작 + 범위 - 1
		int startPageNo =
			(page % pagingInfo.getPageRange() == 0 ? page-1 : page) 
			/ pagingInfo.getPageRange() * pagingInfo.getPageRange() + 1;
		
		int endPageNo = startPageNo + pagingInfo.getPageRange() - 1;
		if( endPageNo > totalPageCount )
			endPageNo = totalPageCount;
		
		// 이전, 다음
		// 이전을 만드는 경우 시작이 1이 아닐 때
		// 이전페이지의 값은 시작 - 페이지점위
		// 다음을 만드는 경우 종료가 마지막 페이지가 아닐 때
		// 다음페이지의 값은 다음 + 1
		int beforePageNo = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPageNo = endPageNo != totalPageCount ? endPageNo + 1 : -1;
		
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("beforePageNo", beforePageNo);
		model.addAttribute("afterPageNo", afterPageNo);
		model.addAttribute("curPage", page);
		return "admin/adminMemberManageSearch";
	}
	
	@GetMapping("/adminMemberManageSearch/{pageNo}")
	public String adminMemberManageSearchFormWithPageNo(
			@PathVariable("pageNo") Integer page,
			Model model, HttpSession session, HttpServletRequest request) {
		String searchValue = request.getParameter("searchValue");
		return adminMemberManageSearchForm(page, model, session, request, searchValue);
	}
		
	@GetMapping("/adminMemberManageSearch")
	public String adminMemberManageSearchFormWithNoPageNo(			
			Model model, HttpSession session, HttpServletRequest request) {
		String searchValue = request.getParameter("searchValue");
		return adminMemberManageSearchForm(1, model, session, request, searchValue);
	}
	///////////////////////////////////////////////////////////////////////////////////////
	
	// 멤버 정보 수정 AJAX
	@RequestMapping(value="/adminMemberModify",method=RequestMethod.GET,produces="application/jason;charset=utf8")
	@ResponseBody
	public String adminMemberModify(@RequestParam(value="member_id") String member_id,
			@RequestParam(value="tel") String tel, 
			@RequestParam(value="birth") String birth,
			@RequestParam(value="email") String email) {
		
		Member member = new Member();
		member.setMember_id(member_id);
		member.setTel(tel);
		member.setBirth(birth);
		member.setEmail(email);
		String result = (boolean)mubaService.service(member) == true ? "true" : "false";
		System.out.println(result);
		return result;
	}

	
	// 도시명 중복 검사 AJAX
	@RequestMapping(value="/adminCityDupleCheck",method=RequestMethod.GET,produces="application/jason;charset=utf8")
	@ResponseBody
	public String adminCityDupleCheck(@RequestParam(value="city") String city) {
		City_Data city_data = new City_Data();
		city_data.setCity(city);
//		String result = (boolean)mubaService.service(member) == true ? "true" : "false";
		City_Data searchedCity = null;
		searchedCity = (City_Data) cdsoService.service(city_data);
		

		if(searchedCity == null) {
			// DB에 검색된 도시 없음
			return "true";
		} else {
			// DB에 검색된 도시 있음
			return "false";
		}
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
	
	// 안드로이드 /////////////////////////////////////////////////////////
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Object android() {
		List<String> countryList = (List<String>) cdsCountryService.service();
		System.out.println(countryList);
		return countryList;
	}
	
	///////////////////////////////////////////////////////////////////
}
