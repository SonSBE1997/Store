package dev.sanero.utils;

public class Cart {
	private int laptopId;
	private int price;
	private int quantity;
	private double discount;

	// Getter and setter
	public int getLaptopId() {
		return laptopId;
	}

	public void setLaptopId(int laptopId) {
		this.laptopId = laptopId;
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
		return this.price * this.quantity;
	}

	// toString
	@Override
	public String toString() {
		return laptopId + ", " + price + ", =" + quantity + ", " + discount;
	}
}
