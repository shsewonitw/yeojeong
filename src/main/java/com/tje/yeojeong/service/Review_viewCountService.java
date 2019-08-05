package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.repository.City_DataDAO;
import com.tje.yeojeong.repository.Review_viewDAO;
import com.tje.yeojeong.repository.Travel_registDAO;

@Service
public class Review_viewCountService {
	@Autowired
	private Review_viewDAO review_viewDAO;
	
	public Object service() {
		return review_viewDAO.review_viewCount();
	}

}
