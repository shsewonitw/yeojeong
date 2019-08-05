package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class ReviewListService {
	
	@Autowired
	private Review_viewDAO reviewDAO;
	
	public HashMap<String, Object> service(int page) {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("reviewlist", reviewDAO.selectAll(page));
		
		return result;
	}
	}

