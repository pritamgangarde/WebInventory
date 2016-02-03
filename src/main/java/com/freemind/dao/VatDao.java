package com.freemind.dao;

import java.util.List;

import com.freemind.model.Vat;

public interface VatDao {
	public List<Vat> getAllVatList();

	public Vat getVatById(int id);

	public void save(Vat vat);

	public void update(Vat vat);

	public void deleteVatById(int id);

}
