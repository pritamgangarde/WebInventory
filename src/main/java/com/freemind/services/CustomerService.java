package com.freemind.services;

import java.util.List;

import com.freemind.model.Customer;

public interface CustomerService {
	public List<Customer> getAllCustomerList();

	public Customer getCustomerById(int id);

	public void save(Customer customer);

	public void update(Customer customer);

	public void deleteCustomerById(int id);

}
