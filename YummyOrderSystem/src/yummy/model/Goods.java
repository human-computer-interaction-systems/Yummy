package yummy.model;

import java.io.Serializable;

public class Goods implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int rid;
	private String foodName;
	private double price;//����
	private int quantity;
	private int number;//һ�Ŷ�����������Ʒ����
	private double amount;//һ�Ŷ�����������Ʒ���
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
}
