package com.tje.yeojeong.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class WithmeDeleteService {
	
	@Autowired
	private Withme_viewDAO withme_viewDAO;
	
	public Object service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Withme_view withme_view = (Withme_view)values.get("withme_view");
		result.put("result", withme_viewDAO.delete(withme_view));
		return result;
	}
}
