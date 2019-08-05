package com.tje.yeojeong.service;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.repository.City_DataDAO;
import com.tje.yeojeong.repository.Review_viewDAO;
import com.tje.yeojeong.repository.Travel_registDAO;
import com.tje.yeojeong.setting.PagingInfo;

@Service
public class Review_SerachCountService {
	@Autowired
	private Review_viewDAO review_viewDAO;
	@Autowired
	private PagingInfo pagingInfo;
	
	public Object service(String searchItem, String searchValue) {
		int totalCount = review_viewDAO.review_SerachCount(searchItem, searchValue);
		
		int totalPageCount = totalCount / pagingInfo.getPagingSize() + (totalCount % pagingInfo.getPagingSize() == 0 ? 0 : 1);
			
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		
		result.put("totalCount", totalCount);
		result.put("totalPageCount", totalPageCount);
		
		return result;
	}

}
