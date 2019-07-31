package com.tje.yeojeong.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.repository.MemberDAO;
import com.tje.yeojeong.setting.PagingInfo;

@Service
public class MemberCountService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private PagingInfo pagingInfo;
	
	public Object service() {
		int totalCount = memberDAO.selectMemberCount();
		int totalPageCount = totalCount / pagingInfo.getPagingSize() + (totalCount % pagingInfo.getPagingSize() == 0 ? 0 : 1 );
		 HashMap<String, Object> result = new HashMap<String, Object>();
		 
		 result.put("totalCount", totalCount);
		 result.put("totalPageCount", totalPageCount);

		return result;
	}

}
