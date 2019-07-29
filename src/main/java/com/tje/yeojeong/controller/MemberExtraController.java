package com.tje.yeojeong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.service.MemberSearchEmailService;
import com.tje.yeojeong.service.MemberSearchIDService;

@Controller
public class MemberExtraController {

	@Autowired
	private MemberSearchIDService msService;
	
	@Autowired
	private MemberSearchEmailService mseService;

	@PostMapping("/searchID")
	@ResponseBody
	public boolean login_search(@RequestParam("member_id") String member_id) {

		Member member = new Member();
		member.setMember_id(member_id);
		boolean result = (Member) msService.service(member) == null ? true : false;
		return result;
	}
	@PostMapping("/searchEmail")
	@ResponseBody
	public boolean email_search(@RequestParam(value = "email") String email) {
		System.out.println(email);
		Member member = new Member();
		member.setEmail(email);
		
		boolean result = (List<Member>) mseService.service(member) == null ? true : false;
		System.out.println(result);
		return result;
	}

}
