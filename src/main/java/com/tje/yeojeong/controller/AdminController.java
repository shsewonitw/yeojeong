package com.tje.yeojeong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.repository.*;
import com.tje.yeojeong.service.MemberLoginService;

@Controller
public class AdminController {
	@Autowired
	private MemberLoginService mlService;
	
	
	@Controller
	public class TravelRegistController {
		@GetMapping("/admin")
		public String adminLoginForm() {
			return "admin/adminLoginForm";
		}
		
		
		@PostMapping("/admin")
		public String adminLoginSubmit(HttpServletRequest request) {
			String member_id = request.getParameter("member_id");
			String password = request.getParameter("password");
			
			Member member = new Member();
			member.setMember_id(member_id);
			member.setPassword(password);
			
			boolean flag = (boolean)mlService.service(member);
			
			if(flag) {
				// 관리자 로그인 성공
				HttpSession session = request.getSession();
				session.setAttribute("login_admin", member);
				return "admin/adminMain";
			}
			else {
				// 관리자 로그인 실패
				return "admin/adminError";
			}
		}
		
		@GetMapping("/adminLogout")
		public String adminLogoutForm(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			session.removeAttribute("login_admin");
			
			return "admin/adminLoginForm";
		}
	}
}
