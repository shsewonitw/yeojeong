package com.tje.yeojeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.tje.yeojeong.model.Member;

@Controller
public class MemberController {

	@GetMapping("/login")
	public String login_Form(@ModelAttribute(value = "member") Member member) {

		return "form/loginForm";
	}

	@GetMapping("/regist")
	public String regist_Form(@ModelAttribute(value = "member") Member member) {

		return "form/registForm";
	}

}
