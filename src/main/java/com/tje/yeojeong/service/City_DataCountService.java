package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.repository.City_DataDAO;
import com.tje.yeojeong.repository.Travel_registDAO;

@Service
public class City_DataCountService {
	@Autowired
	private City_DataDAO city_dataDAO;
	
	public Object service() {
		return city_dataDAO.City_DataCount();
	}

}
