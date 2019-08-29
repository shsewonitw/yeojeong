package com.tje.yeojeong.api;

public class AirportParking {

	String floor;
	String parking;
	String parkingarea;
	
	public AirportParking(String floor, String parking, String parkingarea) {
		super();
		this.floor = floor;
		this.parking = parking;
		this.parkingarea = parkingarea;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getParkingarea() {
		return parkingarea;
	}

	public void setParkingarea(String parkingarea) {
		this.parkingarea = parkingarea;
	}
	
	
	
}
