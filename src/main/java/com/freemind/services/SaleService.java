package com.freemind.services;

import java.util.List;

import com.freemind.model.Sale;

public interface SaleService {
	public List<Sale> getAllSaleList();

	public Sale getSaleById(int id);

	public void save(Sale sale);

	public void update(Sale sale);

	public void deleteSaleById(int id);
}
