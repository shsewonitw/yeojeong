package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.repository.City_DataDAO;
import com.tje.yeojeong.repository.Travel_registDAO;
import com.tje.yeojeong.repository.Withme_requestDAO;

@Service
public class Withme_requestCountService {
	@Autowired
	private Withme_requestDAO withme_requestDAO;
	
	public Object service() {
		return withme_requestDAO.Withme_RequestCount();
	}

}
