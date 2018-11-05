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

import dev.sanero.entities.Ram;

@Repository
public class RamDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public long getRamCount() {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(id) from rams").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Ram> getListRamByPage(int page, int pageSize) {
		List<Ram> rams = new ArrayList<Ram>();
		Session session = sessionFactory.openSession();
		Query<Ram> query = session.createQuery("from rams");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		rams = query.getResultList();
		session.close();
		return rams;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean delete(int id) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		Query<Object> query = session.createQuery("delete from rams where id = :id");
		query.setParameter("id", id);
		Transaction transaction = session.beginTransaction();
		try {
			status = query.executeUpdate() > 0;
			transaction.commit();
		} catch (Exception e) {
			System.out.println("delete ram failed. Rollback transaction\r\n" + e.getMessage());
			transaction.rollback();
		}
		session.close();
		return status;
	}

	@Transactional
	public boolean insert(Ram ram) {
		Session session = sessionFactory.openSession();
		int count = (Integer) session.save(ram);
		session.close();
		return count > 0;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public Ram getRamById(int id) {
		Ram ram = null;
		Session session = sessionFactory.openSession();
		Query<Ram> query = session.createQuery("from rams where id = :id");
		query.setParameter("id", id);
		ram = query.uniqueResult();
		session.close();
		return ram;
	}

	@Transactional
	public boolean update(Ram ram) {
		Session session = sessionFactory.openSession();
		// begin update
		boolean status = false;
		Transaction transaction = session.beginTransaction();
		try {
			session.update(ram);
			transaction.commit();
			status = true;
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return status;
	}
}
