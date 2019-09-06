package com.tje.yeojeong.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tje.yeojeong.model.City_Data;
import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.model.Review_view;
import com.tje.yeojeong.model.Travel_end;
import com.tje.yeojeong.model.Travel_regist;
import com.tje.yeojeong.model.Withme_request;
import com.tje.yeojeong.service.City_DataSelectCountryService;
import com.tje.yeojeong.service.MemberInsertService;
import com.tje.yeojeong.service.MemberKAKAOInsertService;
import com.tje.yeojeong.service.MemberLoginService;
import com.tje.yeojeong.service.MemberSearchEmailService;
import com.tje.yeojeong.service.MemberSearchIDService;
import com.tje.yeojeong.service.ReviewCountByMemberService;
import com.tje.yeojeong.service.ReviewSearchByMemberService;
import com.tje.yeojeong.service.ReviewSelectWhereIdService;
import com.tje.yeojeong.service.TravelEndSelectIDService;
import com.tje.yeojeong.service.TravelRegistDeleteService;
import com.tje.yeojeong.service.TravelRegistSelectService;
import com.tje.yeojeong.service.TravelRegistUpdateService;
import com.tje.yeojeong.service.TravelSearchedTravelListService;
import com.tje.yeojeong.service.WithmeRequest_ReceiveService;
import com.tje.yeojeong.service.WithmeRequest_SendService;
import com.tje.yeojeong.setting.PagingInfo;

@Controller
public class MemberController {

	@Autowired
	private MemberInsertService miService;
	@Autowired
	private MemberKAKAOInsertService mkiService;
	@Autowired
	private MemberLoginService mlservice;
	@Autowired
	private MemberSearchIDService msiService;
	@Autowired
	private ReviewSelectWhereIdService rswiService;
	@Autowired
	private ReviewSearchByMemberService rsbimervice;
	@Autowired
	private ReviewCountByMemberService rcbmService;
	@Autowired
	private City_DataSelectCountryService cdsCountryService;
	@Autowired
	private TravelSearchedTravelListService tstlService;
	@Autowired
	private TravelRegistDeleteService trdService;
	@Autowired
	private TravelRegistUpdateService truService;
	@Autowired
	private WithmeRequest_ReceiveService wrrService;
	@Autowired
	private WithmeRequest_SendService wrsService;
	@Autowired
	private TravelEndSelectIDService tesiService;
	@Autowired
	private TravelRegistSelectService trssService;
	@Autowired
	private MemberSearchEmailService mseService;
	@Autowired
	private PagingInfo pagingInfo;

	@GetMapping("/login")
	public String login_Form(@RequestParam(value = "myurl", required = false) String myurl,
			@ModelAttribute(value = "member") Member member,
			@CookieValue(value = "rememberID", required = false) Cookie rCookie, HttpSession session) {
		if (session != null && session.getAttribute("login_member") != null) {
			// 접속 여부 검사
			if (myurl != null) {
				return "redirect:" + myurl;
			} else {
				return "page/main";
			}

		}
		if (rCookie != null) {
			// 쿠키가 있을때
			member.setMember_id(rCookie.getValue());
		}
		return "form/loginForm";
	}

	@PostMapping("/login")
	public String login_sumit(@ModelAttribute(value = "member") Member member, HttpSession session, Model model,
			@RequestParam(value = "rememberID", required = false) String rememberID,
			@CookieValue(value = "rememberID", required = false) Cookie rCookie, HttpServletResponse response) {
		// 아이디 검사
		Member search_ID = (Member) msiService.service(member);
		if (search_ID == null) {
			// 없는 아이디
			model.addAttribute("login_message", "존재하지 않는 아이디 입니다.");
			return "form/loginForm";
		} else {
			// 아이디 체크 성공
			// 비밀번호 검사
			if (!(Boolean) mlservice.service(member)) {
				// 로그인 실패(비밀번호)
				model.addAttribute("login_message", "비밀번호가 틀렸습니다.");
				return "form/loginForm";
			}
			// 세션 저장
			session.setAttribute("login_member", search_ID);
			// 로그인 성공
			if (rememberID != null && rememberID.equals("on")) {
				// 아이디저장
				rCookie = new Cookie("rememberID", member.getMember_id());
			} else {
				rCookie = new Cookie("rememberID", member.getMember_id());
				rCookie.setMaxAge(0);
			}
			response.addCookie(rCookie);
			return "/page/main";
		}
	}

	@GetMapping("/auth/logout")
	public String login_Form(HttpSession session, @RequestParam(value = "myurl") String myurl) {
		if (session != null) {
			session.removeAttribute("login_member");
		}

		return "redirect:" + myurl;
	}

	@GetMapping("/regist_Regular")
	public String regist_Regular_Form(@ModelAttribute(value = "member") Member member) {

		return "form/registForm_Regular";
	}

	@PostMapping("/regist_Regular")
	@ResponseBody
	public boolean regist_Regular_Submit(HttpServletRequest request, Model model, @RequestBody Member member) {

		return (Boolean) miService.service(member);
	}

	@GetMapping("/regist_Kakao")
	public String regist_Kakao_Form(@ModelAttribute(value = "member") Member member, @RequestParam String kakao_id,
			@RequestParam String kakao_email, @RequestParam(required = false) String kakao_gender, Model model,
			HttpSession session) {

		member.setMember_id(kakao_id);
		member.setEmail(kakao_email);

		Member searched_Member = (Member) msiService.service(member);
		if (session.getAttribute("login_member") == null && searched_Member != null) {
			session.setAttribute("login_member", searched_Member);
			return "page/main";
		}

		if (kakao_gender != null && kakao_gender.equals("male")) {
			member.setGender(1);
		} else if (kakao_gender != null && kakao_gender.equals("female")) {
			member.setGender(2);
		}

		return "form/registForm_Kakao";
	}

	@PostMapping("/regist_Kakao")
	@ResponseBody
	public boolean regist_Kakao_Submit(HttpServletRequest request, Model model, @RequestBody Member member) {
		return (Boolean) mkiService.service(member);

	}

	@GetMapping("/auth/mypage")
	public String mypage_Form(HttpSession session, Model model) {

		return mypageForm(1, model, session);
	}

	@GetMapping("/auth/mypage/{pageNo}")
	public String mypage_Form(@PathVariable(value = "pageNo") Integer page, HttpSession session, Model model) {
		model.addAttribute("mypagelistname", "write");

		return mypageForm(page, model, session);
	}

	private String mypageForm(Integer page, Model model, HttpSession session) {
		Review_view review_view = new Review_view();
		Member member = (Member) session.getAttribute("login_member");
		Withme_request Withme_request = new Withme_request();

		// 동행 요청 받는 관련
		Withme_request.setReceiver_id(member.getMember_id());
		model.addAttribute("withmeRequestReceive", (List<Withme_request>) wrrService.service(Withme_request));

		// 동행 요청 보낸 관련
		Withme_request.setSender_id(member.getMember_id());
		model.addAttribute("withmeRequestSend", (List<Withme_request>) wrsService.service(Withme_request));

		Travel_regist travelRegist = new Travel_regist();
		travelRegist.setMember_id(member.getMember_id());
		List<Travel_regist> TravelRegistList = (List<Travel_regist>) tstlService.service(travelRegist);
		// 내여행 관련
		model.addAttribute("TravelRegistList", TravelRegistList);

		List<String> countryList = (List<String>) cdsCountryService.service();
		// 내여행 관련
		model.addAttribute("countryList", countryList);
		
		// 내가 다녀온 곳 관련 
		Travel_end travelend = new Travel_end();
		travelend.setMember_id(member.getMember_id());
		List<Travel_end> TravelendList = (List<Travel_end>) tesiService.service(travelend);
		// 내여행 관련
		model.addAttribute("TravelendList", TravelendList);


		HashMap<String, Object> args = new HashMap<String, Object>();
		args.put("curPageNo", page);
		review_view.setMember_id(member.getMember_id());
		args.put("review_view", review_view);

		// 내가 쓴글 관련
		model.addAttribute("rList", rsbimervice.service(args));

		// 내가쓴글 페이징 관련
		HashMap<String, Integer> result = (HashMap<String, Integer>) rcbmService.service(review_view);
		model.addAttribute("r_count", result.get("totalCount"));
		int totalPageCount = (int) result.get("totalPageCount");
		// 시작페이지와 종료페이지 처리
		// 현재 페이지가 3인경우 한 화면에 보여줄 범위는 5
		// 시작은 1, 종료는 5
		// 시작 -> 현재페이지 / 페이지범위 + 1
		// 종료 -> 시작 + 범위 - 1
		int startPageNo = (page % pagingInfo.getPageRange() == 0 ? page - 1 : page) / pagingInfo.getPageRange()
				* pagingInfo.getPageRange() + 1;

		int endPageNo = startPageNo + pagingInfo.getPageRange() - 1;
		if (endPageNo > totalPageCount)
			endPageNo = totalPageCount;

		// 이전, 다음
		// 이전을 만드는 경우 시작이 1이 아닐 때
		// 이전페이지의 값은 시작 - 페이지점위
		// 다음을 만드는 경우 종료가 마지막 페이지가 아닐 때
		// 다음페이지의 값은 다음 + 1
		int beforePageNo = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPageNo = endPageNo != totalPageCount ? endPageNo + 1 : -1;

		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("beforePageNo", beforePageNo);
		model.addAttribute("afterPageNo", afterPageNo);
		model.addAttribute("curPage", page);

		return "form/mypageForm";
	}


	@PostMapping("/auth/mypageTravelRegistDelete")
	@ResponseBody
	public String mypageTravelRegistDelete_Submit(HttpSession session, @RequestBody Travel_regist travelRegist) {
		
		boolean result_flag = (Boolean) trdService.service(travelRegist);
		List<Travel_regist> count= (List<Travel_regist>)trssService.service();
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", result_flag);
		result.put("count", count);
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	@PostMapping("/auth/mypageTravelRegistUpdate")
	@ResponseBody
	public boolean mypageTravelRegistUpdate_Submit(HttpSession session, @RequestBody Travel_regist travelRegist) {
		boolean result = (Boolean) truService.service(travelRegist);

		return result;
	}
	
	@PostMapping("/regist_app")
	@ResponseBody
	public boolean regist_Regular_appt(HttpServletRequest request, Model model, @RequestBody Member member) {
		
		
		return (Boolean) miService.service(member);
	}

	@GetMapping("/findID")
	public String findID_Form() {

		return "submits/findID";
	}

	@PostMapping("/findID")
	public String find_Submit(Member member) {

		msiService.service(member);
		mseService.service(member);
		
		System.out.println(member.getEmail());
		System.out.println(member.getName());
		return "submits/findID";
	}

	@GetMapping("/findPW")
	public String findPW_Form() {

		return "submits/findPW";
	}

	@PostMapping("/findPW")
	public String find_Sumit() {

		return "submits/findPW";
	}

	
}
