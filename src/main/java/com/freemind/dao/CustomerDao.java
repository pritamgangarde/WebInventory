package com.freemind.dao;

import java.util.List;

import com.freemind.model.Customer;

public interface CustomerDao {
	public List<Customer> getAllCustomerList();

	public Customer getCustomerById(int id);

	public void save(Customer customer);

	public void update(Customer customer);

	public void deleteCustomerById(int id);

}
