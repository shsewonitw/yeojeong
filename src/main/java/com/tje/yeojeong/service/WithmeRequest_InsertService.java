package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class WithmeRequest_InsertService {
	
	@Autowired
	private Withme_requestDAO withme_requestDAO;
	
	public Object service(Object args) {
		HashMap<String, Object> result = (HashMap<String, Object>)args;
		Withme_request withme_request = (Withme_request)result.get("withme_request");
		result.put("result", withme_requestDAO.insert(withme_request));
		
		return result;
	}
}
