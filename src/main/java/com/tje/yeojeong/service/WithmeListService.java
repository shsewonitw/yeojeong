package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class WithmeListService {
	
	@Autowired
	private Withme_viewDAO withme_viewDAO;
	
	public HashMap<String, Object> service(int page) {
		HashMap<String, Object> result = new HashMap<>();
		
		result.put("withmelist", withme_viewDAO.selectAll(page));
		
		return result;
	}
}
