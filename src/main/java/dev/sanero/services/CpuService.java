package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.DAO.CpuDAO;
import dev.sanero.entities.CPU;

@Service
public class CpuService {
	@Autowired
	CpuDAO cpuDAO;

	public long getCPUCount() {
		return cpuDAO.getCPUCount();
	}

	public List<CPU> getListCPUByPage(int page, int pageSize) {
		return cpuDAO.getListCPUByPage(page, pageSize);
	}

	public boolean delete(int id) {
		return cpuDAO.delete(id);
	}

	public boolean insert(CPU cpu) {
		return cpuDAO.insert(cpu);
	}

	public CPU getCPUById(int id) {
		return cpuDAO.getCPUById(id);
	}

	public boolean update(CPU cpu) {
		return cpuDAO.update(cpu);
	}

}
