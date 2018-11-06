package dev.sanero.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dev.sanero.entities.LaptopConfig;

@Repository
public class ConfigDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public long getConfigCount() {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(id) from laptop_config").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<LaptopConfig> getListConfig() {
		List<LaptopConfig> configs = new ArrayList<LaptopConfig>();
		Session session = sessionFactory.openSession();
		Query<LaptopConfig> query = session.createQuery("from laptop_config");
		configs = query.getResultList();
		session.close();
		return configs;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<LaptopConfig> getListConfigByPage(int page, int pageSize) {
		List<LaptopConfig> configs = new ArrayList<LaptopConfig>();
		Session session = sessionFactory.openSession();
		Query<LaptopConfig> query = session.createQuery("from laptop_config");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		configs = query.getResultList();
		session.close();
		return configs;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean delete(int id) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		Query<Object> query = session.createQuery("delete from laptop_config where id = :id");
		query.setParameter("id", id);
		Transaction transaction = session.beginTransaction();
		try {
			status = query.executeUpdate() > 0;
			transaction.commit();
		} catch (Exception e) {
			System.out.println("delete laptop_config failed. Rollback transaction\r\n" + e.getMessage());
			transaction.rollback();
		}
		session.close();
		return status;
	}

	@Transactional
	public boolean insert(LaptopConfig laptopConfig) {
		Session session = sessionFactory.openSession();
		int count = (Integer) session.save(laptopConfig);
		session.close();
		return count > 0;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public LaptopConfig getConfigById(int id) {
		LaptopConfig config = null;
		Session session = sessionFactory.openSession();
		Query<LaptopConfig> query = session.createQuery("from laptop_config where id = :id");
		query.setParameter("id", id);
		config = query.uniqueResult();
		session.close();
		return config;
	}

	@Transactional
	public boolean update(LaptopConfig config) {
		Session session = sessionFactory.openSession();
		// begin update
		boolean status = false;
		Transaction transaction = session.beginTransaction();
		try {
			session.update(config);
			transaction.commit();
			status = true;
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return status;
	}
}
