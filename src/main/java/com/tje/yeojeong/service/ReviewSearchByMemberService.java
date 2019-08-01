package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class ReviewSearchByMemberService {
	
	@Autowired
	private Review_viewDAO reviewDAO;
	
	public Object service(Object args) {
		
		HashMap<String, Object> values = (HashMap<String, Object>)args;
		int curPageNo =  (Integer)values.get("curPageNo");
		Review_view review_view =(Review_view)values.get("review_view");
				
		return reviewDAO.selectByMember(curPageNo, review_view);
	}
}
