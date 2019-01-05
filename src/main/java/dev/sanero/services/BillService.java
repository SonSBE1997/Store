package dev.sanero.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.dao.BillDAO;
import dev.sanero.entities.Order;

@Service
public class BillService {
	@Autowired
	BillDAO billDAO;

	public List<Order> getListOrderByPage(int page, int pageSize) {
		return billDAO.getListOrderByPage(page, pageSize);
	}

	public List<Order> getListOrderByMonthAndYear(int month, int year) {
		return billDAO.getListOrderByMonthAndYear(month, year);
	}

	public long getBillCount() {
		return billDAO.getBillCount();
	}

	public boolean changeStatus(int id, int userId) {
		return billDAO.changeStatus(id, userId);
	}

	public int getBillPriceByYear(int year) {
		return billDAO.getBillPriceByYear(year);
	}

	public int getBillPriceByMonthAndYear(int month, int year) {
		return billDAO.getBillPriceByMonthAndYear(month, year);
	}

	public List<Integer> getListBillPriceByYear(int year) {
		List<Integer> lsBillPrice = new ArrayList<Integer>();
		for (int i = 0; i < 12; i++) {
			lsBillPrice.add(getBillPriceByMonthAndYear(i + 1, year));
		}
		return lsBillPrice;
	}

	public boolean insert(Order order) {
		return billDAO.insert(order);
	}
}
