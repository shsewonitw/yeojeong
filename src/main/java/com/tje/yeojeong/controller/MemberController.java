package com.tje.yeojeong.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.service.MemberInsertService;
import com.tje.yeojeong.service.MemberLoginService;
import com.tje.yeojeong.service.MemberSearchIDService;

@Controller
public class MemberController {

	@Autowired
	private MemberInsertService miService;
	@Autowired
	private MemberLoginService mlservice;
	@Autowired
	private MemberSearchIDService msiService;

	@GetMapping("/login")
	public String login_Form(@ModelAttribute(value = "member") Member member,
			@CookieValue(value = "rememberID", required = false) Cookie rCookie, HttpSession session) {
		if (rCookie != null) {
			// 쿠키가 있을때
			member.setMember_id(rCookie.getValue());
		}
		return "form/loginForm";
	}

	@PostMapping("/login")
	public String login_sumit(@ModelAttribute(value = "member") Member member, HttpSession session, Model model,
			@RequestParam(value = "rememberID", required = false) String rememberID,
			@CookieValue(value = "rememberID", required = false) Cookie rCookie, HttpServletResponse response) {

		Member search_ID = (Member) msiService.service(member);
		// 세션 저장
		session.setAttribute("login_member", search_ID);

		if (!(Boolean) mlservice.service(member)) {
			// 로그인 실패
			return "form/loginForm";
		}

		// 로그인 성공

		if (rememberID != null && rememberID.equals("on")) {
			// 아이디저장
			rCookie = new Cookie("rememberID", member.getMember_id());
		} else {
			rCookie = new Cookie("rememberID", member.getMember_id());
			rCookie.setMaxAge(0);
		}
		response.addCookie(rCookie);

		return "/page/main";
	}

	@GetMapping("/regist")
	public String regist_Form(@ModelAttribute(value = "member") Member member) {

		return "form/registForm";
	}

	@PostMapping("/regist")
	@ResponseBody
	public boolean regist_Submit(HttpServletRequest request, Model model, @RequestBody Member member) {

		return (Boolean) miService.service(member);
	}

}
