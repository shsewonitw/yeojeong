package com.tje.yeojeong.appcontroller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tje.yeojeong.model.Review_view;
import com.tje.yeojeong.service.Android_Review_list_Service;
import com.tje.yeojeong.service.ReviewListService;
import com.tje.yeojeong.service.Review_DetileService;

@Controller
public class Andorid_ReviewListController {
	@Autowired
	private Android_Review_list_Service arlservice;
	@Autowired
	private Review_DetileService rdService;
	
	@RequestMapping(value="/androidreviewlist",produces="application/json;charset=utf-8")
    @ResponseBody
	public String android_reviewList() {
		
		ArrayList<String> list = new ArrayList<>();
		
		list = (ArrayList<String>) arlservice.service(list);
		
		Gson gson = new Gson();
		String jsonlist = gson.toJson(list);
		
		return jsonlist;
 
	}
	
	@RequestMapping(value="/androidreviewdetatil",produces="application/json;charset=utf-8")
	@ResponseBody
	public String android_reviewDetail(@RequestParam(value = "article_id",required = false) int article_id,Model model) {
		
		Review_view detailereivew = new Review_view();
		detailereivew.setArticle_id(article_id);
		
		model.addAttribute("detailereivew", rdService.service(detailereivew));
		
		return "form/detailreviewForm";
	}
}
