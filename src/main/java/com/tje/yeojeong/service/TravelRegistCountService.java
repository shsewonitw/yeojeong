package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.repository.Travel_registDAO;

@Service
public class TravelRegistCountService {
	@Autowired
	private Travel_registDAO travel_registDAO;
	
	public Object service() {
		return travel_registDAO.Travel_registCount();
	}

}
