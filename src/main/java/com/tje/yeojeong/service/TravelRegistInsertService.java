package com.tje.yeojeong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class TravelRegistInsertService {
	
	@Autowired
	private Travel_registDAO travel_registDAO;
	
	public Object service(Object args) {
		return travel_registDAO.insert( (Travel_regist)args );
	}
}
