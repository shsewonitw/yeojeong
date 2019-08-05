package com.tje.yeojeong.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Withme_view {
	private int article_id;
	private String member_id;
	private int category_gender;
	private int category_style;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date write_time;
	private int read_count;
	private String name;

	public Withme_view() {
	}

	public Withme_view(int article_id, String member_id, int category_gender, int category_style, Date write_time,
			int read_count, String name) {
		this.article_id = article_id;
		this.member_id = member_id;
		this.category_gender = category_gender;
		this.category_style = category_style;
		this.write_time = write_time;
		this.read_count = read_count;
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

	public int getCategory_gender() {
		return category_gender;
	}

	public void setCategory_gender(int category_gender) {
		this.category_gender = category_gender;
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

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}