package yummy.dao;

import java.util.ArrayList;

import yummy.model.Order;

public interface OrderDao {
	public boolean newOrder(Order order);//�ͻ��½��������޸�order���ordergoods��,�ʽ�䶯��payment����
	public boolean cancelOrder(Order order);//���붩���ţ�ȡ���ö������޸�order���client��manager��
	public boolean affirmOrder(Order order);//���붩���ţ�ȷ�ϸö����ʹ�޸�order���restaurant��manager��,�޸�rfood���ٿ��
	public Order getOrder(int oid);//���ݶ����ŵõ�����
	public ArrayList<Order> getClientOrders(int cid);//����ͻ�ID���õ����иÿͻ��Ķ���,ͳ����
	public ArrayList<Order> getRestaurantOrders(int rid);//�������ID���õ����иò����Ķ�����ͳ����
}
