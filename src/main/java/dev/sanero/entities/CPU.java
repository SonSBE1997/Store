package dev.sanero.entities;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "cpus")
public class CPU {
	// Attribute
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String socket;
	private String core;
	private double speed;
	@Column(name = "max_speed")
	private double maxSpeed;
	private int cache;
	@Column(name = "integrated_graphic")
	private String integratedGraphic;
	private Timestamp created_at;
	private Timestamp updated_at;
	
	//Constructor
	public CPU(String name, String socket, String core, double speed) {
		super();
		this.name = name;
		this.socket = socket;
		this.core = core;
		this.speed = speed;
	}

	public CPU() {
		super();
	}

	//Getter and setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSocket() {
		return socket;
	}

	public void setSocket(String socket) {
		this.socket = socket;
	}

	public String getCore() {
		return core;
	}

	public void setCore(String core) {
		this.core = core;
	}

	public double getSpeed() {
		return speed;
	}

	public void setSpeed(double speed) {
		this.speed = speed;
	}

	public double getMaxSpeed() {
		return maxSpeed;
	}

	public void setMaxSpeed(double maxSpeed) {
		this.maxSpeed = maxSpeed;
	}

	public int getCache() {
		return cache;
	}

	public void setCache(int cache) {
		this.cache = cache;
	}

	public String getIntegratedGraphic() {
		return integratedGraphic;
	}

	public void setIntegratedGraphic(String integratedGraphic) {
		this.integratedGraphic = integratedGraphic;
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
}
