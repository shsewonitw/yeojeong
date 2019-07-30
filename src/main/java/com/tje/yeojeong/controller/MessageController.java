package com.tje.yeojeong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	private MessageSearchByReceiverDateService msbrdService;
	@Autowired
	private MessageSearchBySenderDateService msbsdService;
	@Autowired
	private PagingInfo pagingInfo;
	
	// 메세지 답장 부분
	@GetMapping("/transform")
	public String transformForm(Message message, Model model, HttpSession session) {
		Member loginMember = 
				(Member)session.getAttribute("login_member");
		HashMap<String, Object> args =
				new HashMap<String, Object>();
		
		message.setReceiver_id(loginMember.getMember_id());
		args.put("message", message);
		model.addAttribute("sender", model);
		return "message/transform";
	}
	
	@PostMapping("/transform")
	public String transformSubmit(Message message, Model model) {
		int message_id = (Integer)miService.service(message);
		model.addAttribute("message_id", message_id);
		return "message/transformSubmit";
	}
	
	// 메세지 수신 부분
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
	
	@PostMapping("/receiveSearch")
	public String receiveSubmit(
			Model model,
			@ModelAttribute("command") MessageSearchCommand command,
			HttpSession session) {
		HashMap<String, Object> args = new HashMap<>();
		args.put("command", command);
		String receiver = 
				((Member)session.getAttribute("login_member")).getMember_id();
		args.put("receiver_id", receiver);
		
		List<Message> searched = 
				(List<Message>)msbrdService.service(args);
		
		model.addAttribute("searched", searched);
		model.addAttribute("searchedCount", searched == null ? 0 : searched.size());
		
		return "message/receiveSearchMessage";
	}
	
	// 메세지 수신 본문
	@GetMapping("/receivecontent/{message_id}")
	public String receiveContent(
			Model model,
			@PathVariable("message_id") int message_id) {
		Message message = new Message();
		message.setMessage_id(message_id);
		
		murtService.service(message);
		model.addAttribute("message", messagesbIDService.service(message));
		return "message/receiveMessage";
	}
	
}