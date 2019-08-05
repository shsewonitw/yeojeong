package com.tje.yeojeong.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.format.annotation.DateTimeFormat;

public class Withme_request {
	private int request_id;
	private String sender_id;
	private String receiver_id;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date write_time;

	public Withme_request() {
	}

	public Withme_request(int request_id, String sender_id, String receiver_id, Date write_time) {
		super();
		this.request_id = request_id;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.write_time = write_time;
	}

	public final int getRequest_id() {
		return request_id;
	}

	public final void setRequest_id(int request_id) {
		this.request_id = request_id;
	}

	public final String getSender_id() {
		return sender_id;
	}

	public final void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}

	public final String getReceiver_id() {
		return receiver_id;
	}

	public final void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getWrite_timeString() {
		if (write_time == null)
			return "입력된 날짜 오류 관리자에게 문의하세요";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(this.write_time);

	}

	public final Date getWrite_time() {
		return write_time;
	}

	public final void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}

}
