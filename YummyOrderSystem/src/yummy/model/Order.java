package yummy.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Order implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int oid;
	private int rid;
	private int cid;
	private ArrayList<Goods> goods;
	private String caddress;
	private double totalAmount;//�ö������
	private double refundAmount;//����ö����˶����˸��û��Ľ��
	private double restaurantIncome;//����ö����ʹ����������Ľ��
	private double sysIncome;//�����ʹ���˶�ϵͳ��ȡ�Ľ��
	private String orderTime;//��������ʱ��
	private String deliveryTime;//�����ʹ�ʱ�䣬����˶���дһ���������߼���ʱ��
	private boolean isDelivery;//�Ƿ��ʹ�
	private boolean isDisorder;//�Ƿ�ȡ��
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public ArrayList<Goods> getGoods() {
		return goods;
	}
	public void setGoods(ArrayList<Goods> goods) {
		this.goods = goods;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	
	
	public boolean isDisorder() {
		return isDisorder;
	}
	public void setDisorder(boolean isDisorder) {
		this.isDisorder = isDisorder;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public double getRefundAmount() {
		return refundAmount;
	}
	public void setRefundAmount(double refundAmount) {
		this.refundAmount = refundAmount;
	}
	public double getRestaurantIncome() {
		return restaurantIncome;
	}
	public void setRestaurantIncome(double restaurantIncome) {
		this.restaurantIncome = restaurantIncome;
	}
	public double getSysIncome() {
		return sysIncome;
	}
	public void setSysIncome(double sysIncome) {
		this.sysIncome = sysIncome;
	}
	public boolean isDelivery() {
		return isDelivery;
	}
	public void setDelivery(boolean isDelivery) {
		this.isDelivery = isDelivery;
	}
	public String getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	public String getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	
	

}
