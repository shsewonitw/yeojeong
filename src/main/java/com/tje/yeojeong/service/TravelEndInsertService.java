package com.tje.yeojeong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class TravelEndInsertService {
	
	@Autowired
	private Travel_endDAO travel_endDAO;
	
	public Object service(Object args) {
		return travel_endDAO.insert( (Travel_end)args );
	}
}
