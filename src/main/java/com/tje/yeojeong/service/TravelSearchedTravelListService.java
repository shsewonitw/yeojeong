package com.tje.yeojeong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class TravelSearchedTravelListService {

	@Autowired
	private Travel_registDAO travel_registDAO;

	public Object service(Object args) {
		return travel_registDAO.selectWhereMember_id((Travel_regist) args);
	}
}
