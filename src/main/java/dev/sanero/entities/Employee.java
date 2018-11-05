package dev.sanero.entities;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.search.annotations.Analyze;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;

@Indexed
@Entity(name = "employees")
public class Employee {
	// Attribute
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Field(index = Index.YES, analyze = Analyze.YES)
	private String name;
	private boolean gender;

	@Column(name = "date_of_birth")
	private Date dateOfBirth;

	@Field(index = Index.YES, analyze = Analyze.YES)
	@Column(name = "phone_number")
	private String phoneNumber;

	@Field(index = Index.YES, analyze = Analyze.YES)
	private String address;

	@Field(index = Index.YES, analyze = Analyze.YES)
	private String email;
	private boolean role;
	private Timestamp created_at;
	private Timestamp updated_at;

	@Field(index = Index.YES, analyze = Analyze.YES)
	private String username;
	private String password;

	// Constructor
	public Employee() {
		super();
	}

	public Employee(String name, String username, String password) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
	}

	// Getter and setter
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

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth
				+ ", phoneNumber=" + phoneNumber + ", address=" + address + ", email=" + email + ", created_at="
				+ created_at + ", username=" + username + ", password=" + password + "]";
	}

	public void update(Employee employee) {
		this.name = employee.name;
		this.gender = employee.gender;
		this.address = employee.address;
		this.email = employee.email;
		this.dateOfBirth = employee.dateOfBirth;
		this.phoneNumber = employee.phoneNumber;
		this.created_at = employee.created_at;
		this.updated_at = employee.updated_at;
		this.username = employee.username;
		this.password = employee.password;
	}
}
