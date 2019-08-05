package com.tje.yeojeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
	private Withme_requestCountService wrcService;
	@Autowired
	private Withme_viewCountService wvcService;
	@Autowired
	private WithmeListCountService wcService;
	@Autowired
	private PagingInfo pagingInfo;
	
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
