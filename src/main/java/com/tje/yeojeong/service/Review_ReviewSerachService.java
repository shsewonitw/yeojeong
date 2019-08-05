package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Review_ReviewSerachService {
	
	@Autowired
	private Review_viewDAO reviewDAO;
	
	public Object service(HashMap<String, Object> values, int page) {
		HashMap<String, Object> result = new HashMap<>();
				
		String searchItem = (String)values.get("searchItem");
		String searchValue = (String)values.get("searchValue");
		
		result.put("ReviewSearch", reviewDAO.selectSerach(searchItem, searchValue,page));
		
		return result;
	}
}
