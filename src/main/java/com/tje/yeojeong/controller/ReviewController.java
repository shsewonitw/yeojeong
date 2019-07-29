package com.tje.yeojeong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.*;
@Controller
public class ReviewController {
	
	@Autowired
	private Review_InsertService riService;
	@Autowired
	private ReviewListService rlService;
	@Autowired
	private Review_DetileService rdService;
	@Autowired
	private Review_CountService rcService;
	@Autowired
	private Review_CommentInsertService rciService;
	
	@GetMapping("/review")
	public String reviewForm(){
		
		return "form/reviewForm";
	}
	
	// 게시판 작성
	@PostMapping("/review")
	public String reviewSubmit(Review_view reviewview,Model model, HttpSession session){
		
		//Member member = (Member)session.getAttribute("login_member");
		//reviewview.setMember_id(member.getMember_id());
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("reviewview", reviewview);
		HashMap<String, Object> resultMap = (HashMap<String, Object>) riService.service(values);
		
		model.addAttribute("result", resultMap.get("result"));
		return "form/reviewSubmit";
	}
	
	// 게시판 리스트
	@GetMapping("/reviewlist")
	public String reviewListForm(Model model) {
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) rlService.service();
		model.addAttribute("reviewlist", resultMap.get("reviewlist"));
		
		return "form/reviewListForm";
	}
	
	// 게시판 상세페이지, 댓글
	@GetMapping("/datailreview")
	public String datailview(@RequestParam("article_id") Integer arID,Model model,HttpServletRequest request) {
		
		Review_view review = new Review_view();
		review.setArticle_id(arID);
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("review", review);
		
		HashMap<String, Object> resultMap = null; 
		
		
		if( request.getMethod().equals("GET") ) {
			resultMap = (HashMap<String, Object>) rcService.service(values);
			if( (Integer)resultMap.get("result") != 1 ) {
				request.setAttribute("errorMsg", "조회수 에러");
				return "error/reviewError";
			}		
		}
		
		resultMap = (HashMap<String, Object>) rdService.service(values);
		
		if( !(Boolean)resultMap.get("result") ) {
			request.setAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
			return "error/reviewError";
		}
		
		model.addAttribute("detailreview",resultMap.get("detailreview"));
		
		return "form/detailreviewForm";
	}
	
	@PostMapping("comment")
	@ResponseBody
	public String comment(Model model,Review_Comment comment) {
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("comment", comment);
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) rciService.service(values);
		
		model.addAttribute("result", resultMap.get("result"));
		
		return "succec";
	}
}
