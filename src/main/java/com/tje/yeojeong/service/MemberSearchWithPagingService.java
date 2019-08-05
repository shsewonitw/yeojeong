package com.tje.yeojeong.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.Member;
import com.tje.yeojeong.repository.MemberDAO;

@Service
public class MemberSearchWithPagingService {
	@Autowired
	private MemberDAO memberDAO;

	public Object service(Object args) {
		 HashMap<String, Object> values = (HashMap<String, Object>)args;
		 int curPageNo = (Integer)values.get("curPageNo");
		 String searchValue = (String)values.get("searchValue");
		return memberDAO.selectSearchedMemberWithPaging(curPageNo, searchValue);
	}

}
