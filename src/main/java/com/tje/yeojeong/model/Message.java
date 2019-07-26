package com.tje.yeojeong.model;

import java.util.*;

import org.springframework.format.annotation.DateTimeFormat;

public class Message {
	private int message_id;
	private String sender_id;
	private String receiver_id;
	private String content;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date send_time;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date receive_time;
	
	public Message() {
	}
	
	public Message(int message_id, String sender_id, String receiver_id, String content, Date send_time,
			Date receive_time) {
		this.message_id = message_id;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.content = content;
		this.send_time = send_time;
		this.receive_time = receive_time;
	}

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public String getSender_id() {
		return sender_id;
	}

	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSend_time() {
		return send_time;
	}

	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}

	public Date getReceive_time() {
		return receive_time;
	}

	public void setReceive_time(Date receive_time) {
		this.receive_time = receive_time;
	}
	
}
