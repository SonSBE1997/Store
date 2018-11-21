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

import dev.sanero.entities.Laptop;

@Repository
public class LaptopDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public long getLaptopCount() {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(id) from laptops").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Laptop> getListLaptopByPage(int page, int pageSize) {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<Laptop> query = session.createQuery("from laptops");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		laptops = query.getResultList();
		session.close();
		return laptops;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Laptop> getListLaptopByProducerIdAndPaging(int producerId, int page, int pageSize) {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<Laptop> query = session
				.createQuery("select l from laptops as l " + "left JOIN fetch l.configuration as c "
						+ "left JOIN fetch c.producer as p " + "where p.id = :producerId");
		query.setParameter("producerId", producerId);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		laptops = query.getResultList();
		session.close();
		return laptops;
	}

	@Transactional
	public long getLaptopCountByProducerId(int producerId) {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session
				.createQuery("select count(l.id) from laptops as l " + "left JOIN l.configuration as c "
						+ "left JOIN c.producer as p " + "where p.id = :producerId")
				.setParameter("producerId", producerId).uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Laptop> getListLaptopHot() {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<Laptop> query = session.createQuery("from laptops where hot=1");
		laptops = query.getResultList();
		session.close();
		return laptops;
	}

	@Transactional
	public long getLaptopHotCount() {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(id) from laptops where hot=1").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Laptop> getListLaptopHotByPage(int page, int pageSize) {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<Laptop> query = session.createQuery("from laptops where hot=1");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		laptops = query.getResultList();
		session.close();
		return laptops;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Laptop> getListLaptopDiscount() {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<Laptop> query = session.createQuery("from laptops where discount > 0 ORDER BY discount DESC");
		laptops = query.getResultList();
		session.close();
		return laptops;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Laptop> getListLaptopDiscountByPage(int page, int pageSize) {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<Laptop> query = session.createQuery("from laptops where discount > 0 ORDER BY discount DESC");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		laptops = query.getResultList();
		session.close();
		return laptops;
	}

	@Transactional
	public long getLaptopDiscountCount() {
		long count = 0;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(id) from laptops where discount > 0").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean delete(int id) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		Query<Object> query = session.createQuery("delete from laptops where id = :id");
		query.setParameter("id", id);
		Transaction transaction = session.beginTransaction();
		try {
			status = query.executeUpdate() > 0;
			transaction.commit();
		} catch (Exception e) {
			System.out.println("delete laptops failed. Rollback transaction\r\n" + e.getMessage());
			transaction.rollback();
		}
		session.close();
		return status;
	}

	@Transactional
	public boolean insert(Laptop laptop) {
		Session session = sessionFactory.openSession();
		int count = (Integer) session.save(laptop);
		session.close();
		return count > 0;
	}

	@Transactional
	public Laptop getLaptopById(int id) {
		Laptop laptop = null;
		Session session = sessionFactory.openSession();
		laptop = session.find(Laptop.class, id);
		session.close();
		return laptop;
	}

	@Transactional
	public boolean update(Laptop laptop) {
		Session session = sessionFactory.openSession();
		// begin update
		boolean status = false;
		Transaction transaction = session.beginTransaction();
		try {
			session.update(laptop);
			transaction.commit();
			status = true;
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return status;
	}

	@Transactional
	public boolean changeHot(int id) {
		Session session = sessionFactory.openSession();
		// begin update
		Transaction transaction = session.beginTransaction();
		Laptop laptop = session.get(Laptop.class, id);
		laptop.setHot(!laptop.isHot());
		try {
			session.update(laptop);
			transaction.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			transaction.rollback();
		}
		session.close();
		return laptop.isHot();
	}
}
