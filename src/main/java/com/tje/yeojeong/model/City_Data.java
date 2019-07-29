package com.tje.yeojeong.model;



public class City_Data {
	private int city_code;
	private String country;
	private String city;
	private String local_time;
	private String flight_time;
	private String local_voltage;
	private String visa;
	private String latitude;
	private String longitude;
	private int danger_level;
	private String image_src; // 썸네일용
	private String image_src2; // 내부 사진용
	
	public City_Data() {}

	public City_Data(int city_code, String country, String city, String local_time, String flight_time,
			String local_voltage, String visa, String latitude, String longitude, int danger_level, String image_src,
			String image_src2) {
		super();
		this.city_code = city_code;
		this.country = country;
		this.city = city;
		this.local_time = local_time;
		this.flight_time = flight_time;
		this.local_voltage = local_voltage;
		this.visa = visa;
		this.latitude = latitude;
		this.longitude = longitude;
		this.danger_level = danger_level;
		this.image_src = image_src;
		this.image_src2 = image_src2;
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

	public String getLocal_time() {
		return local_time;
	}

	public void setLocal_time(String local_time) {
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

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getDanger_level() {
		return danger_level;
	}

	public void setDanger_level(int danger_level) {
		this.danger_level = danger_level;
	}

	public String getImage_src() {
		return image_src;
	}

	public void setImage_src(String image_src) {
		this.image_src = image_src;
	}

	public String getImage_src2() {
		return image_src2;
	}

	public void setImage_src2(String image_src2) {
		this.image_src2 = image_src2;
	}





	
}
