package dev.sanero.entities;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.lang.Nullable;

@Entity(name = "orders")
public class Order {
	// Attribute
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "order_date")
	private Date orderDate;
	private double discount;
	private boolean status;
	private String address;

	private int created_by;
	@Nullable
	private int modified_by;
	@Nullable
	private Timestamp created_at;
	@Nullable
	private Timestamp updated_at;

	@OneToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "order_id")
	private Set<OrderDetail> lsDetail;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private Employee employee;

	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;

	// Constructor
	public Order() {
		super();
	}

	public Order(Date orderDate, Employee employee, Customer customer) {
		super();
		this.orderDate = orderDate;
		this.employee = employee;
		this.customer = customer;
	}

	// Getter and setter
	public Set<OrderDetail> getLsDetail() {
		return lsDetail;
	}

	public void setLsDetail(Set<OrderDetail> lsDetail) {
		this.lsDetail = lsDetail;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getTotalBillPrice() {
		int total = 0;
		for (OrderDetail orderDetail : lsDetail) {
			total += orderDetail.getPrice() * orderDetail.getQuantity();
		}
		total = (int) (total * (100 - this.discount) / 100);
		return total;
	}
}
