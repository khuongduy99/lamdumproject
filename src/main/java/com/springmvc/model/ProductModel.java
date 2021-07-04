package com.springmvc.model;

public class ProductModel {
	// product
	
	private Long id;
	
	private String name, image;
	private int totalMoney, size;
	
	public int getTotalMoneyOfProduct() {
		
		return sale != 0 ? qtyInCart * sale : qtyInCart * price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	private int price;
	private int sale;
	private int qtyInCart;
	public int getPrice() {
		return sale != 0 ? sale : price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	

	// getter and seter

	public void setQtyInCart(int qtyInCart) {
		this.qtyInCart = qtyInCart;
	}
	public void updateQtyInCart(int qty) {
		this.qtyInCart += qty;
	}

	public void updateQtyInCart() {
		this.qtyInCart++;
	}
	
	public void updateSize(int size) {
		this.size = size;
	}

	public int getQtyInCart() {
		if (qtyInCart < 0)
			qtyInCart = 1;
		if (qtyInCart > 3)
			qtyInCart = 3;
		return qtyInCart;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	
}
