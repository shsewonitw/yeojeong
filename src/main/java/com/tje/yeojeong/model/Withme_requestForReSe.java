package com.tje.yeojeong.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.format.annotation.DateTimeFormat;

public class Withme_requestForReSe {
	private int request_id;
	private String sender_id;
	private String receiver_id;
	private String statue;
	private String country;
	private String city;
	@DateTimeFormat
	private Date start_date;
	@DateTimeFormat
	private Date end_date;
	@DateTimeFormat
	private Date write_time;
	private int gender;
	private String name;

	public Withme_requestForReSe() {
	}

	public Withme_requestForReSe(int request_id, String sender_id, String receiver_id, String statue, String country,
			String city, Date start_date, Date end_date, Date write_time, int gender, String name) {
		super();
		this.request_id = request_id;
		this.sender_id = sender_id;
		this.receiver_id = receiver_id;
		this.statue = statue;
		this.country = country;
		this.city = city;
		this.start_date = start_date;
		this.end_date = end_date;
		this.write_time = write_time;
		this.gender = gender;
		this.name = name;
	}

	public final String getCountry() {
		return country;
	}

	public final void setCountry(String country) {
		this.country = country;
	}

	public final String getCity() {
		return city;
	}

	public final void setCity(String city) {
		this.city = city;
	}

	public String getStart_dateString() {
		if (start_date == null)
			return "입력된 날짜 오류 관리자에게 문의하세요";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.start_date);

	}

	public final Date getStart_date() {
		return start_date;
	}

	public final void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public String getEnd_dateString() {
		if (end_date == null)
			return "입력된 날짜 오류 관리자에게 문의하세요";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.end_date);

	}

	public final Date getEnd_date() {
		return end_date;
	}

	public final void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public final String getStatue() {
		return statue;
	}

	public final void setStatue(String statue) {
		this.statue = statue;
	}

	public final int getGender() {
		return gender;
	}

	public final void setGender(int gender) {
		this.gender = gender;
	}

	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
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

	public String getGenderString() {
		return gender == 1 ? "남성" : "여성";
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
