package dev.sanero.entities;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "rams")
public class Ram {
	// Attribute
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "memory_capacity")
	private int memoryCapacity;
	private String type;
	private int bus;
	private Timestamp created_at;
	private Timestamp updated_at;

	// Constructor
	public Ram() {
		super();
	}

	public Ram(int id) {
		this.id = id;
	}

	public Ram(int memoryCapacity, String type, int bus) {
		super();
		this.memoryCapacity = memoryCapacity;
		this.type = type;
		this.bus = bus;
	}

	// Getter and setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMemoryCapacity() {
		return memoryCapacity;
	}

	public void setMemoryCapacity(int memoryCapacity) {
		this.memoryCapacity = memoryCapacity;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getBus() {
		return bus;
	}

	public void setBus(int bus) {
		this.bus = bus;
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

	// toString
	@Override
	public String toString() {
		return memoryCapacity + " GB, type=" + type + ", bus=" + bus;
	}
}
