package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Android_Review_list_Service {
	
	@Autowired
	private Review_viewDAO review_viewDAO;
	
	public Object service(Object args) {
		
		return review_viewDAO.selectAll();
		}
	}

