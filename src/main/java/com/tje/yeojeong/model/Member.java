package com.tje.yeojeong.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	private String member_id;
	private String password;
	private String name;
	private int gender;
	@DateTimeFormat
	private Date birth;
	private String tel;
	private String email;
	@DateTimeFormat
	private Date regist_date;
	private int level;

	public Member() {
	}

	public Member(String member_id, String password, String name, int gender, Date birth, String tel, String email,
			Date regist_date, int level) {
		super();
		this.member_id = member_id;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.tel = tel;
		this.email = email;
		this.regist_date = regist_date;
		this.level = level;
	}

	public final String getMember_id() {
		return member_id;
	}

	public final void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public final String getPassword() {
		return password;
	}

	public final void setPassword(String password) {
		this.password = password;
	}

	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
	}

	public String getGenderString() {
		return gender == 1 ? "남성" : "여성";
	}

	public final int getGender() {
		return gender;
	}

	public final void setGender(int gender) {
		this.gender = gender;
	}

	public ArrayList<String> getBirthStringToken() {
		ArrayList<String> strbirth = new ArrayList<String>();
		if (birth == null)
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		StringTokenizer token = new StringTokenizer(sdf.format(birth), "-");

		while (token.hasMoreTokens()) {

			strbirth.add(token.nextToken());

		}
		return strbirth;
	}

	public String getBirthString() {
		if (birth == null)
			return "생년월일이 입력되지 않았습니다.";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sdf.format(birth);
	}

	public final Date getBirth() {
		return birth;
	}

	public void setBirth(int year, int month, int day) {
		if (year == 0 || month == 0 || day == 0)
			return;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String source = String.format("%04d-%02d-%02d", year, month, day);
		try {
			this.birth = sdf.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	public void setBirth(String source) {
		SimpleDateFormat sdf = 
				new SimpleDateFormat("yyyy-MM-dd");		
		try {
			this.birth = sdf.parse(source);
		} catch (ParseException e) {			
			e.printStackTrace();
		}
	}

	public final void setBirth(Date birth) {
		this.birth = birth;
	}

	public final String getTel() {
		return tel;
	}

	public final void setTel(String tel) {
		this.tel = tel;
	}

	public final String getEmail() {
		return email;
	}

	public final void setEmail(String email) {
		this.email = email;
	}

	public String getRegist_dateString() {
		SimpleDateFormat sdf = 
				new SimpleDateFormat("yyyy년 MM월 dd일");		
		return sdf.format(regist_date);
	}
	
	public final Date getRegist_date() {
		return regist_date;
	}

	public final void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}

	public final int getLevel() {
		return level;
	}

	public final void setLevel(int level) {
		this.level = level;
	}

}
