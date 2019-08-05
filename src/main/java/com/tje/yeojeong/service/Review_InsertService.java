package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Review_InsertService {
	
	@Autowired
	private Review_viewDAO reviewDAO;
	
	public Object service(Object args) {
		
		HashMap<String, Object> values = (HashMap<String, Object>)args;
		
		Review_view reviewview = (Review_view)values.get("reviewview");
				
		values.put("result", reviewDAO.insert(reviewview));
		
		
		
		return values;
	}
}
