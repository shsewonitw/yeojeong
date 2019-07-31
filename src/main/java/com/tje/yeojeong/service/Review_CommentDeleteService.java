package com.tje.yeojeong.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Review_CommentDeleteService {
	
	@Autowired
	private Review_CommentDAO review_CommentDAO;
	
	public Object service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		
		Review_Comment reviewcommnet= (Review_Comment)values.get("reviewcommnet");
				
		result.put("result", review_CommentDAO.delete(reviewcommnet));
						
		return result;
	}
}
