package com.tje.yeojeong.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@PostMapping("/regist")
	public String regist_Submit(HttpServletRequest request, @RequestParam("year") String year, @RequestParam String month,
			@RequestParam String day, Model model, @ModelAttribute(value = "member") Member member) {


		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		
		model.addAttribute("year", year);
		model.addAttribute("month", request.getParameter("month"));
		model.addAttribute("day", request.getParameter("day"));
		return "submits/registSubmit";
	}

}
