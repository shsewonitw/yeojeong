package com.tje.yeojeong.setting;

import java.util.ArrayList;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.ApplicationScope;

@ApplicationScope
@Component
public class AndroidChatInfo {
	
	ArrayList<String> chatList = new ArrayList<String>();
	
	public AndroidChatInfo() {}
	
	public ArrayList<String> getChatList() {
		return chatList;
		
	}
}
