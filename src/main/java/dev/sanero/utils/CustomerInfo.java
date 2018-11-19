package dev.sanero.utils;

public class CustomerInfo {
	private String name;
	private String phoneNumber;
	private String email;
	private String address;

	// getter and setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	// constructor
	public CustomerInfo(String name, String phoneNumber, String email) {
		super();
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.email = email;
	}

	public CustomerInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	// toString
	@Override
	public String toString() {
		return "CustomerInfo [name=" + name + ", phoneNumber=" + phoneNumber + ", email=" + email + ", address="
				+ address + "]";
	}

}
