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

import dev.sanero.entities.Customer;
import dev.sanero.utils.Common;
import dev.sanero.utils.User;

@Repository
public class CustomerDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean checkUsernameExist(String username) {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		Query<Object> query = session.createQuery("Select count(c.id) from customers c where c.username = :username");
		query.setParameter("username", username);
		long count = (Long) query.uniqueResult();
		session.close();
		return count > 0;
	}

	@Transactional
	public boolean checkLogin(User user) {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		Query<Object> query = session.createQuery(
				"Select count(c.id) from customers c where c.username = :username and c.password = :password");
		query.setParameter("username", user.getUsername());
		query.setParameter("password", Common.encryptMD5(user.getPassword()));
		long count = (Long) query.uniqueResult();
		session.close();
		return count > 0;
	}

	@Transactional
	public User getUserInfoByUsername(String username) {
		Session session = sessionFactory.openSession();
		int id = (Integer) session.createQuery("select id from customers where username = :username")
				.setParameter("username", username).uniqueResult();
		String name = (String) session.createQuery("select name from customers where username = :username")
				.setParameter("username", username).uniqueResult();
		session.close();
		return new User(id, username, "", name);
	}

	@Transactional
	public int getIdByUsername(String username) {
		Session session = sessionFactory.openSession();
		int id = (Integer) session.createQuery("select id from customers where username = :username")
				.setParameter("username", username).uniqueResult();
		session.close();
		return id;
	}

	@Transactional
	public long getCustomerCount() {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(c.id) from customers c").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Customer> getListCustomerByPage(int page, int pageSize) {
		List<Customer> customers = new ArrayList<Customer>();
		Session session = sessionFactory.openSession();
		Query<Customer> query = session.createQuery("from customers");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		customers = query.getResultList();
		session.close();
		return customers;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean delete(int id) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		Query<Object> query = session.createQuery("delete from customers where id = :id");
		query.setParameter("id", id);
		Transaction transaction = session.beginTransaction();
		try {
			status = query.executeUpdate() > 0;
			transaction.commit();
		} catch (Exception e) {
			System.out.println("delete customer failed. Rollback transaction\r\n" + e.getMessage());
			transaction.rollback();
		}
		session.close();
		return status;
	}

	@Transactional
	public boolean insert(Customer customer) {
		Session session = sessionFactory.openSession();
		if ((Long) session.createQuery("select count(id) from customers where username = :username")
				.setParameter("username", customer.getUsername()).uniqueResult() > 0)
			return false;
		customer.setPassword(Common.encryptMD5(customer.getPassword()));
		int count = (Integer) session.save(customer);
		session.close();
		return count > 0;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public Customer getCustomerById(int id) {
		Customer customer = null;
		Session session = sessionFactory.openSession();
		Query<Customer> query = session.createQuery("from customers where id = :id");
		query.setParameter("id", id);
		customer = query.uniqueResult();
		session.close();
		return customer;
	}

	@Transactional
	public boolean update(Customer customer) {
		Session session = sessionFactory.openSession();
		// check id unique
		if ((Long) session.createQuery("select count(id) from customers where username = :username")
				.setParameter("username", customer.getUsername()).uniqueResult() > 0) {
			int id = (Integer) session.createQuery("select id from customers where username = :username")
					.setParameter("username", customer.getUsername()).uniqueResult();
			if (id != customer.getId())
				return false;
		}

		customer.setPassword(Common.encryptMD5(customer.getPassword()));
		// begin update
		boolean status = false;
		Transaction transaction = session.beginTransaction();
		try {
			session.update(customer);
			transaction.commit();
			status = true;
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return status;
	}
}
