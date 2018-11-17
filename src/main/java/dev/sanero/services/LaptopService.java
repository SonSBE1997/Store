package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.DAO.LaptopDAO;
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

	public List<Laptop> getListLaptopIsHot() {
		return laptopDAO.getListLaptopIsHot();
	}

	public List<Laptop> getListLaptopByProducerId(int producerId) {
		return laptopDAO.getListLaptopByProducerId(producerId);
	}

	public List<Laptop> getListLaptopIsDiscount() {
		return laptopDAO.getListLaptopIsDiscount();
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
}
