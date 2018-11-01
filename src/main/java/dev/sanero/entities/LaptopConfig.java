package dev.sanero.entities;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "laptop_config")
public class LaptopConfig {
	// Attribute
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "memory_socket_count")
	private int memorySocketCount;
	private String disk;
	@Column(name = "port_connect")
	private String portConnect;
	private String dimension;
	private String screen;
	private int battery;
	private Timestamp created_at;
	private Timestamp updated_at;

	@ManyToOne
	@JoinColumn(name = "producer_id")
	private Producer producer;

	@ManyToOne
	@JoinColumn(name = "cpu_id")
	private CPU cpu;

	@ManyToOne
	@JoinColumn(name = "ram_id")
	private Ram ram;

	// Constructor
	public LaptopConfig() {
		super();
	}

	// Getter and setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMemorySocketCount() {
		return memorySocketCount;
	}

	public void setMemorySocketCount(int memorySocketCount) {
		this.memorySocketCount = memorySocketCount;
	}

	public String getDisk() {
		return disk;
	}

	public void setDisk(String disk) {
		this.disk = disk;
	}

	public String getPortConnect() {
		return portConnect;
	}

	public void setPortConnect(String portConnect) {
		this.portConnect = portConnect;
	}

	public String getDimension() {
		return dimension;
	}

	public void setDimension(String dimension) {
		this.dimension = dimension;
	}

	public String getScreen() {
		return screen;
	}

	public void setScreen(String screen) {
		this.screen = screen;
	}

	public int getBattery() {
		return battery;
	}

	public void setBattery(int battery) {
		this.battery = battery;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public Timestamp getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}

	public Producer getProducer() {
		return producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	public CPU getCpu() {
		return cpu;
	}

	public void setCpu(CPU cpu) {
		this.cpu = cpu;
	}

	public Ram getRam() {
		return ram;
	}

	public void setRam(Ram ram) {
		this.ram = ram;
	}
}
