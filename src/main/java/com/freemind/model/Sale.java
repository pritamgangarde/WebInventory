package com.freemind.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "SALE")
public class Sale implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "BILL_NO")
	int billNo;

	@Column(name = "SALE_ORDER_NO")
	int saleOrderNo;

	@Column(name = "TOTAL_AMOUNT")
	double totalAmount;

	@Column(name = "DISCOUNT_PERC")
	double discountPerc;

	@Column(name = "DISCOUNT_RS")
	double discountRs;

	@OneToMany(mappedBy = "sale", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	List<SaleDetails> listSaleDetails;

	@OneToMany(mappedBy = "sale", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	List<SalePaymentDetails> listSalePaymentDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBillNo() {
		return billNo;
	}

	public void setBillNo(int billNo) {
		this.billNo = billNo;
	}

	public int getSaleOrderNo() {
		return saleOrderNo;
	}

	public void setSaleOrderNo(int saleOrderNo) {
		this.saleOrderNo = saleOrderNo;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public double getDiscountPerc() {
		return discountPerc;
	}

	public void setDiscountPerc(double discountPerc) {
		this.discountPerc = discountPerc;
	}

	public double getDiscountRs() {
		return discountRs;
	}

	public void setDiscountRs(double discountRs) {
		this.discountRs = discountRs;
	}

	public List<SaleDetails> getListSaleDetails() {
		return listSaleDetails;
	}

	public void setListSaleDetails(List<SaleDetails> listSaleDetails) {
		this.listSaleDetails = listSaleDetails;
	}

	public List<SalePaymentDetails> getListSalePaymentDetails() {
		return listSalePaymentDetails;
	}

	public void setListSalePaymentDetails(
			List<SalePaymentDetails> listSalePaymentDetails) {
		this.listSalePaymentDetails = listSalePaymentDetails;
	}

}
