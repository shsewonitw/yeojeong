package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;
import com.tje.yeojeong.setting.PagingInfo;

@Service
public class ReviewListCountService {

	@Autowired
	private Review_viewDAO reviewDAO;
	@Autowired
	private PagingInfo pagingInfo;

	public Object service() {
		
		int totalCount = reviewDAO.reviewCount();
		
		int totalPageCount = totalCount / pagingInfo.getPagingSize() + (totalCount % pagingInfo.getPagingSize() == 0 ? 0 : 1);
			
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		
		result.put("totalCount", totalCount);
		result.put("totalPageCount", totalPageCount);
		
		return result;
	}
}
