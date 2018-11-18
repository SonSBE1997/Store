package dev.sanero.utils;

public class Cart {
	private int laptopId;
	private String name;
	private int price;
	private int quantity;
	private double discount;
	private String image;

	// Constructor
	public Cart() {
		super();
	}

	public Cart(int laptopId, String name, int price, int quantity, double discount) {
		super();
		this.laptopId = laptopId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.discount = discount;
	}

	// Getter and setter
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getLaptopId() {
		return laptopId;
	}

	public void setLaptopId(int laptopId) {
		this.laptopId = laptopId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	// Method
	public int getTotalPrice() {
		return (int) (this.price * this.quantity * (100 - discount) / 100);
	}

	// toString
	@Override
	public String toString() {
		return laptopId + ", " + name + ", " + price + ", " + quantity + ", " + discount;
	}
}
