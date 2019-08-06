package com.tje.yeojeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	private PagingInfo pagingInfo;
	
	// 같이갈래 글 작성
	@GetMapping("/transform")
	public String withmetransForm() {
		return "form/withmetransForm";
	}
	
	@PostMapping("/transform")
	public String withmeSubmit(Model model, HttpSession session,
			@RequestParam("city") String city, 
			@RequestParam("start_date") Date start_date, @RequestParam("end_date") Date end_date, @RequestParam("category_gender") int category_gender, 
			@RequestParam("category_age") int category_age, @RequestParam("category_style") int category_style) {
		Member member = 
				(Member)session.getAttribute("login_member");
		Withme_view withme_view = new Withme_view();
		
			withme_view.setCity(city);
			withme_view.setStart_date(start_date);
			withme_view.setEnd_date(end_date);
			withme_view.setMember_id(member.getMember_id());
			withme_view.setName(member.getName());
			
			HashMap<String, Object> values = new HashMap<String, Object>();
			values.put("withme_view", withme_view);
			HashMap<String, Object> result = (HashMap<String, Object>)wiService.service(values);
			
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
