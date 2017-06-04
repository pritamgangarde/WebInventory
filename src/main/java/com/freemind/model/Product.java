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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

	@Column(name = "PRODUCT_DESCR")
	String productDescription;

	@Column(name = "QUANTITY")
	int quantity;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "UNIT_ID", nullable = true)
	Unit unitModel;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "VAT_ID", nullable = true)
	Vat vat;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "SERVICE_TAX_ID", nullable = true)
	ServiceTax serviceTax;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "GODWAN_ID", nullable = true)
	 Godown godowanModel;

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


	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CATEGORY_ID", nullable = true)
	CategoryModel categoryModel;

	@Column(name = "ACTIVITY_STATUS", nullable = false, columnDefinition = "boolean default true")
	boolean activityStatus = true;

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	List<Item> listItems;

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	List<SaleOrderDetails> saleOrderDetailsList;

	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	List<PurchaseDetails> purchaseDetailsList;

	public Godown getGodowanModel() {
		return godowanModel;
	}

	public void setGodowanModel(Godown godowanModel) {
		this.godowanModel = godowanModel;
	}

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

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Unit getUnitModel() {
		return unitModel;
	}

	public void setUnitModel(Unit unitModel) {
		this.unitModel = unitModel;
	}

	public Vat getVat() {
		return vat;
	}

	public void setVat(Vat vat) {
		this.vat = vat;
	}

	public ServiceTax getServiceTax() {
		return serviceTax;
	}

	public void setServiceTax(ServiceTax serviceTax) {
		this.serviceTax = serviceTax;
	}

	public CategoryModel getCategoryModel() {
		return categoryModel;
	}

	public void setCategoryModel(CategoryModel categoryModel) {
		this.categoryModel = categoryModel;
	}

}
