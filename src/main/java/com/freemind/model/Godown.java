package com.freemind.model;

import java.sql.Timestamp;

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
	boolean active = true;

	@Column(name = "CREATED_BY")
	int createdBy;

	@Column(name = "MODIFIED_BY")
	int modifyBy;

	@Column(name = "INSERTION_DATE")
	Timestamp insertionDate = new Timestamp(new java.util.Date().getTime());

	@Column(name = "LAST_MODIFIED_DATE")
	Timestamp lastModifyDate = new Timestamp(new java.util.Date().getTime());

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

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getModifyBy() {
		return modifyBy;
	}

	public void setModifyBy(int modifyBy) {
		this.modifyBy = modifyBy;
	}

	public Timestamp getInsertionDate() {
		return insertionDate;
	}

	public void setInsertionDate(Timestamp insertionDate) {
		this.insertionDate = insertionDate;
	}

	public Timestamp getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Timestamp lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	

}
