package yummy.model;

import java.io.Serializable;

public class ClientFavor implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String rname; //����ȥ���̼ҵ���
	private int purchaseN; //����ҵ�ɹ��ʹﶩ������
	private double ratio; //��������ռ���ж�����ֵ
	
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
