package dev.sanero.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.engine.jdbc.connections.spi.ConnectionProvider;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dev.sanero.entities.Order;

@Repository
public class BillDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public long getBillCount() {
		long count;
		Session session = sessionFactory.openSession();
		count = (Long) session.createQuery("select count(id) from orders").uniqueResult();
		session.close();
		return count;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Order> getListOrderByPage(int page, int pageSize) {
		List<Order> order = new ArrayList<Order>();
		Session session = sessionFactory.openSession();
		Query<Order> query = session.createQuery("from orders");
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		order = query.getResultList();
		session.close();
		return order;
	}

	@Transactional
	public boolean changeStatus(int id, int userId) {
		Session session = sessionFactory.openSession();
		// begin update
		Transaction transaction = session.beginTransaction();
		Order order = session.get(Order.class, id);
		order.setModified_by(userId);
		order.setStatus(!order.isStatus());
		try {
			session.update(order);
			transaction.commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			transaction.rollback();
		}
		session.close();
		return order.isStatus();
	}

	@Transactional
	public int getBillPriceByYear(int year) {
		int total = 0;
		try {
			Connection connection = sessionFactory.getSessionFactoryOptions().getServiceRegistry()
					.getService(ConnectionProvider.class).getConnection();
			CallableStatement call = connection.prepareCall("{ ? = call getBillPriceByYear(?) }");
			call.registerOutParameter(1, Types.INTEGER);
			call.setLong(2, year);
			call.execute();
			total = call.getInt(1);
			connection.close();
		} catch (SQLException e) {
			System.out.println("Error call function");
			e.printStackTrace();
		}
		return total;
	}
}