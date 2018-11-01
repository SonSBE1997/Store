package dev.sanero.entities;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "laptop_images")
public class LaptopImage {
	// Attribute
	@Id
	private String image;
	private Timestamp created_at;
	private Timestamp updated_at;
	@ManyToOne
	@JoinColumn(name = "laptop_id")
	private Laptop laptop;

	// Constructor
	public LaptopImage(String image, Laptop laptop) {
		super();
		this.image = image;
		this.laptop = laptop;
	}

	public LaptopImage() {
		super();
		// TODO Auto-generated constructor stub
	}

	// Getter and setter
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public Laptop getLaptop() {
		return laptop;
	}

	public void setLaptop(Laptop laptop) {
		this.laptop = laptop;
	}
}
