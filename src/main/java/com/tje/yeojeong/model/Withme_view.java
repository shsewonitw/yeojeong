package com.tje.yeojeong.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Withme_view {
	private int article_id;
	private String member_id;
	private String country;
	private String city;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date start_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end_date;
	private int category_gender;
	private int category_age;
	private int category_style;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date write_time;
	private int travel_id;
	private String name;
	
	public Withme_view() {
	}
	
	public Withme_view(int article_id, String member_id, String country, String city, Date start_date, Date end_date,
			int category_gender, int category_age, int category_style, Date write_time, int travel_id, String name) {
		this.article_id = article_id;
		this.member_id = member_id;
		this.country = country;
		this.city = city;
		this.start_date = start_date;
		this.end_date = end_date;
		this.category_gender = category_gender;
		this.category_age = category_age;
		this.category_style = category_style;
		this.write_time = write_time;
		this.travel_id = travel_id;
		this.name = name;
	}

	public int getArticle_id() {
		return article_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public int getCategory_gender() {
		return category_gender;
	}

	public void setCategory_gender(int category_gender) {
		this.category_gender = category_gender;
	}

	public int getCategory_age() {
		return category_age;
	}

	public void setCategory_age(int category_age) {
		this.category_age = category_age;
	}

	public int getCategory_style() {
		return category_style;
	}

	public void setCategory_style(int category_style) {
		this.category_style = category_style;
	}

	public Date getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}

	public int getTravel_id() {
		return travel_id;
	}

	public void setTravel_id(int travel_id) {
		this.travel_id = travel_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}