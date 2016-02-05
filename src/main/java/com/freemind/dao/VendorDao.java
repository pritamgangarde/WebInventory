package com.freemind.dao;

import java.util.List;

import com.freemind.model.Vendor;

public interface VendorDao {
	public List<Vendor> getAllVendorList();

	public Vendor getVendorById(int id);

	public void save(Vendor vendor);

	public void update(Vendor vendor);

	public void deleteVendorById(int id);

}
