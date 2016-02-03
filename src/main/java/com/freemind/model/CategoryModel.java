package com.freemind.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


@Entity(name="CATEGORIES")
public class CategoryModel {
	@Id
	@GeneratedValue
	@Column(name="CATEGORY_ID")
	int categoryId;

	@Column(name="CATEGORY_NAME",length=200)
	String categoryName;
	
	@Column(name="CATEGORY_DESCIRPTION",length=1000)
	String categoryDescription;
	
	@Column(name="IS_ACTIVE", nullable  = false ,columnDefinition = "boolean default true")
	boolean active;

	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDescription() {
		return categoryDescription;
	}
	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	
	
	
	
}
