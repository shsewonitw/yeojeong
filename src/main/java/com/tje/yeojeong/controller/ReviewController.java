package com.tje.yeojeong.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.Review_InsertService;
@Controller
public class ReviewController {
	
	@Autowired
	private Review_InsertService riService;
	
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
		model.addAttribute("result", ((HashMap<String,Object>)riService.service(values)).get("result"));
		return "form/reviewSubmit";
	}
	
	@GetMapping("/reviewlist")
	public String reviewListForm() {
		
		return "form/reviewListForm";
	}
}
