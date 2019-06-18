package yummy.model;

import java.io.Serializable;

public class ClientFavor implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String rname; //经常去的商家店名
	private int purchaseN; //在这家店成功送达订单次数
	private double ratio; //订单次数占所有订单比值
	
	public ClientFavor(String rname, int purchaseN, double ratio) {
		// TODO Auto-generated constructor stub
		this.rname = rname;
		this.purchaseN = purchaseN;
		this.ratio = ratio;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public int getPurchaseN() {
		return purchaseN;
	}
	public void setPurchaseN(int purchaseN) {
		this.purchaseN = purchaseN;
	}
	public double getRatio() {
		return ratio;
	}
	public void setRatio(double ratio) {
		this.ratio = ratio;
	}
	
}
