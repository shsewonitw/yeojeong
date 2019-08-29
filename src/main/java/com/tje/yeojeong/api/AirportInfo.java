package com.tje.yeojeong.api;

public class AirportInfo {
	String cgtdt; 
    String cgthm; 
    String gate1; 
    String gate2; 
    String gate3; 
    String gate4; 
    String gateinfo1; 
    String gateinfo2;
    String gateinfo3; 
    String gateinfo4;

    public AirportInfo() {
	}
	
    public AirportInfo(String cgtdt, String cgthm, String gate1, String gate2, String gate3, String gate4,
			String gateinfo1, String gateinfo2, String gateinfo3, String gateinfo4) {
		this.cgtdt = cgtdt;
		this.cgthm = cgthm;
		this.gate1 = gate1;
		this.gate2 = gate2;
		this.gate3 = gate3;
		this.gate4 = gate4;
		this.gateinfo1 = gateinfo1;
		this.gateinfo2 = gateinfo2;
		this.gateinfo3 = gateinfo3;
		this.gateinfo4 = gateinfo4;
	}
    
    public AirportInfo(String cgtdt, String cgthm, String gate1, String gate2, String gateinfo1, String gateinfo2) {
    	this.cgtdt = cgtdt;
		this.cgthm = cgthm;
		this.gate1 = gate1;
		this.gate2 = gate2;

		this.gateinfo1 = gateinfo1;
		this.gateinfo2 = gateinfo2;

    }

	public String getCgtdt() {
		return cgtdt;
	}

	public void setCgtdt(String cgtdt) {
		this.cgtdt = cgtdt;
	}

	public String getCgthm() {
		return cgthm;
	}

	public void setCgthm(String cgthm) {
		this.cgthm = cgthm;
	}

	public String getGate1() {
		return gate1;
	}

	public void setGate1(String gate1) {
		this.gate1 = gate1;
	}

	public String getGate2() {
		return gate2;
	}

	public void setGate2(String gate2) {
		this.gate2 = gate2;
	}

	public String getGate3() {
		return gate3;
	}

	public void setGate3(String gate3) {
		this.gate3 = gate3;
	}

	public String getGate4() {
		return gate4;
	}

	public void setGate4(String gate4) {
		this.gate4 = gate4;
	}

	public String getGateinfo1() {
		return gateinfo1;
	}

	public void setGateinfo1(String gateinfo1) {
		this.gateinfo1 = gateinfo1;
	}

	public String getGateinfo2() {
		return gateinfo2;
	}

	public void setGateinfo2(String gateinfo2) {
		this.gateinfo2 = gateinfo2;
	}

	public String getGateinfo3() {
		return gateinfo3;
	}

	public void setGateinfo3(String gateinfo3) {
		this.gateinfo3 = gateinfo3;
	}

	public String getGateinfo4() {
		return gateinfo4;
	}

	public void setGateinfo4(String gateinfo4) {
		this.gateinfo4 = gateinfo4;
	}
    
    
}
