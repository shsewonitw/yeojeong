package com.tje.yeojeong.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Review_view {
	private int article_id;
	private String member_id;
	private String country;
	private String city;
	private String content;
	private String image_src;
	private int review_star;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date write_time;
	private int read_count;
	private String name;
	private int comment_count;

	public Review_view() {
	}

	public Review_view(int article_id, String member_id, String country, String city, String content, String image_src,
			int review_star, Date write_time, int read_count, String name, int comment_count) {
		super();
		this.article_id = article_id;
		this.member_id = member_id;
		this.country = country;
		this.city = city;
		this.content = content;
		this.image_src = image_src;
		this.review_star = review_star;
		this.write_time = write_time;
		this.read_count = read_count;
		this.name = name;
		this.comment_count = comment_count;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage_src() {
		return image_src;
	}

	public void setImage_src(String image_src) {
		this.image_src = image_src;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
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

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public Date getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}
	
	
	
}