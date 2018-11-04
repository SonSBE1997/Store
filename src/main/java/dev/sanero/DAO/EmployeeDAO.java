package dev.sanero.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dev.sanero.entities.Employee;
import dev.sanero.utils.User;

@Repository
public class EmployeeDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean checkLogin(User user) {
		Session session = sessionFactory.openSession();
		@SuppressWarnings("unchecked")
		Query<Object> query = session.createQuery(
				"Select count(e.id) from employees e where e.username = :username and e.password = :password");
		query.setParameter("username", user.getUsername());
		query.setParameter("password", user.getPassword());
		long count = (Long) query.uniqueResult();
		session.close();
		return count > 0;
	}

	@Transactional
	public long getTotalEmployeeCount() {
		long count = 0;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(e.id) from employees e").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Employee> getAllEmployee() {
		List<Employee> employees = new ArrayList<Employee>();
		Session session = sessionFactory.openSession();
		employees = session.createQuery("from employees").getResultList();
		session.close();
		return employees;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Employee> getListEmployeeByPage(int page, int pageSize) {
		List<Employee> employees = new ArrayList<Employee>();
		Session session = sessionFactory.openSession();
		Query<Employee> query = session.createQuery("from employees");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		employees = query.getResultList();
		session.close();
		return employees;
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<Employee> getListEmployeeByPageAndTag(String search, int page, int pageSize) {
		List<Employee> employees = new ArrayList<Employee>();
		Session session = sessionFactory.openSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		QueryBuilder queryBuilder = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Employee.class)
				.get();

		if (search != "") {
			org.apache.lucene.search.Query query = queryBuilder.keyword()
					.onFields("name", "phoneNumber", "address", "email", "username").matching(search).createQuery();
			Query<Employee> hibQuery = fullTextSession.createFullTextQuery(query, Employee.class);
			hibQuery.setFirstResult((page - 1) * pageSize);
			hibQuery.setMaxResults(pageSize);
			employees = hibQuery.list();
		} else {
			employees = session.createQuery("from employees").list();
		}
		session.close();
		return employees;
	}

	@Transactional
	public void assignIndex() {
		try {
			Session session = sessionFactory.getCurrentSession();
			FullTextSession fullTextSession = Search.getFullTextSession(session);
			fullTextSession.createIndexer().startAndWait();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public boolean delete(int id) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		Query<Object> query = session.createQuery("delete from employees e where e.id = :id");
		query.setParameter("id", id);
		Transaction transaction = session.beginTransaction();
		try {
			status = query.executeUpdate() > 0;
			transaction.commit();
		} catch (Exception e) {
			System.out.println("delete error. Rollback transaction\r\n" + e.getMessage());
			transaction.rollback();
		}
		session.close();
		return status;
	}

	@Transactional
	public int getNextEmployeeId() {
		int index = 0;
		Session session = sessionFactory.openSession();
		index = (Integer) session.createQuery("select max(e.id) from employees e").uniqueResult();
		session.close();
		return index + 1;
	}

	@Transactional
	public boolean insert(Employee employee) {
		Session session = sessionFactory.openSession();
		if ((Long) session.createQuery("select count(id) from employees e where username = :username")
				.setParameter("username", employee.getUsername()).uniqueResult() > 0)
			return false;
		int count = (Integer) session.save(employee);
		session.close();
		return count > 0;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public Employee getEmployeeById(int id) {
		Employee employee = null;
		Session session = sessionFactory.openSession();
		Query<Employee> query = session.createQuery("from employees where id = :id");
		query.setParameter("id", id);
		employee = query.uniqueResult();
		session.close();
		return employee;
	}

	@Transactional
	public boolean update(Employee employee) {
		Session session = sessionFactory.openSession();
		// check id unique
		if ((Long) session.createQuery("select count(id) from employees e where username = :username")
				.setParameter("username", employee.getUsername()).uniqueResult() > 0) {
			int id = (Integer) session.createQuery("select id from employees e where username = :username")
					.setParameter("username", employee.getUsername()).uniqueResult();
			if (id != employee.getId())
				return false;
		}

		// begin update
		boolean status = false;
		Transaction transaction = session.beginTransaction();
		try {
			session.update(employee);
			transaction.commit();
			status = true;
		} catch (Exception e) {
			transaction.rollback();
		}
		session.close();
		return status;
	}
}
