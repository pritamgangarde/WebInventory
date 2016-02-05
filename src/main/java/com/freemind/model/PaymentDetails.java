package com.freemind.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "PAYMENT_DETAILS")
public class PaymentDetails implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "PAYMENT_MODE")
	String paymentMode;

	@Column(name = "BANK_NAME")
	String bankName;

	@Column(name = "BRANCH_NAME")
	String branchName;

	@Column(name = "CHEQUE_TRANSACTION_NO")
	String chequeTransactionNo;

	@Column(name = "AMOUNT")
	double amount;

	@Column(name = "PAYMENT_TYPE")
	String paymentType;

	@Column(name = "PAYMENT_STATUS")
	String paymentStatus;
	
	@OneToOne
	@PrimaryKeyJoinColumn
	private PurchasePaymentDetails purchasePaymentDetails;
	
	@OneToOne
	@PrimaryKeyJoinColumn
	private SalePaymentDetails salePaymentDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getChequeTransactionNo() {
		return chequeTransactionNo;
	}

	public void setChequeTransactionNo(String chequeTransactionNo) {
		this.chequeTransactionNo = chequeTransactionNo;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	

}
