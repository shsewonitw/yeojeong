package com.tje.yeojeong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Review_CommentDeleteService {
	
	@Autowired
	private Review_CommentDAO review_CommentDAO;
	
	public Object service(Object args) {
		return review_CommentDAO.delete((Review_Comment)args);
	}
}
