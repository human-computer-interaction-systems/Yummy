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
	private int rtypedetail;//商家的二级分类
	private String url;//商家头像URL
	private double score;//商家评分
	
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


	public int getRtypedetail() {
		return rtypedetail;
	}

	public void setRtypedetail(int rtypedetail) {
		this.rtypedetail = rtypedetail;
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
}
