package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.repository.City_DataDAO;
import com.tje.yeojeong.repository.Review_CommentDAO;
import com.tje.yeojeong.repository.Travel_registDAO;

@Service
public class CommentLastInsertIdService {
	@Autowired
	private Review_CommentDAO review_CommentDAO;
	
	public Object service() {
		return review_CommentDAO.last_insert_id();
	}

}
