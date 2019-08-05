package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Review_DeleteService {
	
	@Autowired
	private Review_viewDAO reviewDAO;
	
	public Object service(HashMap<String, Object> values) {
		
		HashMap<String, Object> result = new HashMap<>();
		
		Review_view review = (Review_view)values.get("review");
		
		result.put("result", reviewDAO.delete(review));
				
		return result;
	}
}
