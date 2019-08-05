package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class WithmeCountService {
	
	@Autowired
	private Withme_viewDAO withme_viewDAO;
	
	public Object service(HashMap<String, Object> values) {
		HashMap<String, Object> result = new HashMap<>();
		Withme_view withme = (Withme_view)values.get("withme");

		result.put("result",withme_viewDAO.AticleCount(withme));
				
		return result;
	}
}
