package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.VatDao;
import com.freemind.model.Vat;
import com.freemind.services.VatService;

@Service("VatService")
public class VatServiceImpl implements VatService {

	@Autowired
	VatDao vatDao;

	@Override
	public List<Vat> getAllVatList() {
		return vatDao.getAllVatList();
	}

	@Override
	public Vat getVatById(int id) {
		return vatDao.getVatById(id);
	}

	@Override
	public void save(Vat vat) {
		vatDao.save(vat);
	}

	@Override
	public void update(Vat vat) {
		vatDao.update(vat);
	}

	@Override
	public void deleteVatById(int id) {
		vatDao.deleteVatById(id);
	}

}
