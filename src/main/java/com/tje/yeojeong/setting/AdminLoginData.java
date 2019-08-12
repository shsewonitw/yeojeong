package com.tje.yeojeong.setting;

import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;

import com.tje.yeojeong.model.Member;

@ApplicationScope
@Component
public class AdminLoginData {
	HashMap<String, Member> map = new HashMap<String, Member>();

	public AdminLoginData() {
	}

	public HashMap<String, Member> getMap() {
		return map;
	}
	
	
}
