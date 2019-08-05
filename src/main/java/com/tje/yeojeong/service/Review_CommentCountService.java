package com.tje.yeojeong.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Review_CommentCountService {
	
	@Autowired
	private Review_CommentDAO review_CommentDAO;
	
	public Object service(HashMap<String, Object> values) {
		
		HashMap<String, Object> result = new HashMap<>();
		
		Review_Comment model = (Review_Comment)values.get("model");
		
		result.put("commentSize",review_CommentDAO.commentCount(model));
						
		return result;
	}
}
