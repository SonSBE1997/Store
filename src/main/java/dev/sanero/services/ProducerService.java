package dev.sanero.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.sanero.dao.ProducerDAO;
import dev.sanero.entities.Producer;

@Service
public class ProducerService {
	@Autowired
	ProducerDAO producerDAO;

	public long getProducerCount() {
		return producerDAO.getProducerCount();
	}

	public List<Producer> getListProducer() {
		return producerDAO.getListProducer();
	}

	public List<Producer> getListProducerByPage(int page, int pageSize) {
		return producerDAO.getListProducerByPage(page, pageSize);
	}

	public boolean delete(int id) {
		return producerDAO.delete(id);
	}

	public boolean insert(Producer producer) {
		return producerDAO.insert(producer);
	}

	public Producer getProducerById(int id) {
		return producerDAO.getProducerById(id);
	}

	public boolean update(Producer producer) {
		return producerDAO.update(producer);
	}
}
