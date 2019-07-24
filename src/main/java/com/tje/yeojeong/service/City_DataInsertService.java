package com.tje.yeojeong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class City_DataInsertService {
	
	@Autowired
	private City_DataDAO city_dataDAO;
	
	public Object service(Object args) {
		return city_dataDAO.insert((City_Data)args);
	}
}
