package com.tje.yeojeong.model;

import java.util.*;


public class review_comment {
	public int comment_id;
	public String member_id;
	public int article_id;
	public String content;
	public Date write_time;

	public review_comment() {
	}

	public review_comment(int comment_id, String member_id, int article_id, String content, Date write_time) {		
		this.comment_id = comment_id;
		this.member_id = member_id;
		this.article_id = article_id;
		this.content = content;
		this.write_time = write_time;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}
	
	

}
