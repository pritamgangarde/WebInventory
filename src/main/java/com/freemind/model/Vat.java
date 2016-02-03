package com.freemind.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "VAT")
public class Vat {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "VAT_PERCENT")
	double vatPercent;

	@Column(name = "IS_ACTIVE", nullable = false, columnDefinition = "boolean default true")
	boolean active;

	@Column(name = "CREATED_BY")
	int createdBy;

	@Column(name = "CREATED_DATE")
	Date createdAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getVatPercent() {
		return vatPercent;
	}

	public void setVatPercent(double vatPercent) {
		this.vatPercent = vatPercent;
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

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

}
