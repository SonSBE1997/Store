package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.dao.ConfigDAO;
import dev.sanero.entities.LaptopConfig;

@Service
public class ConfigService {
	@Autowired
	ConfigDAO configDAO;

	public long getConfigCount() {
		return configDAO.getConfigCount();
	}

	public List<LaptopConfig> getListConfig() {
		return configDAO.getListConfig();
	}

	public List<LaptopConfig> getListConfigByPage(int page, int pageSize) {
		return configDAO.getListConfigByPage(page, pageSize);
	}

	public boolean delete(int id) {
		return configDAO.delete(id);
	}

	public boolean insert(LaptopConfig config) {
		return configDAO.insert(config);
	}

	public LaptopConfig getConfigById(int id) {
		return configDAO.getConfigById(id);
	}

	public boolean update(LaptopConfig config) {
		return configDAO.update(config);
	}
}
