package yummy.model;

import java.io.Serializable;

public class Goods implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int rid;
	private String foodName;
	private double price;//单价
	private int quantity;
	private int number;//一张订单订购该物品数量
	private double amount;//一张订单订购该物品金额
	private String url;//该商品的URL
	private double score;//该商品的评分
	private String introduction;//该商品的简要描述

	public Goods() {
	}

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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
}
