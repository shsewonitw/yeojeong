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
		
		if(searchItem.equals("country")) {
			result.put("ReviewSearch", reviewDAO.selectSerachWhereCountry(searchValue,page));
		}
		else if(searchItem.equals("city")) {
			result.put("ReviewSearch", reviewDAO.selectSerachWhereCity(searchValue,page));
		}
		else if(searchItem.equals("member_id")) {
			result.put("ReviewSearch", reviewDAO.selectSerachWhereMember_id(searchValue,page));
		}
		
		return result;
	}
}
