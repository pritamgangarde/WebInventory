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

import com.freemind.dao.VatDao;
import com.freemind.model.Unit;
import com.freemind.model.Vat;

@Repository("VatDao")
@Transactional
public class VatDaoImpl implements VatDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Vat> getAllVatList() {
		Session session;
		session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		
		Criteria queryCriteria=session.createCriteria(Vat.class);
		queryCriteria.add(Restrictions.eq("active", true));
		List<Vat> listVat =queryCriteria.list();
		return listVat;
	}

	@Override
	public Vat getVatById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Vat.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		Vat vat = (Vat) criteria.uniqueResult();

		return vat;
	}

	@Override
	public void save(Vat vat) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(vat);
		transaction.commit();
		session.clear();
		session.close();

	}


	@Override
	public void deleteVatById(int id) {
		Session session;
		session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Criteria criteria = session.createCriteria(Vat.class);
		criteria.add(Restrictions.eq("id", new Integer(id)));
		session.delete((Vat) criteria.uniqueResult());
		transaction.commit();
		session.clear();
		session.close();

	}

	@Override
	public void update(Vat vat) {
		// TODO Auto-generated method stub
		
	}

}
