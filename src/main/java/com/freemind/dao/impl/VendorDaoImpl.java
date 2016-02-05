package com.freemind.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.freemind.dao.VendorDao;
import com.freemind.model.Vendor;
import com.freemind.model.Unit;

@Repository("VendorDao")
@Transactional
public class VendorDaoImpl implements VendorDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Vendor> getAllVendorList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Vendor> listVendor = session.createCriteria(Vendor.class)
				.list();

		return listVendor;
	}

	@Override
	public Vendor getVendorById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Vendor.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Vendor vendor = (Vendor) criteria.uniqueResult();

		return vendor;
	}

	@Override
	public void save(Vendor vendor) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(vendor);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Vendor vendor) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(vendor);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteVendorById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Vendor.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
