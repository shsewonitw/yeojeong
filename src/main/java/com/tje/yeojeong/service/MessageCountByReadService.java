package com.tje.yeojeong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class MessageCountByReadService {
	
	@Autowired
	private MessageDAO messageDAO;
	
	public Object service(Object args) {
		int readCount = 
				messageDAO.selectByReadCount((Message)args);
		Message test = (Message)args;
		HashMap<String, Integer> result = 
				new HashMap<String, Integer>();
		result.putIfAbsent("readCount", readCount);
		
		return result;
	}
}
