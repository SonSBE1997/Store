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

import dev.sanero.entities.Producer;

@Repository
public class ProducerDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public long getProducerCount() {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(id) from producers").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Producer> getListProducer() {
		List<Producer> producers = new ArrayList<Producer>();
		Session session = sessionFactory.openSession();
		producers = session.createQuery("from producers").getResultList();
		session.close();
		return producers;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Producer> getListProducerByPage(int page, int pageSize) {
		List<Producer> producers = new ArrayList<Producer>();
		Session session = sessionFactory.openSession();
		Query<Producer> query = session.createQuery("from producers");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		producers = query.getResultList();
		session.close();
		return producers;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean delete(int id) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		Query<Object> query = session.createQuery("delete from producers where id = :id");
		query.setParameter("id", id);
		Transaction transaction = session.beginTransaction();
		try {
			status = query.executeUpdate() > 0;
			transaction.commit();
		} catch (Exception e) {
			System.out.println("delete producers failed. Rollback transaction\r\n" + e.getMessage());
			transaction.rollback();
		}
		session.close();
		return status;
	}

	@Transactional
	public boolean insert(Producer producer) {
		Session session = sessionFactory.openSession();
		int count = (Integer) session.save(producer);
		session.close();
		return count > 0;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public Producer getProducerById(int id) {
		Producer producer = null;
		Session session = sessionFactory.openSession();
		Query<Producer> query = session.createQuery("from producers where id = :id");
		query.setParameter("id", id);
		producer = query.uniqueResult();
		session.close();
		return producer;
	}

	@Transactional
	public boolean update(Producer producer) {
		Session session = sessionFactory.openSession();
		// begin update
		boolean status = false;
		Transaction transaction = session.beginTransaction();
		try {
			session.update(producer);
			transaction.commit();
			status = true;
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return status;
	}
}
