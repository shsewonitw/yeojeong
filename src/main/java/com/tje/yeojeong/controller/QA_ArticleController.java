package com.tje.yeojeong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class QA_ArticleController {
		
	@GetMapping("/qaarticle")
	public String qaArticleForm() {		
		return "form/qaarticleForm";
	}
	
	
}
