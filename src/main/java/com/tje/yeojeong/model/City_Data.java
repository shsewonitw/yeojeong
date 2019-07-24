package com.tje.yeojeong.model;

import java.util.*;

import org.springframework.format.annotation.DateTimeFormat;

public class City_Data {
	private int city_code;
	private String country;
	private String city;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date local_time;
	private String flight_time;
	private String local_voltage;
	private String visa;
	private String latitude;
	private String logitude;
	private int danger_level;
	
	public City_Data(int city_code, String country, String city, Date local_time, String flight_time,
			String local_voltage, String visa, String latitude, String logitude, int danger_level) {
		this.city_code = city_code;
		this.country = country;
		this.city = city;
		this.local_time = local_time;
		this.flight_time = flight_time;
		this.local_voltage = local_voltage;
		this.visa = visa;
		this.latitude = latitude;
		this.logitude = logitude;
		this.danger_level = danger_level;
	}

	public int getCity_code() {
		return city_code;
	}

	public void setCity_code(int city_code) {
		this.city_code = city_code;
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

	public Date getLocal_time() {
		return local_time;
	}

	public void setLocal_time(Date local_time) {
		this.local_time = local_time;
	}

	public String getFlight_time() {
		return flight_time;
	}

	public void setFlight_time(String flight_time) {
		this.flight_time = flight_time;
	}

	public String getLocal_voltage() {
		return local_voltage;
	}

	public void setLocal_voltage(String local_voltage) {
		this.local_voltage = local_voltage;
	}

	public String getVisa() {
		return visa;
	}

	public void setVisa(String visa) {
		this.visa = visa;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLogitude() {
		return logitude;
	}

	public void setLogitude(String logitude) {
		this.logitude = logitude;
	}
	
	public String getDanger_levelString() {
		return danger_level == 1 ? "안전" : "유의";
	}

	public int getDanger_level() {
		return danger_level;
	}

	public void setDanger_level(int danger_level) {
		this.danger_level = danger_level;
	}
	
}
