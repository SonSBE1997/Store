package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.dao.RamDAO;
import dev.sanero.entities.Ram;

@Service
public class RamService {
	@Autowired
	RamDAO ramDAO;

	public long getRamCount() {
		return ramDAO.getRamCount();
	}

	public List<Ram> getListRam() {
		return ramDAO.getListRam();
	}

	public List<Ram> getListRamByPage(int page, int pageSize) {
		return ramDAO.getListRamByPage(page, pageSize);
	}

	public boolean delete(int id) {
		return ramDAO.delete(id);
	}

	public boolean insert(Ram ram) {
		return ramDAO.insert(ram);
	}

	public Ram getRamById(int id) {
		return ramDAO.getRamById(id);
	}

	public boolean update(Ram ram) {
		return ramDAO.update(ram);
	}
}
