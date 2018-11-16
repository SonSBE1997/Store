package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.DAO.CustomerDAO;
import dev.sanero.entities.Customer;
import dev.sanero.utils.User;

@Service
public class CustomerService {
	@Autowired
	CustomerDAO customerDAO;

	public boolean checkUsernameExist(String username) {
		return customerDAO.checkUsernameExist(username);
	}

	public boolean checkLogin(User user) {
		return customerDAO.checkLogin(user);
	}

	public User getUserInfoByUsername(String username) {
		return customerDAO.getUserInfoByUsername(username);
	}

	public long getCustomerCount() {
		return customerDAO.getCustomerCount();
	}

	public List<Customer> getListCustomerByPage(int page, int pageSize) {
		return customerDAO.getListCustomerByPage(page, pageSize);
	}

	public boolean delete(int id) {
		return customerDAO.delete(id);
	}

	public boolean insert(Customer customer) {
		return customerDAO.insert(customer);
	}

	public Customer getCustomerById(int id) {
		return customerDAO.getCustomerById(id);
	}

	public boolean update(Customer customer) {
		return customerDAO.update(customer);
	}
}
