package com.tje.yeojeong.model;

import java.util.*;

import org.springframework.format.annotation.DateTimeFormat;

public class MessageSearchCommand {
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date from;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date to;
	
	public MessageSearchCommand() {
	}

	public MessageSearchCommand(Date from, Date to) {
		this.from = from;
		this.to = to;
	}

	public Date getFrom() {
		return from;
	}

	public void setFrom(Date from) {
		this.from = from;
	}

	public Date getTo() {
		return to;
	}

	public void setTo(Date to) {
		this.to = to;
	}
	
}
