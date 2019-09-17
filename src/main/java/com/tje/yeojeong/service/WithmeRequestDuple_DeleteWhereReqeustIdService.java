package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class WithmeRequestDuple_DeleteWhereReqeustIdService {
	
	@Autowired
	private Withme_requestDupleDAO withme_requestdupleDAO;
	
	public Object service(Withme_requestDuple args) {
		return withme_requestdupleDAO.deleteWhereRequestID(args);
	}
}
