package com.tje.yeojeong.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.service.MemberInsertService;

@Controller
public class AndroidController {
	@Autowired
	private MemberInsertService miService;
	
	@PostMapping("/android_join")
	@ResponseBody
	public Boolean android_join(
			@RequestParam(value = "id") String id,
			@RequestParam(value = "pw") String pw,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "gender") String strGender,
			@RequestParam(value = "birth") String strBirth,
			@RequestParam(value = "tel") String tel,
			@RequestParam(value = "email") String email) {
		
		
		int gender = strGender.equals("여자") ? 1:2;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birth = null;
		try {
			birth = sdf.parse(strBirth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Member member = new Member();
		member.setMember_id(id);
		member.setPassword(pw);
		member.setName(name);
		member.setGender(gender);
		member.setBirth(birth);
		member.setTel(tel);
		member.setEmail(email);
		
		Boolean result = (Boolean)miService.service(member);
		System.out.println(birth);
		System.out.println(result);
		return result;
	}
}

