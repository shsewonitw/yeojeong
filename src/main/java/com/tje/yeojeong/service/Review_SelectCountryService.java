package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class Review_SelectCountryService {
	
	@Autowired
	private Review_viewDAO reviewDAO;
	
	public Object service(Object args) {
				
		return 	(List<Review_view>)reviewDAO.selectcountry((Review_view)args);
	}
}
