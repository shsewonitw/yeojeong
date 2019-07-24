package com.tje.yeojeong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.repository.MemberDAO;

@Service
public class MemberSearchService {
	@Autowired
	private MemberDAO memberDAO;
	
	public Object service(Object args) {	
		// 아이디 정보 찾아오기
		return memberDAO.selectOne((Member)args) ;
	}
	
	

}
