package dev.sanero.entities;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name = "order_details")
public class OrderDetail implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	// Attribute
	private int quantity;
	private int price;
	private int created_by;
	private int modified_by;
	private Timestamp created_at;
	private Timestamp updated_at;

	@ManyToOne
	@JoinColumn(name = "order_id")
	private Order order;

	@ManyToOne
	@JoinColumn(name = "laptop_id")
	private Laptop laptop;

	// Constructor
	public OrderDetail() {
		super();
	}

	public OrderDetail(int quantity, int price, Order order, Laptop laptop) {
		super();
		this.quantity = quantity;
		this.price = price;
		this.order = order;
		this.laptop = laptop;
	}

	// Getter and setter
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCreated_by() {
		return created_by;
	}

	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}

	public int getModified_by() {
		return modified_by;
	}

	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
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

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Laptop getLaptop() {
		return laptop;
	}

	public void setLaptop(Laptop laptop) {
		this.laptop = laptop;
	}

}
