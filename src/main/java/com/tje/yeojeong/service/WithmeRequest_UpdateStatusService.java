package com.tje.yeojeong.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.Withme_request;
import com.tje.yeojeong.repository.Withme_requestDAO;

@Service
public class WithmeRequest_UpdateStatusService {
	@Autowired
	private Withme_requestDAO withme_requestDAO;
	
	public Object service(Object objs) {
		return withme_requestDAO.update_Status((Withme_request)objs);
	}

}
