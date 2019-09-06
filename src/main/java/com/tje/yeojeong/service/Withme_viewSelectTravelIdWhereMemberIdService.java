package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.Withme_view;
import com.tje.yeojeong.repository.City_DataDAO;
import com.tje.yeojeong.repository.Travel_registDAO;
import com.tje.yeojeong.repository.Withme_viewDAO;

@Service
public class Withme_viewSelectTravelIdWhereMemberIdService {
	@Autowired
	private Withme_viewDAO withme_viewDAO;
	
	public Object service(Withme_view model) {
		return withme_viewDAO.selectTravelIdWhereMemberId(model);
	}

}
