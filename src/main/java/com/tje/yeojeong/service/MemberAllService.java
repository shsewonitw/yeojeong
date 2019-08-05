package com.tje.yeojeong.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.repository.MemberDAO;

@Service
public class MemberAllService {
	@Autowired
	private MemberDAO memberDAO;

	public Object service() {
		 

		return memberDAO.selectAll();
	}

}
