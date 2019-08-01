package com.tje.yeojeong.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.Review_view;
import com.tje.yeojeong.repository.Review_viewDAO;
import com.tje.yeojeong.setting.PagingInfo;

@Service
public class ReviewCountByMemberService {

	@Autowired
	private Review_viewDAO reviewDAO;
	@Autowired
	private PagingInfo pagingInfo;

	public Object service(Object args) {

		int totalCount = reviewDAO.selectByMemberCount((Review_view) args);
		int totalPageCount = totalCount / pagingInfo.getPagingSize()
				+ (totalCount % pagingInfo.getPagingSize() == 0 ? 0 : 1);

		HashMap<String, Integer> result = new HashMap<String, Integer>();
		result.put("totalCount", totalCount);
		result.put("totalPageCount", totalPageCount);

		return result;
	}
}
