package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.dao.LaptopDAO;
import dev.sanero.entities.Laptop;

@Service
public class LaptopService {
	@Autowired
	LaptopDAO laptopDAO;

	public long getLaptopCount() {
		return laptopDAO.getLaptopCount();
	}

	public List<Laptop> getListLaptopByPage(int page, int pageSize) {
		return laptopDAO.getListLaptopByPage(page, pageSize);
	}

	public List<Laptop> getListLaptopByPage(int page, int pageSize, String sort) {
		return laptopDAO.getListLaptopByPage(page, pageSize, sort);
	}

	public boolean delete(int id) {
		return laptopDAO.delete(id);
	}

	public boolean insert(Laptop laptop) {
		return laptopDAO.insert(laptop);
	}

	public boolean update(Laptop laptop) {
		return laptopDAO.update(laptop);
	}

	public Laptop getLaptopById(int id) {
		return laptopDAO.getLaptopById(id);
	}

	public boolean changeHot(int id) {
		return laptopDAO.changeHot(id);
	}

	public List<Laptop> getListLaptopHot() {
		return laptopDAO.getListLaptopHot();
	}

	public List<Laptop> getListLaptopByProducerIdAndPaging(int producerId, int page, int pageSize) {
		return laptopDAO.getListLaptopByProducerIdAndPaging(producerId, page, pageSize);
	}

	public List<Laptop> getListLaptopByProducerIdAndPaging(int producerId, int page, int pageSize, String sort) {
		return laptopDAO.getListLaptopByProducerIdAndPaging(producerId, page, pageSize, sort);
	}

	public long getLaptopCountByProducerId(int producerId) {
		return laptopDAO.getLaptopCountByProducerId(producerId);
	}

	public List<Laptop> getListLaptopDiscount() {
		return laptopDAO.getListLaptopDiscount();
	}

	public List<Laptop> getListLaptopDiscountByPage(int page, int pageSize) {
		return laptopDAO.getListLaptopDiscountByPage(page, pageSize);
	}

	public List<Laptop> getListLaptopDiscountByPage(int page, int pageSize, String sort) {
		return laptopDAO.getListLaptopDiscountByPage(page, pageSize, sort);
	}

	public List<Laptop> getListLaptopHotByPage(int page, int pageSize) {
		return laptopDAO.getListLaptopHotByPage(page, pageSize);
	}

	public List<Laptop> getListLaptopHotByPage(int page, int pageSize, String sort) {
		return laptopDAO.getListLaptopHotByPage(page, pageSize, sort);
	}

	public long getLaptopDiscountCount() {
		return laptopDAO.getLaptopDiscountCount();
	}

	public long getLaptopHotCount() {
		return laptopDAO.getLaptopHotCount();
	}
}
