package com.tje.yeojeong.appcontroller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tje.yeojeong.model.City_Data;
import com.tje.yeojeong.model.Withme_view;
import com.tje.yeojeong.service.City_DataSelectAllService;
import com.tje.yeojeong.service.City_DataSelectOneService;
import com.tje.yeojeong.service.WithmeListService;
import com.tje.yeojeong.service.WithmeSelectService;

@Controller
public class Android_WithMeController {

	@Autowired
	private WithmeSelectService wmsService;
	
	Gson gson = new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
	
	@GetMapping(value="/android_withme_article",produces="application/json; charset=utf8")
	@ResponseBody
	public String withme_article(
			@RequestParam(value="member_id") String member_id) {
		Withme_view obj = new Withme_view();
		System.out.println("안드로이드에서 온 아이디: "+member_id);
		obj.setMember_id(member_id);
		List<Withme_view> list = wmsService.service(obj);	
		System.out.println(list.get(0).getWrite_time());
		String result = gson.toJson(list);
		
		return result;
	}
	
	
	
	

}
