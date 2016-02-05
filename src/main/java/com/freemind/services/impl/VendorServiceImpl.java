package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.VendorDao;
import com.freemind.model.Vendor;
import com.freemind.services.VendorService;

@Service("VendorService")
public class VendorServiceImpl implements VendorService {

	@Autowired
	VendorDao vendorDao;

	@Override
	public List<Vendor> getAllVendorList() {
		return vendorDao.getAllVendorList();
	}

	@Override
	public Vendor getVendorById(int id) {
		return vendorDao.getVendorById(id);
	}

	@Override
	public void save(Vendor vendor) {
		vendorDao.save(vendor);
	}

	@Override
	public void update(Vendor vendor) {
		vendorDao.update(vendor);
	}

	@Override
	public void deleteVendorById(int id) {
		vendorDao.deleteVendorById(id);
	}

}
