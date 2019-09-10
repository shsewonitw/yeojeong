package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class WithmeSelectService {
	
	@Autowired
	private Withme_viewDAO withme_viewDAO;
	
	public List<Withme_view> service(Withme_view obj) {
		
		List<Withme_view> result = withme_viewDAO.select(obj);
		
		return result;
	}
}
