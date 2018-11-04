package dev.sanero.utils;

public class User {
	// Attribute
	private String username;
	private String password;
	private String name;
	private int id;

	// Constructor
	public User() {
		super();
	}

	public User(int id, String username, String password, String name) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.id = id;
	}

	// Getter and setter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// toString
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", name=" + name + ", id=" + id + "]";
	}
}
