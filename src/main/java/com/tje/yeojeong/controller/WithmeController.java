package com.tje.yeojeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.tje.yeojeong.service.*;
import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.Withme_requestDAO;
import com.tje.yeojeong.setting.*;

@Controller
public class WithmeController {
	@Autowired
	private WithmeListService wlService;
	@Autowired
	private Withme_InsertService wiService;
	@Autowired
	private WithmeRequest_InsertService wriService;
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
	private WithmeDeleteService wdService;
	@Autowired
	private PagingInfo pagingInfo;
	@Autowired
	private Withme_viewSelectTravelIdWhereMemberIdService wvstiwmiService;
	@Autowired
	private WithmeRequest_DeleteService wrdService;
	@Autowired
	private WithmeRequestDuple_DeleteService wmrddService;
	@Autowired
	private WithmeRequestDuple_InsertService wmrdiService;
	@Autowired
	private WithmeRequestDuple_SelectService wmrdsService;
	@Autowired
	private WithmeRequest_LastInsertService wmrliService;
	@Autowired
	private WithmeRequestDuple_SelectRequestIdService wrdsriService;
	// 같이갈래 글 작성
	@GetMapping("/auth/transform")
	public String withmetransForm(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("login_member");
		
		// 미로그인 시, 로그인 페이지로 안내
		if(member == null) {
			return "error/needLogin";
		}
		
		Travel_regist travelRegist = new Travel_regist();
		travelRegist.setMember_id(member.getMember_id());
		List<Travel_regist> TravelRegistList = (List<Travel_regist>) tstlService.service(travelRegist);
		
		// 여행일정 미등록 시, 등록페이지로 안내
		if( TravelRegistList == null ) {
			return "error/needTravelRegist";
		}
		Withme_view withme_view = new Withme_view();
		withme_view.setMember_id(member.getMember_id());
		
		// 중복 등록 검사용 모델
		List<Withme_view> Withme_viewList = (List<Withme_view>) wvstiwmiService.service(withme_view);
		
		List<String> countryList = (List<String>) cdsCountryService.service();
		model.addAttribute("countryList", countryList);
		model.addAttribute("travelRegistList", TravelRegistList);
		model.addAttribute("withme_viewList",Withme_viewList);
		
		return "form/withmetransForm";
	}
	
	@PostMapping("/auth/transform")
	public String withmeSubmit(Model model, HttpSession session,
			@RequestParam("data") String data,
			@RequestParam("category_gender") String category_gender, 
			@RequestParam("category_age") String category_age, 
			@RequestParam("category_style") String category_style) {
		Member member = 
				(Member)session.getAttribute("login_member");
		Withme_view withme_view = new Withme_view();
		
		String country ="";
		String city = "";
		String strStart_date = "";
		String strEnd_date = "";
		String strTravel_id = "";
		StringTokenizer st = new StringTokenizer(data, "&");
		while(st.hasMoreTokens()) {
			country = st.nextToken();
			city = st.nextToken();
			strStart_date = st.nextToken();
			strEnd_date = st.nextToken();
			strTravel_id = st.nextToken();
		}
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date start_date = null;
		Date end_date = null;
		int travel_id = 0;
		try {
			start_date = transFormat.parse(strStart_date);
			end_date = transFormat.parse(strEnd_date);
			travel_id = Integer.parseInt(strTravel_id);
		} catch (ParseException e) {
			e.printStackTrace();
		}
			withme_view.setCountry(country);
			withme_view.setCity(city);
			withme_view.setStart_date(start_date);
			withme_view.setEnd_date(end_date);
			withme_view.setMember_id(member.getMember_id());
			withme_view.setName(member.getName());
			withme_view.setCategory_gender(Integer.parseInt(category_gender));
			withme_view.setCategory_age(Integer.parseInt(category_age));
			withme_view.setCategory_style(Integer.parseInt(category_style));
			withme_view.setTravel_id(travel_id);
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
		Member login_member = (Member)session.getAttribute("login_member");
		
		// 미로그인 시, 로그인 페이지로 안내
		if(login_member == null) {
			return "error/needLogin";
		}
		
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
		
		Withme_requestDuple wrDuple = new Withme_requestDuple();
		wrDuple.setMember_id(login_member.getMember_id());
		model.addAttribute("dupleList", wmrdsService.service(wrDuple));
		
		List<Withme_requestDuple> temp =
		(List<Withme_requestDuple>)wmrdsService.service(wrDuple);
		return "form/withmeListForm";
	}
	
	@GetMapping("/auth/withmelist/{pageNo}")
	public String withmeListFormWithPageNo(
			@PathVariable("pageNo") Integer page, 
			Model model, HttpSession session) {
		return withmeListForm(page, model, session);
	}
	
	@GetMapping("/auth/withmelist")
	public String withmeListFormNotPageNo(
			Model model, HttpSession session) {
		return withmeListForm(1, model, session);
	}
	
	// 게시글 삭제
	@PostMapping("/auth/withmelist/delete/{article_id}")
	public String withmeDelete(
			Model model, @PathVariable("article_id") int article_id) {
		Withme_view withme_view = new Withme_view();
		withme_view.setArticle_id(article_id);
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("withme_view", withme_view);
		
		HashMap<String, Object> result = 
				(HashMap<String, Object>)wdService.service(values);
		model.addAttribute("result", result.get("result"));
		
		return "form/withmeDeleteSubmit";
	}
	// 동행 신청하기
	@PostMapping("/auth/withmelist/request")
	public String withmeRequestSubmit(Model model, HttpSession session,
			@RequestParam("sender_id") String sender_id,
			@RequestParam("receiver_id") String receiver_id,
			@RequestParam("country") String country,
			@RequestParam("city") String city,
			@RequestParam("start_date") String strStart_date,
			@RequestParam("end_date") String strEnd_date,
			@RequestParam("article_id") String strArticle_id) {
		
		Member member = 
				(Member)session.getAttribute("login_member");
		Withme_request withme_request = new Withme_request();
		/*
		 * <input type="hidden" name="sender_id" value="${login_member.member_id}" />
			 <input type="hidden" name="receiver_id" value="${wlist.member_id}" />
			 <input type="hidden" name="country" value="${wlist.country }" />
			 <input type="hidden" name="city" value="${wlist.city }" />
			 <input type="hidden" name="start_date" value="${wlist.start_date }" />
			 <input type="hidden" name="end_date" value="${wlist.end_date }" />
		 * 
		 */
		
		
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date start_date = null;
		Date end_date = null;
		try {
			start_date = transFormat.parse(strStart_date);
			end_date = transFormat.parse(strEnd_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
			withme_request.setSender_id(sender_id);
			withme_request.setReceiver_id(receiver_id);
			withme_request.setCountry(country);
			withme_request.setCity(city);
			withme_request.setStart_date(start_date);
			withme_request.setEnd_date(end_date);
			withme_request.setStatue("요청대기");
			
			HashMap<String, Object> values = new HashMap<String, Object>();
			values.put("withme_request", withme_request);
			HashMap<String, Object> result = (HashMap<String, Object>)wriService.service(values);
			model.addAttribute("result", result.get("result"));
			
			int request_id = wmrliService.service();
			
			
			Withme_requestDuple wrDuple = new Withme_requestDuple();
			wrDuple.setMember_id(member.getMember_id());
			int article_id = 0 ;
			try {
				article_id = Integer.parseInt(strArticle_id);
			} catch(Exception e) {
				;
			}
			wrDuple.setArticle_id(article_id);
			wrDuple.setRequest_id(request_id);
			wmrdiService.service(wrDuple);
			
		return "form/withmeRequestSubmit";
	}
	
	// 동행신청 취소
	@PostMapping("/auth/withmelist/cancel/{article_id}")
	@Transactional
	public String withmeCancel(
			Model model, @PathVariable("article_id") int article_id, @RequestParam("member_id") String member_id) {
		Withme_requestDuple wrduple = new Withme_requestDuple();
		wrduple.setArticle_id(article_id);
		wrduple.setMember_id(member_id);
		int request_id = (int)wrdsriService.service(wrduple);
		boolean flag1 = (boolean)wmrddService.service(wrduple);
		
		
		
		Withme_request withme_request = new Withme_request();
		withme_request.setRequest_id(request_id);
		boolean flag2 = (boolean)wrdService.service(withme_request);
		
		
		model.addAttribute("result", flag1&&flag2);

		
		return "form/withmeCancelSubmit";
	}
}
