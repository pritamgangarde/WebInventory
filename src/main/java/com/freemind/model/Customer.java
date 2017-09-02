package com.freemind.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CUSTOMER")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "CUSTOMER_NAME")
	String customerName;

	@Column(name = "ADDRESS")
	String address;


	@Column(name = "MOBILE_NO")
	String mobileNo;

	@Column(name = "DEFAULTER",nullable = false, columnDefinition = "boolean default false")
	boolean defaulter=false;

	@Column(name = "IS_ACTIVE",nullable = false, columnDefinition = "boolean default true")
	boolean active=true;

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

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}


	public boolean isDefaulter() {
		return defaulter;
	}

	public void setDefaulter(boolean defaulter) {
		this.defaulter = defaulter;
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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

}
