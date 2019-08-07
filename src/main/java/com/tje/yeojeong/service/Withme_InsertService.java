package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Withme_InsertService {
	
	@Autowired
	private Withme_viewDAO withme_viewDAO;
	
	public Object service(Object args) {
		HashMap<String, Object> result = (HashMap<String, Object>)args;
		Withme_view withme_view = (Withme_view)result.get("withme_view");
		result.put("result", withme_viewDAO.insert(withme_view));
		
		return result;
	}
}
