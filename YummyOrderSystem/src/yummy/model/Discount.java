package yummy.model;

import java.io.Serializable;

public class Discount implements Serializable, Comparable<Discount>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int rid;
	private double amount;
	private double discount;
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	@Override
	public int compareTo(Discount d) {
		// TODO Auto-generated method stub
		if(this.getAmount() < d.getAmount()) {
			return -1;
		}else {
			return 1;
		}
	}

}
