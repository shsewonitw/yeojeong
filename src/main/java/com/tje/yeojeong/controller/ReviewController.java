package com.tje.yeojeong.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.*;
@Controller
public class ReviewController {
	
	@Autowired
	private Review_InsertService riService;
	@Autowired
	private ReviewListService rlService;
	
	@GetMapping("/review")
	public String reviewForm(){
		
		return "form/reviewForm";
	}
	
	@PostMapping("/review")
	public String reviewSubmit(Review_view reviewview,Model model, HttpSession session){
		
		//Member member = (Member)session.getAttribute("login_member");
		//reviewview.setMember_id(member.getMember_id());
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("reviewview", reviewview);
		HashMap<String, Object> resultMap = (HashMap<String, Object>) riService.service(values);
		
		model.addAttribute("result", resultMap.get("result"));
		return "form/reviewSubmit";
	}
	
	@GetMapping("/reviewlist")
	public String reviewListForm(Model model) {
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) rlService.service();
		model.addAttribute("reviewlist", resultMap.get("reviewlist"));
		
		return "form/reviewListForm";
	}
	
	@GetMapping("/datailreview")
	public String datailview() {
		
		
		return "form/detailreviewForm";
	}
}
