package com.tje.yeojeong.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.repository.MemberDAO;

@Service
public class MemberChangeTelService {
	@Autowired
	private MemberDAO memberDAO;
	// test
	public Object service(Object args) {
		
		return memberDAO.changeTel((Member) args);
	}

}
