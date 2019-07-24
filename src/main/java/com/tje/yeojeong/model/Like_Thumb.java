package com.tje.yeojeong.model;

public class Like_Thumb {
	private int article_id;
	private String member_id;
	
	public Like_Thumb(int article_id, String member_id) {
		this.article_id = article_id;
		this.member_id = member_id;
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
	
}
