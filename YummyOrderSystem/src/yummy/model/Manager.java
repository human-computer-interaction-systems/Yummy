package yummy.model;

import java.io.Serializable;

public class Manager implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int managerId;
	private String password;
	private double sysbanance;
	
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public double getSysbanance() {
		return sysbanance;
	}
	public void setSysbanance(double sysbanance) {
		this.sysbanance = sysbanance;
	}
	
	

}
