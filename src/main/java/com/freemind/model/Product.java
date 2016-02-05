package com.freemind.model;

import java.io.Serializable;
import java.sql.Date;
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
@Table(name = "PRODUCT")
public class Product implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "PRODUCT_CODE")
	String productCode;

	@Column(name = "PRODUCT_NAME")
	String productName;

	@Column(name = "QUANTITY")
	int quantity;

	@Column(name = "UNIT")
	String unit;

	@Column(name = "VAT_PERC")
	double vatPerc;

	@Column(name = "SERVICE_TAX")
	double serviceTax;

	@Column(name = "SALE_RATE")
	double saleRate;

	@Column(name = "CREATED_BY")
	int createdBy;

	@Column(name = "MODIFIED_BY")
	int modifyBy;

	@Column(name = "INSERTION_DATE")
	Date insertionDate;

	@Column(name = "LAST_MODIFIED_DATE")
	Date lastModifyDate;

	@Column(name = "ACTIVITY_STATUS")
	boolean activityStatus;

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	List<Item> listItems;

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	List<SaleOrderDetails> saleOrderDetailsList;

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	List<PurchaseDetails> purchaseDetailsList;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public double getVatPerc() {
		return vatPerc;
	}

	public void setVatPerc(double vatPerc) {
		this.vatPerc = vatPerc;
	}

	public double getServiceTax() {
		return serviceTax;
	}

	public void setServiceTax(double serviceTax) {
		this.serviceTax = serviceTax;
	}

	public double getSaleRate() {
		return saleRate;
	}

	public void setSaleRate(double saleRate) {
		this.saleRate = saleRate;
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

	public List<Item> getListItems() {
		return listItems;
	}

	public void setListItems(List<Item> listItems) {
		this.listItems = listItems;
	}

	public boolean isActivityStatus() {
		return activityStatus;
	}

	public void setActivityStatus(boolean activityStatus) {
		this.activityStatus = activityStatus;
	}

	public List<SaleOrderDetails> getSaleOrderDetailsList() {
		return saleOrderDetailsList;
	}

	public void setSaleOrderDetailsList(
			List<SaleOrderDetails> saleOrderDetailsList) {
		this.saleOrderDetailsList = saleOrderDetailsList;
	}

	public List<PurchaseDetails> getPurchaseDetailsList() {
		return purchaseDetailsList;
	}

	public void setPurchaseDetailsList(List<PurchaseDetails> purchaseDetailsList) {
		this.purchaseDetailsList = purchaseDetailsList;
	}

}
