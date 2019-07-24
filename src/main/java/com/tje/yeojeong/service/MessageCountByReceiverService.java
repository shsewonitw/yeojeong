package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;
import com.tje.yeojeong.setting.*;

@Service
public class MessageCountByReceiverService {
	
	@Autowired
	private MessageDAO messageDAO;
	@Autowired
	private PagingInfo pagingInfo;
	
	public Object service(Object args) {
		int totalCount = 
				messageDAO.selectByReceiverCount((Message)args);
		int totalPageCount = 
				totalCount / pagingInfo.getPagingSize() +
				(totalCount % pagingInfo.getPagingSize() == 0 ? 0 : 1);
		
		HashMap<String, Integer> result = 
				new HashMap<String, Integer>();
		result.putIfAbsent("totalCount", totalCount);
		result.putIfAbsent("totalPageCount", totalPageCount);
		
		return result;
	}
}
