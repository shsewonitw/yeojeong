package com.tje.yeojeong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.service.MemberChangeTelService;
import com.tje.yeojeong.service.MemberSearchEmailService;
import com.tje.yeojeong.service.MemberSearchIDService;

@Controller
public class MemberExtraController {

	@Autowired
	private MemberSearchIDService msService;

	@Autowired
	private MemberSearchEmailService mseService;

	@Autowired
	private MemberChangeTelService mctService;

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
		Member member = new Member();
		member.setEmail(email);
		List<Member> resultMember = (List<Member>) mseService.service(member);
		boolean result = resultMember != null && resultMember.size() == 0 ? true : false;
		return result;
	}

	@PostMapping("/tel_change")
	@ResponseBody
	public boolean tel_change(@RequestBody Member member, HttpSession session) {
		boolean result = false;
		System.out.println(member.getTel());
		if ((Boolean) mctService.service(member)) {
			// 번호 바꾼 후 바뀐 번호로 세션에 다시 저장
			Member jm = (Member) session.getAttribute("login_member");
			jm.setTel(member.getTel());
			session.setAttribute("login_member", jm);
			result = true;
		}

		return result;
	}

}
