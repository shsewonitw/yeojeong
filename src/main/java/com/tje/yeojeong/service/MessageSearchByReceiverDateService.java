package com.tje.yeojeong.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.yeojeong.model.*;
import com.tje.yeojeong.repository.*;

@Service
public class MessageSearchByReceiverDateService {
	
	@Autowired
	private MessageDAO messageDAO;
	
	public Object service(Object args) {
		HashMap<String, Object> values =
				(HashMap<String, Object>)args;
		MessageSearchCommand command =
				(MessageSearchCommand)values.get("command");
		String receiver = (String)values.get("receiver");
		
		return messageDAO.selectByReceiver_Date(command, receiver);
	}
}
