package com.tje.yeojeong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.model.Review_view;
import com.tje.yeojeong.model.Withme_request;
import com.tje.yeojeong.model.Withme_requestDuple;
import com.tje.yeojeong.service.MemberChangeTelService;
import com.tje.yeojeong.service.MemberSearchEmailService;
import com.tje.yeojeong.service.MemberSearchIDService;
import com.tje.yeojeong.service.Review_Mypage_DeleteService;
import com.tje.yeojeong.service.WithmeRequestDuple_DeleteWhereReqeustIdService;
import com.tje.yeojeong.service.WithmeRequest_DeleteService;
import com.tje.yeojeong.service.WithmeRequest_UpdateStatusService;

@Controller
public class MemberExtraController {

	@Autowired
	private MemberSearchIDService msService;

	@Autowired
	private MemberSearchEmailService mseService;

	@Autowired
	private MemberChangeTelService mctService;

	@Autowired
	private WithmeRequest_UpdateStatusService wrusService;

	@Autowired
	private WithmeRequest_DeleteService wrdService;

	@Autowired
	private Review_Mypage_DeleteService rmdService;

	@Autowired
	private WithmeRequestDuple_DeleteWhereReqeustIdService wrddwriService;
	
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

	@PostMapping("/auth/mypageWithMe")
	@ResponseBody
	public boolean mypageWithMe(@RequestParam String statue_val, @RequestParam String request_id_val,
			HttpSession session) {

		Withme_request withme_request = new Withme_request();
		int request_id = Integer.parseInt(request_id_val);
		withme_request.setRequest_id(request_id);
		withme_request.setStatue(statue_val);

		wrusService.service(withme_request);

		boolean result = (Boolean) wrusService.service(withme_request);

		return result;
	}

	@PostMapping("/auth/mypage_delet_write")
	@ResponseBody
	public boolean mypage_delet_write(@RequestParam String article_id, HttpSession session) {
		int article_id_in = Integer.parseInt(article_id);
		Review_view review_view = new Review_view();
		review_view.setArticle_id(article_id_in);

		return (Boolean) rmdService.service(review_view);
	}

	@PostMapping("/auth/deleteWithMeRquest")
	@ResponseBody
	@Transactional
	public String deleteWithMeRquest(@RequestParam String request_id_val, @RequestParam String div, HttpSession session,
			HttpServletResponse response) {

		Withme_request withme_request = new Withme_request();
		int request_id = Integer.parseInt(request_id_val);
		withme_request.setRequest_id(request_id);
		boolean result = (Boolean) wrdService.service(withme_request);

		
		Withme_requestDuple withme_requestDuple = new Withme_requestDuple();
		withme_requestDuple.setRequest_id(request_id);
		boolean result2 = (boolean) wrddwriService.service(withme_requestDuple);
		System.out.println(result+", "+ result2);
		String jsonTxt = "{\"result\":\"" + (result&&result2) + "\", \"div\":\"" + div + "\"}";

		return jsonTxt;
	}

}
