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
import dev.sanero.entities.LaptopConfig;

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
	public List<Laptop> getListLaptopByProducerId(int producerId) {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<LaptopConfig> query = session.createQuery("from laptop_config where producer_id=:producerId");
		query.setParameter("producerId", producerId);
		List<LaptopConfig> configs = query.getResultList();
		for (LaptopConfig laptopConfig : configs) {
			laptops.addAll(laptopConfig.getLsLaptop());
		}
		session.close();
		return laptops;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Laptop> getListLaptopIsHot() {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<Laptop> query = session.createQuery("from laptops where hot=1");
		laptops = query.getResultList();
		session.close();
		return laptops;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Laptop> getListLaptopIsDiscount() {
		List<Laptop> laptops = new ArrayList<Laptop>();
		Session session = sessionFactory.openSession();
		Query<Laptop> query = session.createQuery("from laptops where discount > 0 ORDER BY discount DESC");
		laptops = query.getResultList();
		session.close();
		return laptops;
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
