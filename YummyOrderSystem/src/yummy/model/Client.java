package yummy.model;

import java.io.Serializable;
import java.util.ArrayList;

public class Client implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int cid;
	private String cname;
	private String phone;
	private String password;
	private int level;//0表示注销客户不能使用，1表示普通账户，2表示会员，可以打折
	private int paymentCode;//六位支付密码，下订单时使用
	private double balance;
	private String email;
	private ArrayList<String> addresses;
	
	public Client() {
		super();
	}
	
	public int getCid() {
		return cid;
	}
	
	public String getCname() {
		return cname;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public String getPassword() {
		return password;
	}
	
	public int getLevel() {
		return level;
	}
	
	public double getBalance() {
		return balance;
	}
	
	public String getEmail() {
		return email;
	}
	
	public ArrayList<String> getAddresses(){
		return addresses;
	}
	
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void setLevel(int level) {
		this.level = level;
	}
	
	public void setBalance(double balance) {
		this.balance = balance;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setAddresses(ArrayList<String> addresses) {
		this.addresses = addresses;
	}

	public int getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}
}
