package com.tje.yeojeong.model;

public class Serach {
	private String searchItem;
	private String searchValue;
	
	public Serach() {
		// TODO Auto-generated constructor stub
	}

	public Serach(String searchItem, String searchValue) {
		super();
		this.searchItem = searchItem;
		this.searchValue = searchValue;
	}

	public String getSearchItem() {
		return searchItem;
	}

	public void setSearchItem(String searchItem) {
		this.searchItem = searchItem;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	
}
