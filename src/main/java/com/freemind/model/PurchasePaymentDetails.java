package com.freemind.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "PURCHASE_PAYMENT_DETAILS")
public class PurchasePaymentDetails implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "PURCHASE_ID")
	Purchase purchase;

	@OneToOne(mappedBy = "purchasePaymentDetails", cascade = CascadeType.ALL)
	private PaymentDetails paymentDetail;

	@Column(name = "CREATED_BY")
	int createdBy;

	@Column(name = "MODIFIED_BY")
	int modifyBy;

	@Column(name = "INSERTION_DATE")
	Date insertionDate;

	@Column(name = "LAST_MODIFIED_DATE")
	Date lastModifyDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public PaymentDetails getPaymentDetail() {
		return paymentDetail;
	}

	public void setPaymentDetail(PaymentDetails paymentDetail) {
		this.paymentDetail = paymentDetail;
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

	public Date getInsertionDate() {
		return insertionDate;
	}

	public void setInsertionDate(Date insertionDate) {
		this.insertionDate = insertionDate;
	}

	public Date getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}
}
