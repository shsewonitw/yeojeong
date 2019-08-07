package com.tje.yeojeong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mysql.cj.Session;
import com.tje.yeojeong.model.*;
import com.tje.yeojeong.service.*;
import com.tje.yeojeong.setting.PagingInfo;
import com.tje.yeojeong.setting.UtilFile;
@Controller
public class ReviewController {
	@Autowired
	private CommentLastInsertIdService cliiService;
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
	@Autowired 
	private Review_UpdateService ruservice;
	@Autowired
	private Review_DeleteService rdeservice;
	@Autowired
	private PagingInfo pagingInfo;
	@Autowired
	private ReviewListCountService rcountService;
	@Autowired
	private Review_ReviewSerachService rrsService;
	@Autowired
	private Review_SerachCountService rscService;

	
	@GetMapping("/review")
	public String reviewForm(){
		
		return "form/reviewForm";
	}
	
	// 게시판 작성
	@PostMapping("/review")
	public String reviewSubmit(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam("country") String country,@RequestParam("city") String city,
			@RequestParam("content") String content,@RequestParam("image_src") MultipartFile uploadFile1, MultipartHttpServletRequest mpRequest,
			@RequestParam(value = "review_star", required = false ,defaultValue = "1") int review_star){

		// 파일이름가져오기
		UtilFile utilFile = new UtilFile();
		String img_src = utilFile.fileUpload(mpRequest, uploadFile1);
		
		
		Review_view reviewview = new Review_view();
		reviewview.setContent(content);
		reviewview.setCountry(country);
		reviewview.setCity(city);
		reviewview.setImage_src(img_src);
		reviewview.setReview_star(review_star);
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
		
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("reviewview", reviewview);
		HashMap<String, Object> resultMap = (HashMap<String, Object>) riService.service(values);
		
		model.addAttribute("result", resultMap.get("result"));
		
		
		
		return "form/reviewSubmit";
	}
	
	// 게시판 수정
	@GetMapping("/reviewchange")
	public String reviewchangeSubmit() {
		
		
		return "form/reviewchangeForm";
	}
	
	@PostMapping("/reviewchange")
	public String reviewchangeForm(HttpServletRequest request,
			@RequestParam("country") String country,@RequestParam("city") String city,
			@RequestParam("content") String content,@RequestParam(value = "review_star", required = false ,defaultValue = "1") int review_star,
			@RequestParam("article_id") int article_id,
			@RequestParam("image_src") MultipartFile uploadFile1, MultipartHttpServletRequest mpRequest,HttpSession session,Model model) {
		
		UtilFile utilFile = new UtilFile();
		String img_src = utilFile.fileUpload(mpRequest, uploadFile1);
		
		Review_view reviewview = new Review_view();
		reviewview.setArticle_id(article_id);
		reviewview.setContent(content);
		reviewview.setCountry(country);
		reviewview.setCity(city);
		reviewview.setImage_src(img_src);
		reviewview.setReview_star(review_star);
		Member member = (Member)session.getAttribute("login_member");
		reviewview.setMember_id(member.getMember_id());
		
		if(content.isEmpty()) {
			request.setAttribute("errorMsg", "내용은 필수 사항 입니다");
			return "/error/reviewUpdateError";
		}
		
		if(country.length() == 0) {
			request.setAttribute("errorMsg", "국가를 선택해주세요");
			return "/error/reviewUpdateError";
		}
		
		if(city.length() == 0) {
			request.setAttribute("errorMsg", "도시를 선택해주세요");
			return "/error/reviewUpdateError";
		}
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("review", reviewview);
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) ruservice.service(values);
		
		model.addAttribute("result", resultMap.get("result"));
		
		
		return "form/reviewchangeSubmit";
	}
	
	// 게시판 삭제
	@GetMapping("/reviewdelete")
	public String reviewdeleteForm(HttpSession session) {
		
		session.getAttribute("articleNo");
		
		return "form/reviewdeleteForm";
	}
	
	@PostMapping("/reviewdelete")
	public String reviewdeleteSubmit(@RequestParam("article_id") int article_id,HttpServletRequest request,
			Model model) {
		
		Review_view review = new Review_view();
		review.setArticle_id(article_id);
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("review", review);

		HashMap<String, Object> resultMap = (HashMap<String, Object>) rdeservice.service(values);

		model.addAttribute("result", resultMap.get("result"));
		
		return "form/reviewdeleteSubmit";
	}
	
	// 게시판 리스트
	@GetMapping({"/reviewlist","/reviewlist/{pageNo}"})
	public String reviewListForm(Model model, HttpSession session, Review_view reviewview,@PathVariable(value = "pageNo", required = false) Integer page,
			@RequestParam(value = "searchItem", required = false) String searchItem,
			@RequestParam(value = "searchValue", required = false) String searchValue,HttpServletRequest request){
		
		if( page == null )
			page = 1;
		
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) rlService.service(page);
		resultMap.put("curPageNo", page);
		model.addAttribute("reviewlist", resultMap.get("reviewlist"));
		
		HashMap<String, Integer> result = (HashMap<String, Integer>)rcountService.service();
		
		model.addAttribute("r_count", result.get("totalCount"));
		
		int totalPageCount = (int)result.get("totalPageCount");
		int startPageNo = (page % pagingInfo.getPageRange() == 0 ? page-1 : page)
						  / pagingInfo.getPageRange() * pagingInfo.getPageRange() + 1;
		
		int endPageNo = startPageNo + pagingInfo.getPageRange() -1;
		if(endPageNo > totalPageCount)
			endPageNo = totalPageCount;
		int beforePage = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPage = endPageNo != totalPageCount ? endPageNo +1 : -1;
		
		model.addAttribute("totalPageCount",totalPageCount);
		model.addAttribute("startPageNo",startPageNo);
		model.addAttribute("endPageNo",endPageNo);
		model.addAttribute("beforePage",beforePage);
		model.addAttribute("afterPage",afterPage);
		model.addAttribute("curPage",page);
		
		return "form/reviewListForm";
	}
	
	// 게시판 검색
	@PostMapping({"/reviewlist/serach","/reviewlist/serach/{pageNo}"})
	public String reviewListSubmit(/*@RequestParam(value = "searchItem", required = false) String searchItem,*/
			/* @RequestParam(value = "searchValue", required = false) String searchValue,*/Model model,
								   @PathVariable(value = "pageNo", required = false) Integer page,HttpServletRequest request) {
		
		if( page == null )
			page = 1;
		
		
		String searchItem = request.getParameter("searchItem");
		String searchValue = request.getParameter("searchValue");
		
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("searchItem", searchItem);
		values.put("searchValue", searchValue);
		
		HashMap<String, Object> resultMap =  (HashMap<String, Object>) rrsService.service(values,page);
		model.addAttribute("reviewSearch", (List<Review_view>)resultMap.get("ReviewSearch"));

		HashMap<String, Integer> result = (HashMap<String, Integer>)rscService.service(searchItem,searchValue);

		model.addAttribute("r_count", result.get("totalCount"));

		int totalPageCount = (int) result.get("totalPageCount");
		int startPageNo = (page % pagingInfo.getPageRange() == 0 ? page - 1 : page) / pagingInfo.getPageRange()
				* pagingInfo.getPageRange() + 1;

		int endPageNo = startPageNo + pagingInfo.getPageRange() - 1;
		if (endPageNo > totalPageCount)
			endPageNo = totalPageCount;
		int beforePage = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPage = endPageNo != totalPageCount ? endPageNo + 1 : -1;

		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("beforePage", beforePage);
		model.addAttribute("afterPage", afterPage);
		model.addAttribute("curPage", page);
		model.addAttribute("searchItem",searchItem);
		model.addAttribute("searchValue",searchValue);
		return "form/reviewListSubmit";
	}
	
	// 게시판 검색 후 리스트
	@GetMapping({ "/reviewlist/serach", "/reviewlist/serach/{pageNo}" })
	public String reviewSerachForm(/*@RequestParam(value = "searchItem", required = false) String searchItem,*/
			/*@RequestParam(value = "searchValue", required = false) String searchValue,*/ Model model,
			@PathVariable(value = "pageNo", required = false) Integer page,HttpServletRequest request) {

		if (page == null)
			page = 1;
		String searchItem = request.getParameter("searchItem");
		String searchValue = request.getParameter("searchValue");
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("searchItem", searchItem);
		values.put("searchValue", searchValue);

		HashMap<String, Object> resultMap = (HashMap<String, Object>) rrsService.service(values, page);
		model.addAttribute("reviewSearch", resultMap.get("ReviewSearch"));

		HashMap<String, Integer> result = (HashMap<String, Integer>) rscService.service(searchItem, searchValue);

		model.addAttribute("r_count", result.get("totalCount"));

		int totalPageCount = (int) result.get("totalPageCount");
		int startPageNo = (page % pagingInfo.getPageRange() == 0 ? page - 1 : page) / pagingInfo.getPageRange()
				* pagingInfo.getPageRange() + 1;

		int endPageNo = startPageNo + pagingInfo.getPageRange() - 1;
		if (endPageNo > totalPageCount)
			endPageNo = totalPageCount;
		int beforePage = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPage = endPageNo != totalPageCount ? endPageNo + 1 : -1;

		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("beforePage", beforePage);
		model.addAttribute("afterPage", afterPage);
		model.addAttribute("curPage", page);
		model.addAttribute("searchValue",searchValue);
		model.addAttribute("searchItem",searchItem);
		return "form/reviewserachForm";
	}
	
	
	// 게시판 상세페이지
	@GetMapping("/datailreview")
	public String datailview(@RequestParam("article_id") Integer arID,Model model,HttpServletRequest request, Review_Comment comment,
			HttpSession session,Review_view review, HttpServletResponse response) {
        
		review.setArticle_id(arID);
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("review", review);
		HashMap<String, Object> resultMap = null; 
		
		// 쿠키를 이용하여 새로운 쿠키가 들어왔을 때만 조회수가 증가하는 코드
		Cookie[] cookies = request.getCookies();

		// 비교하기 위해 새로운 쿠키
		Cookie viewCookie = null;

		// 쿠키가 있을 경우
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				// Cookie의 name이 cookie + arID와 일치하는 쿠키를 viewCookie에 넣어줌
				if (cookies[i].getName().equals("cookie" + arID)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = cookies[i];
				}
			}
		}
		
		 if (viewCookie == null) {    
             System.out.println("cookie 없음");
             
             // 쿠키 생성(이름, 값)
             Cookie newCookie = new Cookie("cookie"+arID, "|" + arID + "|");
                             
             // 쿠키 추가
             response.addCookie(newCookie);

             // 쿠키를 추가 시키고 조회수 증가시킴
             resultMap = (HashMap<String, Object>) rcService.service(values);
             
             if( (Integer)resultMap.get("result") != 1 ) {
 				request.setAttribute("errorMsg", "조회수 에러");
 				return "error/reviewError";
 			}	
         }
         else {
             System.out.println("cookie 있음");
             // 쿠키 값 받아옴.
             String value = viewCookie.getValue();
             System.out.println("cookie 값 : " + value);
     
         }
		
		// 새로고침해도 조회수가 증가하는 코드
		/*
		if( request.getMethod().equals("GET") ) {
			resultMap = (HashMap<String, Object>) rcService.service(values);
			if( (Integer)resultMap.get("result") != 1 ) {
				request.setAttribute("errorMsg", "조회수 에러");
				return "error/reviewError";
			}		
		}
		*/
		
		resultMap = (HashMap<String, Object>) rdService.service(values);
		
		
		model.addAttribute("detailreview",resultMap.get("detailreview"));
		session.setAttribute("articleNo", review);
		
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
		comment.setMember_id(member.getMember_id());

		boolean result = false;
		HashMap<String, Object> values = new HashMap<>();
		values.put("comment", comment);
		System.out.println("aaaaaaaaaaaaaaaaaa:"+comment.getMember_id());
		
		
		
		Review_Comment reviewcomment = new Review_Comment();
		reviewcomment.setArticle_id(comment.getArticle_id());
		
		HashMap<String, Object> resultMap = (HashMap<String, Object>) rciService.service(values);
		int last_insert_id =  (int)cliiService.service();
		System.out.println("last id : " + last_insert_id);
		comment.setComment_id(last_insert_id);
		
		result = (boolean)resultMap.get("result");
		
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		SimpleDateFormat timeinfo = new SimpleDateFormat ( "yyyy:MM:dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		String format_time2 = timeinfo.format(time.getTime());
		
		
		String output = 
				String.format("{ \"result\" : \"%b\", \"article_id\" : \"%d\", \"member_id\" : \"%s\", \"comment_id\" : \"%d\", \"content\" : \"%s\", \"write_time\" : \"%s\" }", 
						result, comment.getArticle_id(), comment.getMember_id(),comment.getComment_id(), comment.getContent(), format_time2 );
			out.println(output);
			out.flush();
			out.close();
			
			return null;
	}
	
	// 댓글삭제
	@PostMapping("/commentdelete")
	@ResponseBody
	public String commentdelete(@RequestParam("comment_id") int comment_id,HttpServletResponse response, HttpSession session) {
		
		Member member = (Member)session.getAttribute("login_member");
		
		boolean result = false;
		
		Review_Comment reviewcomment = new Review_Comment();
		reviewcomment.setComment_id(comment_id);
		reviewcomment.setMember_id(member.getMember_id());
		
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
