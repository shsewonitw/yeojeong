package com.tje.yeojeong.model;

public class QA_Article {
	public int articled_id;
	public String title;
	public String content;

	public QA_Article() {
	}

	public QA_Article(int articled_id, String title, String content) {		
		this.articled_id = articled_id;
		this.title = title;
		this.content = content;
	}

	public int getArticled_id() {
		return articled_id;
	}

	public void setArticled_id(int articled_id) {
		this.articled_id = articled_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
