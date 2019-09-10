package com.tje.yeojeong.model;

public class Withme_requestDuple {
	private String member_id;
	private int article_id;
	private int request_id;


	public Withme_requestDuple() {
		super();
	}


	public Withme_requestDuple(String member_id, int article_id, int request_id) {
		super();
		this.member_id = member_id;
		this.article_id = article_id;
		this.request_id = request_id;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getArticle_id() {
		return article_id;
	}


	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	
	public int getRequest_id() {
		return request_id;
	}


	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}
	
}
