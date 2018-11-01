package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.DAO.EmployeeDAO;
import dev.sanero.entities.Employee;
import dev.sanero.utils.User;

@Service
public class EmployeeService {
	@Autowired
	EmployeeDAO employeeDAO;

	public boolean checkLogin(User user) {
		return employeeDAO.checkLogin(user);
	}

	public long getTotalEmployeeCount() {
		return employeeDAO.getTotalEmployeeCount();
	}

	public List<Employee> getAllEmployee() {
		return employeeDAO.getAllEmployee();
	}

	public List<Employee> getListEmployeeByPage(int page, int pageSize) {
		return employeeDAO.getListEmployeeByPage(page, pageSize);
	}

	public List<Employee> getListEmployeeByPageAndTag(String search, int page, int pageSize) {
		return employeeDAO.getListEmployeeByPageAndTag(search, page, pageSize);
	}

	public boolean delete(int id) {
		return employeeDAO.delete(id);
	}

	public int getNextEmployeeId() {
		return employeeDAO.getNextEmployeeId();
	}

	public boolean insert(Employee employee) {
		return employeeDAO.insert(employee);
	}
}
