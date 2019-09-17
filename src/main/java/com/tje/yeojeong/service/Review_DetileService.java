package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Review_DetileService {
	
	@Autowired
	private Review_viewDAO reviewDAO;
	
	public Object service(HashMap<String, Object> values) {
		
		HashMap<String, Object> result = new HashMap<>();
		
		Review_view review = (Review_view)values.get("review");
		
		result.put("detailreview", reviewDAO.selectAticleId(review));
		result.put("result", result.get("detailreview") != null);
				
		return result;
	}
	
	public Review_view service(Object values) {
		
		return reviewDAO.selectAticleId((Review_view) values);
	}

}
