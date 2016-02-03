package com.freemind.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GODOWN")
public class Godown {
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;

	@Column(name = "NAME")
	String name;

	@Column(name = "DESCRIPTION")
	String description;

	@Column(name = "LOCATION")
	String location;

	@Column(name = "CITY")
	String city;

	@Column(name = "STATE")
	String state;

	@Column(name = "PINCODE")
	String pincode;

	@Column(name = "LANDLINE_NO")
	String landLineNo;

	@Column(name = "MOBILE_NO")
	String mobileNo;

	@Column(name = "INCHARGE_ID")
	int incharge;

	@Column(name = "IS_ACTIVE", nullable = false, columnDefinition = "boolean default true")
	boolean active;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getLandLineNo() {
		return landLineNo;
	}

	public void setLandLineNo(String landLineNo) {
		this.landLineNo = landLineNo;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public int getIncharge() {
		return incharge;
	}

	public void setIncharge(int incharge) {
		this.incharge = incharge;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

}
