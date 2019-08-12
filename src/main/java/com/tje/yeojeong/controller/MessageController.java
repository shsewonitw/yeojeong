package com.tje.yeojeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.tje.yeojeong.service.*;
import com.tje.yeojeong.model.*;
import com.tje.yeojeong.setting.*;

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private MessageInsertService miService;
	@Autowired
	private MessageSearchByReceiverService msbrService;
	@Autowired
	private MessageSearchBySenderService msbsService;
	@Autowired
	private MessageSearchByIDService messagesbIDService;
	@Autowired
	private MessageUpdateReceiveTimeService murtService;
	@Autowired
	private MessageCountByReceiverService mcbrService;
	@Autowired
	private MessageCountBySenderService mcbsService;
	@Autowired
	private MessageCountByReadService mcbReadService;
	@Autowired
	private MessageSearchReceiverService msrService;
	@Autowired
	private MessageSearchSenderService mssService;
	@Autowired
	private MessageDeleteService mdService;
	@Autowired
	private PagingInfo pagingInfo;
	
	// ----------------------------메세지 수신------------------------
	public String receiveForm(
			Integer page, Model model, HttpSession session) {
		Member loginMember = 
				(Member)session.getAttribute("login_member");
		HashMap<String, Object> args =
				new HashMap<String, Object>();
		
		args.put("curPageNo", page);
		Message message = new Message();
		message.setReceiver_id(loginMember.getMember_id());
		
		args.put("message", message);
		
		model.addAttribute("rList", msbrService.service(args));
		model.addAttribute("messageNo", msbrService.service(args));
		
		HashMap<String, Integer> result = 
				(HashMap<String, Integer>)mcbrService.service(message);
		model.addAttribute(
				"r_count", result.get("totalCount"));
		
		HashMap<String, Integer> read = 
				(HashMap<String, Integer>)mcbReadService.service(message);
		model.addAttribute(
				"readCount", read.get("readCount"));
		
		int totalPageCount = (int)result.get("totalPageCount");
		int startPageNo = 
				(page % pagingInfo.getPageRange() == 0 ? page-1 : page)
				/ pagingInfo.getPageRange() * pagingInfo.getPageRange() + 1;
		int endPageNo = startPageNo + pagingInfo.getPageRange() - 1;
		
		if( endPageNo > totalPageCount )
			endPageNo = totalPageCount;
		
		int beforePageNo = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPageNo = endPageNo != totalPageCount ? endPageNo + 1 : -1;
		
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("beforePageNo", beforePageNo);
		model.addAttribute("afterPageNo", afterPageNo);
		model.addAttribute("curPage", page);
		return "message/receiveForm";
	}
	
	@GetMapping("/receive/{pageNo}")
	public String receiveFormWithPageNo(
			@PathVariable("pageNo") Integer page, 
			Model model, HttpSession session) {
		return receiveForm(page, model, session);
	}
	
	@GetMapping("/receive")
	public String receiveFormNotPageNo(
			Model model, HttpSession session) {
		return receiveForm(1, model, session);
	}
	
	// 받은 메세지 쪽에서 답장하기(받는사람 ID는 session에서 자동 갱신)
	@GetMapping("/retransform/{sender_id}")
	public String transReceiveForm(Message message, Model model, HttpSession session,
			@PathVariable("sender_id") String sender_id) {
		Member loginMember = 
				(Member)session.getAttribute("login_member");
		message.setSender_id(sender_id);
		
		session.setAttribute("receiver_id", loginMember);
		// System.out.println(message.getSender_id());
		return "message/reTransform";
	}
	
	/*
	// 메세지 수신 파트 답장 부분
	@GetMapping("/retransform/{sender_id}")
	public String transReceiveForm(Message message, Model model, HttpSession session,
			@PathVariable("sender_id") String sender_id) {
		Member loginMember = 
				(Member)session.getAttribute("login_member");
		message.setSender_id(sender_id);
		
		model.addAttribute("receiver_id", mssService.service(message));
		// System.out.println(message.getSender_id());
		return "message/reTransform";
	}
	*/
		
	@PostMapping("/retransformsubmit")
	public String reTransformSubmit(Message message, Model model) {
		int message_id = (Integer)miService.service(message);
		model.addAttribute("message_id", message_id);
		return "message/reTransformSubmit";
	}
	
	// 메세지 수신 본문(개별 삭제 포함)
	@GetMapping("/receivecontent/{message_id}")
	public String receiveContent(
			Model model, HttpSession session,
			@PathVariable("message_id") int message_id) {
		Message message = new Message();
		message.setMessage_id(message_id);
		session.getAttribute("message_id");
		
		murtService.service(message);
		model.addAttribute("message", messagesbIDService.service(message));
		return "message/receiveMessage";
	}
	
	@PostMapping("/receivecontent/delete/{message_id}")
	public String receivecontentdeleteSubmit(
			Model model, @PathVariable("message_id") int message_id) {
		Message message = new Message();
		message.setMessage_id(message_id);
		
		HashMap<String, Object> values = new HashMap<>();
		values.put("message", message);
		
		HashMap<String, Object> result = 
				(HashMap<String, Object>)mdService.service(values);
		model.addAttribute("result", result.get("result"));
		
		return "message/receiveDeleteSubmit";
	}
	
	/*
	// 수신 메세지 삭제(체크박스)
	@GetMapping("/message/receivecontent/{message_id}")
	public String deleteReceiveMessage(Model model,
			@PathVariable("message_id") int message_id) throws Exception {
		Message message = new Message();
		message.setMessage_id(message_id);
		
		model.addAttribute("message_id", mdService.service(message));
		
		return "";
	}
	*/
	
	// ----------------------------메세지 송신------------------------
	public String sendForm(
			Integer page, Model model, HttpSession session) {
		Member loginMember = 
				(Member)session.getAttribute("login_member");
		HashMap<String, Object> args =
				new HashMap<String, Object>();
		
		args.put("curPageNo", page);
		Message message = new Message();
		message.setSender_id(loginMember.getMember_id());
		
		args.put("message", message);
		
		model.addAttribute("sList", msbsService.service(args));
		model.addAttribute("messageNo", msbsService.service(args));
		
		HashMap<String, Integer> result = 
				(HashMap<String, Integer>)mcbsService.service(message);
		model.addAttribute(
				"s_count", result.get("totalCount"));
		
		HashMap<String, Integer> read = 
				(HashMap<String, Integer>)mcbReadService.service(message);
		model.addAttribute(
				"readCount", read.get("readCount"));
		
		int totalPageCount = (int)result.get("totalPageCount");
		int startPageNo = 
				(page % pagingInfo.getPageRange() == 0 ? page-1 : page)
				/ pagingInfo.getPageRange() * pagingInfo.getPageRange() + 1;
		int endPageNo = startPageNo + pagingInfo.getPageRange() - 1;
		
		if( endPageNo > totalPageCount )
			endPageNo = totalPageCount;
		
		int beforePageNo = startPageNo != 1 ? startPageNo - pagingInfo.getPageRange() : -1;
		int afterPageNo = endPageNo != totalPageCount ? endPageNo + 1 : -1;
		
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("beforePageNo", beforePageNo);
		model.addAttribute("afterPageNo", afterPageNo);
		model.addAttribute("curPage", page);
		return "message/sendForm";
	}
	
	@GetMapping("/send/{pageNo}")
	public String sendFormWithPageNo(
			@PathVariable("pageNo") Integer page, 
			Model model, HttpSession session) {
		return sendForm(page, model, session);
	}
	
	@GetMapping("/send")
	public String sendFormNotPageNo(
			Model model, HttpSession session) {
		return sendForm(1, model, session);
	}
	
	// 메세지 송신 본문
	@GetMapping("/sendcontent/{message_id}")
	public String sendContent(
			Model model,
			@PathVariable("message_id") int message_id) {
		Message message = new Message();
		message.setMessage_id(message_id);
		
		murtService.service(message);
		model.addAttribute("message", messagesbIDService.service(message));
		return "message/sendMessage";
	}
	
	// 보낸 메세지 쪽에서 답장하기(받는사람 ID는 session에서 자동 갱신)
	@GetMapping("/transform/{receiver_id}")
	public String transSendForm(Message message, Model model, HttpSession session,
			@PathVariable("receiver_id") String receiver_id) {
		Member loginMember = 
				(Member)session.getAttribute("login_member");
		message.setSender_id(receiver_id);
		
		session.setAttribute("receiver_id", loginMember);
		// System.out.println(message.getReceiver_id());
		return "message/transform";
		}
	
	/*
	// 메세지 송신 파트 답장 부분
	@GetMapping("/transform/{receiver_id}")
	public String transSendForm(Message message, Model model, HttpSession session,
			@PathVariable("receiver_id") String receiver_id) {
		Member loginMember = 
				(Member)session.getAttribute("login_member");
		message.setSender_id(receiver_id);
		
		model.addAttribute("receiver_id", msrService.service(message));
		// System.out.println(message.getReceiver_id());
		return "message/transform";
	}
	*/
	
	@PostMapping("/transformsubmit")
	public String transformSubmit(Message message, Model model) {
		int message_id = (Integer)miService.service(message);
		model.addAttribute("message_id", message_id);
		return "message/transformSubmit";
	}
	
}