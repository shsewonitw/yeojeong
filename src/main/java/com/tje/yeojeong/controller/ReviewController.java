package com.tje.yeojeong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.*;
import com.tje.yeojeong.setting.UtilFile;
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
	@Autowired
	private Review_CommentAllService rcaService;
	@Autowired
	private Review_CommentCountService rccservice;
	@Autowired
	private Review_CommentDeleteService rcdService;
	@Autowired
	private UtilFile utilFile;

	
	@GetMapping("/review")
	public String reviewForm(){
		
		return "form/reviewForm";
	}
	
	// 게시판 작성
	@PostMapping("/review")
	public String reviewSubmit(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam("country") String country,@RequestParam("city") String city,
			@RequestParam("content") String content,@RequestParam("image_src") MultipartFile uploadFile1, MultipartHttpServletRequest mpRequest){

		// 파일이름가져오기
		UtilFile utilFile = new UtilFile();
		String img_src = utilFile.fileUpload(mpRequest, uploadFile1);
		
		Review_view reviewview = new Review_view();
		reviewview.setContent(content);
		reviewview.setCountry(country);
		reviewview.setCity(city);
		reviewview.setImage_src(img_src);
		Member member = (Member)session.getAttribute("login_member");
		reviewview.setMember_id(member.getMember_id());
		
		if(content.isEmpty()) {
			request.setAttribute("errorMsg", "내용은 필수 사항 입니다");
			return "/error/reviewError";
		}
		
		if(country.length() == 0) {
			request.setAttribute("errorMsg", "국가를 선택해주세요");
			return "/error/reviewError";
		}
		
		if(city.length() == 0) {
			request.setAttribute("errorMsg", "도시를 선택해주세요");
			return "/error/reviewError";
		}
		
		System.out.println(img_src);
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("reviewview", reviewview);
		HashMap<String, Object> resultMap = (HashMap<String, Object>) riService.service(values);
		
		model.addAttribute("result", resultMap.get("result"));
		
		
		
		
		return "form/reviewSubmit";
	}
	
	// 게시판 수정
	@GetMapping("/reviewchange")
	public String reviewchangeForm() {
		
		return "form/reviewchangeForm";
	}
	
	@PostMapping("/reviewchange")
	public String reviewchangeSubmit() {
		
		
		return "form/reviewchangeSubmit";
	}
	
	// 게시판 리스트
	@GetMapping("/reviewlist")
	public String reviewListForm(Model model, HttpSession session, Review_view reviewview) {
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) rlService.service();
		model.addAttribute("reviewlist", resultMap.get("reviewlist"));
		
		
		return "form/reviewListForm";
	}
	
	// 게시판 상세페이지
	@GetMapping("/datailreview")
	public String datailview(@RequestParam("article_id") Integer arID,Model model,HttpServletRequest request, Review_Comment comment) {
        
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
		
		// 댓글 리스트
		Review_Comment review_comment = new Review_Comment();
		review_comment.setArticle_id(arID);
		values.put("model", comment);
		
		resultMap = (HashMap<String, Object>) rccservice.service(values);
		model.addAttribute("commentSize", resultMap.get("commentSize"));
		resultMap = (HashMap<String, Object>) rcaService.service(values);
		model.addAttribute("commentList",resultMap.get("commentList"));
		
		
		return "form/detailreviewForm";
	}
	
	// 댓글 등록
	@PostMapping("/commentinsert")
	@ResponseBody
	public String comment(Model model,Review_Comment comment,HttpServletResponse response,HttpSession session,HttpServletRequest request) throws IOException {
		
		Member member = (Member)session.getAttribute("login_member");
		
		boolean result = false;
		HashMap<String, Object> values = new HashMap<>();
		values.put("comment", comment);
		
		Review_Comment reviewcomment = new Review_Comment();
		reviewcomment.setArticle_id(comment.getArticle_id());
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) rciService.service(values);
		result = (boolean)resultMap.get("result");
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		SimpleDateFormat timeinfo = new SimpleDateFormat ( "yyyy:MM:dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		String format_time2 = timeinfo.format(time.getTime());
		
		
		String output = 
				String.format("{ \"result\" : \"%b\", \"article_id\" : \"%d\", \"member_id\" : \"%s\", \"comment_id\" : \"%d\", \"content\" : \"%s\", \"write_time\" : \"%s\" }", 
						result, comment.getArticle_id(), comment.getMember_id(),reviewcomment.getArticle_id(), comment.getContent(), format_time2 );
			out.println(output);
			out.flush();
			out.close();
			
			return null;
	}
	
	// 댓글삭제
	@PostMapping("/commentdelete")
	@ResponseBody
	public String commentdelete(@RequestParam("comment_id") int comment_id,HttpServletResponse response) {
		Member member = (Member)session.getAttribute("login_member");
		boolean result = false;
		
		Review_Comment reviewcomment = new Review_Comment();
		reviewcomment.setComment_id(comment_id);
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("reviewcommnet", reviewcomment);
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) rcdService.service(values);
		result = (Boolean)resultMap.get("result");
		
		response.setContentType("text/plane;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(result);
			out.flush();
		} catch (IOException e) {			
			e.printStackTrace();
		}		
		return null;
	}
}
