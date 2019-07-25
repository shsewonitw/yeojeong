package com.tje.yeojeong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class QA_ArticleDeleteService {
	
	@Autowired
	private QA_articleDAO qa_articleDAO;
	
	public Object service(Object args) {
		return qa_articleDAO.insert((QA_Article)args);
	}
}
