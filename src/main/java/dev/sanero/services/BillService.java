package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.DAO.BillDAO;
import dev.sanero.entities.Order;

@Service
public class BillService {
	@Autowired
	BillDAO billDAO;

	public int getBillPriceByYear(int year) {
		return billDAO.getBillPriceByYear(year);
	}

	public List<Order> getListOrderByPage(int page, int pageSize) {
		return billDAO.getListOrderByPage(page, pageSize);
	}

	public long getBillCount() {
		return billDAO.getBillCount();
	}

	public boolean changeStatus(int id, int userId) {
		return billDAO.changeStatus(id, userId);
	}

}
