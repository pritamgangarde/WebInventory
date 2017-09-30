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

import com.freemind.dao.SaleDao;
import com.freemind.model.Sale;
import com.freemind.model.Unit;

@Repository("SaleDao")
@Transactional
public class SaleDaoImpl implements SaleDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Sale> getAllSaleList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		List<Sale> listSale = session.createCriteria(Sale.class)
				.list();

		return listSale;
	}

	@Override
	public Sale getSaleById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Sale.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Sale sale = (Sale) criteria.uniqueResult();

		return sale;
	}

	@Override
	public void save(Sale sale) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(sale);
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Sale sale) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.update(sale);
		transaction.commit();
		session.clear();
		session.close();
	}

	@Override
	public void deleteSaleById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Sale.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Unit) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

}
