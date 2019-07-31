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
	public String login_Form(@RequestParam(value = "myurl", required = false) String myurl,
			@ModelAttribute(value = "member") Member member,
			@CookieValue(value = "rememberID", required = false) Cookie rCookie, HttpSession session) {
		if (session != null && session.getAttribute("login_member") != null) {
			// 접속 여부 검사
			if (myurl != null) {
				return "redirect:" + myurl;
			} else {
				return "page/main";
			}

		}
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
		// 아이디 검사
		Member search_ID = (Member) msiService.service(member);
		if (search_ID == null) {
			// 없는 아이디
			model.addAttribute("login_message", "존재하지 않는 아이디 입니다.");
			return "form/loginForm";
		} else {
			// 아이디 체크 성공
			// 비밀번호 검사
			if (!(Boolean) mlservice.service(member)) {
				// 로그인 실패(비밀번호)
				model.addAttribute("login_message", "비밀번호가 틀렸습니다.");
				return "form/loginForm";
			}
			// 세션 저장
			session.setAttribute("login_member", search_ID);
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
	}

	@GetMapping("/auth/logout")
	public String login_Form(HttpSession session, @RequestParam(value = "myurl") String myurl) {
		if (session != null) {
			session.removeAttribute("login_member");
		}

		return "redirect:" + myurl;
	}

	@GetMapping("/regist_Regular")
	public String regist_Regular_Form(@ModelAttribute(value = "member") Member member) {

		return "form/registForm_Regular";
	}

	@PostMapping("/regist_Regular")
	@ResponseBody
	public boolean regist_Regular_Submit(HttpServletRequest request, Model model, @RequestBody Member member) {

		return (Boolean) miService.service(member);
	}

	@GetMapping("/regist_Kakao")
	public String regist_Kakao_Form(@ModelAttribute(value = "member") Member member, @RequestParam String kakao_id,
			@RequestParam String kakao_email, @RequestParam(required = false) String kakao_gender, Model model,
			HttpSession session) {

		member.setMember_id(kakao_id);
		member.setEmail(kakao_email);

		Member searched_Member = (Member) msiService.service(member);
		if (session.getAttribute("login_member") == null && searched_Member != null) {
			session.setAttribute("login_member", searched_Member);
			return "page/main";
		}

		if (kakao_gender != null && kakao_gender.equals("male")) {
			member.setGender(1);
		} else if (kakao_gender != null && kakao_gender.equals("female")) {
			member.setGender(2);
		}

		return "form/registForm_Kakao";
	}

	@PostMapping("/regist_Kakao")
	@ResponseBody
	public boolean regist_Kakao_Submit(HttpServletRequest request, Model model, @RequestBody Member member) {
		return (Boolean) miService.service(member);

	}

	@GetMapping("/auth/mypage")
	public String mypage_Form(@ModelAttribute(value = "member") Member member, HttpSession session) {

		return "form/mypageForm";
	}

	@PostMapping("/auth/mypage")
	public String mypage_Submit(@ModelAttribute(value = "member") Member member, HttpSession session) {

		return "submits/mypageSumit";
	}

}
