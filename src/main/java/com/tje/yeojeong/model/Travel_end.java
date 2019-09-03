package com.tje.yeojeong.model;

import java.util.Date;

public class Travel_end {
	
	private int travel_id;
	private String member_id;
	private String help_tel;
	private Date start_date;
	private Date end_date;
	private String country;
	private String city;

	
	
	public Travel_end() {
	}

	public Travel_end(int travel_id, String member_id, String help_tel, Date start_date, Date end_date,
			String country, String city) {
		this.travel_id = travel_id;
		this.member_id = member_id;
		this.help_tel = help_tel;
		this.start_date = start_date;
		this.end_date = end_date;
		this.country = country;
		this.city = city;
	}

	public int getTravel_id() {
		return travel_id;
	}

	public void setTravel_id(int travel_id) {
		this.travel_id = travel_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getHelp_tel() {
		return help_tel;
	}

	public void setHelp_tel(String help_tel) {
		this.help_tel = help_tel;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	
	
	
}