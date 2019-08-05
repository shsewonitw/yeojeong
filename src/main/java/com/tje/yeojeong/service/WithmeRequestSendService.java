package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.Withme_request;
import com.tje.yeojeong.repository.Withme_requestDAO;

@Service
public class WithmeRequestSendService {
	@Autowired
	private Withme_requestDAO withme_requestDAO;
	
	public Object service(Object objs) {
		return withme_requestDAO.selectSendRequest((Withme_request)objs);
	}

}
