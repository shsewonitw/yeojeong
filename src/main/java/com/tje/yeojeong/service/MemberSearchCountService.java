package com.tje.yeojeong.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.repository.MemberDAO;
import com.tje.yeojeong.setting.PagingInfo;

@Service
public class MemberSearchCountService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private PagingInfo pagingInfo;
	
	public Object service(String searchValue) {
		int totalCount = memberDAO.selectSearchedMemberCount(searchValue);
		int totalPageCount = totalCount / pagingInfo.getPagingSize() + (totalCount % pagingInfo.getPagingSize() == 0 ? 0 : 1 );
		 HashMap<String, Object> result = new HashMap<String, Object>();
		 
		 result.put("totalCount", totalCount);
		 result.put("totalPageCount", totalPageCount);

		return result;
	}

}
