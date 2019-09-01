package com.tje.yeojeong.appcontroller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AppController {
	
	/*
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public Object login_submit(
			@RequestParam(value="id")String id,
			@RequestParam(value="pw")String pw) {
		System.out.printf("id=%s, pw=%s\n", id, pw);
		
		HashMap<String, String> result = new HashMap<>();
		result.put("id", id);
		result.put("pw", pw);
		result.put("r", Boolean.toString(id.equals(pw)));
		
		return result;
	}
	*/
	
	@PostMapping("/app_login")
	@ResponseBody
	public Object app_login(
			@RequestParam(value="id")String id,
			@RequestParam(value="pw")String pw,
			HttpSession session) {
		
		System.out.println("app_login 실행");
		System.out.printf("id -> %s, pw -> %s\n", id, pw);
		
		String login_id =
				(String)session.getAttribute("login_id");
		System.out.printf("login_id -> %s\n", login_id);
		
		HashMap<String, String> result = new HashMap<>();
		
		Boolean flag = false;
		
		if( login_id != null ) {
			result.put("result", flag.toString());
		} else {
			if( id.equals(pw) ) {
				flag = true;
				session.setAttribute("login_id", id);
			}
			result.put("result", flag.toString());
		}
		
		return result;
	}
	
	@GetMapping("/app_logout")
	@ResponseBody
	public Object app_logout(HttpSession session) {
		
		System.out.println("app_logout 실행");
		
		String login_id =
				(String)session.getAttribute("login_id");
		System.out.printf("login_id -> %s\n", login_id);
		
		HashMap<String, String> result = new HashMap<>();
		
		Boolean flag = false;
		
		if( login_id != null ) {
			flag = true;
			result.put("result", flag.toString());
			
			session.removeAttribute("login_id");
		} else {
			result.put("result", flag.toString());
		}
		
		return result;
	}
}
