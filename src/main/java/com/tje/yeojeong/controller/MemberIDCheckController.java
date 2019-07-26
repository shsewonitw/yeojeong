package com.tje.yeojeong.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.service.MemberSearchService;

@Controller
public class MemberIDCheckController {

	@Autowired
	private MemberSearchService msService;

	@PostMapping("/searchID")
	@ResponseBody
	public boolean login_Form(@RequestParam("member_id") String member_id) {

		Member member = new Member();
		member.setMember_id(member_id);
		boolean result = (Member) msService.service(member) == null ? true : false;
		return result;
	}

}
