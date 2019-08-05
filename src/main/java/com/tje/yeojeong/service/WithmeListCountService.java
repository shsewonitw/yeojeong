package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;
import com.tje.yeojeong.setting.*;

@Service
public class WithmeListCountService {
	
	@Autowired
	private Withme_viewDAO withme_viewDAO;
	@Autowired
	private PagingInfo pagingInfo;
	
	public Object service() {
		int totalCount = 
				withme_viewDAO.withme_viewCount();
		int totalPageCount = 
				totalCount / pagingInfo.getPagingSize() +
				(totalCount % pagingInfo.getPagingSize() == 0 ? 0 : 1);
		
		HashMap<String, Integer> result = 
				new HashMap<String, Integer>();
		result.putIfAbsent("totalCount", totalCount);
		result.putIfAbsent("totalPageCount", totalPageCount);
		
		return result;
	}
}
