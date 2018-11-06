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

import dev.sanero.entities.CPU;

@Repository
public class CpuDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public long getCPUCount() {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(id) from cpus").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<CPU> getListCPU() {
		List<CPU> cpus = new ArrayList<CPU>();
		Session session = sessionFactory.openSession();
		cpus = session.createQuery("from cpus").getResultList();
		session.close();
		return cpus;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<CPU> getListCPUByPage(int page, int pageSize) {
		List<CPU> cpus = new ArrayList<CPU>();
		Session session = sessionFactory.openSession();
		Query<CPU> query = session.createQuery("from cpus");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		cpus = query.getResultList();
		session.close();
		return cpus;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean delete(int id) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		Query<Object> query = session.createQuery("delete from cpus where id = :id");
		query.setParameter("id", id);
		Transaction transaction = session.beginTransaction();
		try {
			status = query.executeUpdate() > 0;
			transaction.commit();
		} catch (Exception e) {
			System.out.println("delete cpu failed. Rollback transaction\r\n" + e.getMessage());
			transaction.rollback();
		}
		session.close();
		return status;
	}

	@Transactional
	public boolean insert(CPU cpu) {
		Session session = sessionFactory.openSession();
		int count = (Integer) session.save(cpu);
		session.close();
		return count > 0;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public CPU getCPUById(int id) {
		CPU cpu = null;
		Session session = sessionFactory.openSession();
		Query<CPU> query = session.createQuery("from cpus where id = :id");
		query.setParameter("id", id);
		cpu = query.uniqueResult();
		session.close();
		return cpu;
	}

	@Transactional
	public boolean update(CPU cpu) {
		Session session = sessionFactory.openSession();
		// begin update
		boolean status = false;
		Transaction transaction = session.beginTransaction();
		try {
			session.update(cpu);
			transaction.commit();
			status = true;
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return status;
	}
}
