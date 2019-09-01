package com.tje.yeojeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.tje.yeojeong.service.*;
import com.tje.yeojeong.model.*;
import com.tje.yeojeong.setting.*;

@Controller
public class Withme_Controller {
	@Autowired
	private WithmeListService wlService;
	@Autowired
	private Withme_InsertService wiService;
	@Autowired
	private Withme_requestCountService wrcService;
	@Autowired
	private Withme_viewCountService wvcService;
	@Autowired
	private WithmeListCountService wcService;
	@Autowired
	private TravelSearchedTravelListService tstlService;
	@Autowired
	private City_DataSelectCountryService cdsCountryService;
	@Autowired
	private City_DataSelectCityService cdsCityService;
	@Autowired
	private PagingInfo pagingInfo;
	
	// 같이갈래 글 작성
	@GetMapping("/transform")
	public String withmetransForm(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("login_member");
		Travel_regist travelRegist = new Travel_regist();
		travelRegist.setMember_id(member.getMember_id());
		List<Travel_regist> TravelRegistList = (List<Travel_regist>) tstlService.service(travelRegist);
		List<String> countryList = (List<String>) cdsCountryService.service();
		model.addAttribute("countryList", countryList);
		model.addAttribute("travelRegistList", TravelRegistList);
		return "form/withmetransForm";
	}
	
	@PostMapping("/transform")
	public String withmeSubmit(Model model, HttpSession session,
			@RequestParam("data") String data,
			@RequestParam("category_gender") int category_gender, 
			@RequestParam("category_age") int category_age, @RequestParam("category_style") int category_style) {
		Member member = 
				(Member)session.getAttribute("login_member");
		Withme_view withme_view = new Withme_view();
		
		String country ="";
		String city = "";
		String strStart_date = "";
		String strEnd_date = "";
		
		StringTokenizer st = new StringTokenizer(data, "&");
		while(st.hasMoreTokens()) {
			country = st.nextToken();
			city = st.nextToken();
			strStart_date = st.nextToken();
			strEnd_date = st.nextToken();
		}
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date start_date = null;
		Date end_date = null;
		try {
			start_date = transFormat.parse(strStart_date);
			end_date = transFormat.parse(strEnd_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
			withme_view.setCountry(country);
			withme_view.setCity(city);
			withme_view.setStart_date(start_date);
			withme_view.setEnd_date(end_date);
			withme_view.setMember_id(member.getMember_id());
			withme_view.setName(member.getName());
			
			Travel_regist travelRegist = new Travel_regist();
			HashMap<String, Object> values = new HashMap<String, Object>();
			values.put("withme_view", withme_view);
			HashMap<String, Object> result = (HashMap<String, Object>)wiService.service(values);
			List<Travel_regist> TravelRegistList = (List<Travel_regist>) tstlService.service(travelRegist);
			List<String> countryList = (List<String>) cdsCountryService.service();
			model.addAttribute("countryList", countryList);
			model.addAttribute("travelRegistList", TravelRegistList);
			model.addAttribute("withme_view", values);
			model.addAttribute("result", result.get("result"));
		return "form/withmeSubmit";
	}
	
	// 같이갈래 전체 목록 페이지
	public String withmeListForm(
			Integer page, Model model, HttpSession session) {
		HashMap<String, Object> args = 
				(HashMap<String, Object>)wlService.service(page);
		args.put("curPageNo", page);
		model.addAttribute("withmelist", args.get("withmelist"));
		
		HashMap<String, Integer> result = 
				(HashMap<String, Integer>)wcService.service();
		model.addAttribute(
				"r_count", result.get("totalCount"));
		
		int totalPageCount = (int)result.get("totalPageCount");
		int startPageNo = 
				(page % pagingInfo.getPageRange() == 0 ? page-1 : page)
				/ pagingInfo.getPageRange() * pagingInfo.getPageRange() + 1;
		int endPageNo = startPageNo + pagingInfo.getPageRange() - 1;
		
		if( endPageNo > totalPageCount )
			endPageNo = totalPageCount;
		
		int beforePageNo = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPageNo = endPageNo != totalPageCount ? endPageNo + 1 : -1;
		
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("beforePageNo", beforePageNo);
		model.addAttribute("afterPageNo", afterPageNo);
		model.addAttribute("curPage", page);
		return "form/withmeListForm";
	}
	
	@GetMapping("/withmelist/{pageNo}")
	public String withmeListFormWithPageNo(
			@PathVariable("pageNo") Integer page, 
			Model model, HttpSession session) {
		return withmeListForm(page, model, session);
	}
	
	@GetMapping("/withmelist")
	public String withmeListFormNotPageNo(
			Model model, HttpSession session) {
		return withmeListForm(1, model, session);
	}
}
