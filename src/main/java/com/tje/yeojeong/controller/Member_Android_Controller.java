package com.tje.yeojeong.controller;

import java.util.ArrayList;
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

import com.tje.yeojeong.model.City_Data;
import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.model.Review_view;
import com.tje.yeojeong.model.Travel_regist;
import com.tje.yeojeong.model.Withme_request;
import com.tje.yeojeong.service.City_DataSelectCountryService;
import com.tje.yeojeong.service.MemberInsertService;
import com.tje.yeojeong.service.MemberKAKAOInsertService;
import com.tje.yeojeong.service.MemberLoginService;
import com.tje.yeojeong.service.MemberSearchIDService;
import com.tje.yeojeong.service.ReviewCountByMemberService;
import com.tje.yeojeong.service.ReviewSearchByMemberService;
import com.tje.yeojeong.service.ReviewSelectWhereIdService;
import com.tje.yeojeong.service.TravelRegistDeleteService;
import com.tje.yeojeong.service.TravelRegistUpdateService;
import com.tje.yeojeong.service.TravelSearchedTravelListService;
import com.tje.yeojeong.service.WithmeRequest_ReceiveService;
import com.tje.yeojeong.service.WithmeRequest_SendService;
import com.tje.yeojeong.setting.PagingInfo;

@Controller
public class Member_Android_Controller {

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
	private PagingInfo pagingInfo;

	

	@PostMapping("/android_login")
	@ResponseBody
	public HashMap<String, Object> android_login_sumit(Member member, HttpSession session) {
		System.out.println("안드로이드 로그인!");
		boolean login_flag = false;

		HashMap<String, Object> result = new HashMap<String, Object>();
		if (session.getAttribute("login_member") != null) {
<<<<<<< HEAD
			login_flag = true;
=======
			login_flag=true;
>>>>>>> 436bf0aee02fe34feecaec5e94f23679b86f4cf2
			result.put("result", login_flag);
			result.put("login_message", "이미 접속중인 아이디 입니다.");
			return result;
		}

		// 아이디 검사
		Member search_ID = (Member) msiService.service(member);
		if (search_ID == null) {
			// 없는 아이디
			result.put("login_message", "존재하지 않는 아이디 입니다.");
		} else {
			// 아이디 체크 성공
			// 비밀번호 검사
			if (!(Boolean) mlservice.service(member)) {
				// 로그인 실패(비밀번호)
				result.put("login_message", "비밀번호가 틀렸습니다.");
			}
			session.setAttribute("login_member", search_ID);
			result.put("login_message", "로그인 성공");
			login_flag = true;
			result.put("result", login_flag);
		}
		return result;
	}

	@PostMapping("/android_logout")
	@ResponseBody
	public HashMap<String, Object> android_logout_sumit(HttpSession session) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		if(session.getAttribute("login_member") != null) {
			result.put("result", "true");
		}
		
		return result;
	}
	

	@PostMapping("/auth/mypage")
	@ResponseBody
	public HashMap<String, Object> mypage_Form(HttpSession session, Model model) {

		return mypageForm(1, model, session);
	}

	@PostMapping("/auth/mypage/{pageNo}")
	@ResponseBody
	public HashMap<String, Object> mypage_Form(@PathVariable(value = "pageNo") Integer page, HttpSession session, Model model) {
		model.addAttribute("mypagelistname", "write");

		return mypageForm(page, model, session);
	}

	private HashMap<String, Object> mypageForm(Integer page, Model model, HttpSession session) {
		System.out.println(111);
		HashMap<String, Object> android_result = new HashMap<String, Object>();
		
		Review_view review_view = new Review_view();
		Member member = (Member) session.getAttribute("login_member");
		Withme_request Withme_request = new Withme_request();
		System.out.println(member.getMember_id());

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

		HashMap<String, Object> args = new HashMap<String, Object>();
		args.put("curPageNo", page);
		review_view.setMember_id(member.getMember_id());
		args.put("review_view", review_view);

		// 내가 쓴글 관련
		model.addAttribute("rList", rsbimervice.service(args));
		android_result.put("rList",  rsbimervice.service(args));
		System.out.println(((List<Review_view>)rsbimervice.service(args)).get(1).getArticle_id());
		List<Review_view> a =(List<Review_view>)(android_result.get("rList") );
		System.out.println(a.get(0).getArticle_id());
		System.out.println(a.get(0).getWrite_time());
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

		return android_result;
	}

	

}
