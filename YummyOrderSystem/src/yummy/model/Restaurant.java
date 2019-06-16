package yummy.model;

import java.io.Serializable;
import java.util.ArrayList;

public class Restaurant implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int rid;
	private String rname;
	private String password;
	private String raddress;
	private int rtype;
	private double balance;
	private ArrayList<Goods> rgoods;
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRaddress() {
		return raddress;
	}
	public void setRaddress(String raddress) {
		this.raddress = raddress;
	}
	public int getRtype() {
		return rtype;
	}
	public void setRtype(int rtype) {
		this.rtype = rtype;
	}
	
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public ArrayList<Goods> getRgoods() {
		return rgoods;
	}
	public void setRgoods(ArrayList<Goods> rgoods) {
		this.rgoods = rgoods;
	}
	
	

}
