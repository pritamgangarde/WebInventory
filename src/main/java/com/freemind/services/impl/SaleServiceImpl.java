package com.freemind.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.freemind.dao.SaleDao;
import com.freemind.model.Sale;
import com.freemind.services.SaleService;


@Service("SaleService")
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDao saleDao;

	@Override
	public List<Sale> getAllSaleList() {
		return saleDao.getAllSaleList();
	}

	@Override
	public Sale getSaleById(int id) {
		return saleDao.getSaleById(id);
	}

	@Override
	public void save(Sale sale) {
		saleDao.save(sale);
	}

	@Override
	public void update(Sale sale) {
		saleDao.update(sale);
	}

	@Override
	public void deleteSaleById(int id) {
		saleDao.deleteSaleById(id);
	}

}
