package yummy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yummy.model.Discount;
import yummy.model.Goods;
import yummy.model.Order;
import yummy.model.Restaurant;

public interface RestaurantService {
	public String getNewRid();//�����ݿ��ȡ��λʶ����
	public boolean registerRestaurant(Restaurant newR);//ע���µĲ���
	public Restaurant getRestaurant(String rid, String password);//ʶ����������¼
	public boolean modifyInfo(Restaurant r);//�����޸Ĳ�����Ϣ������ˣ�����rid,address,type
	public boolean affirmOrder(int oid);//���붩���ţ�ȷ�ϸö����ʹ�޸�order���restaurant��
	public boolean addGoods(ArrayList<Goods> goods);
	
	public boolean addDiscount(Discount d);//����һ���Ż�
	public ArrayList<Discount> getRestaurantDis(int rid);//����rid���õ��ò������е��Ż�����
	
	public ArrayList<Order> getRestaurantOrders(int rid);//�������ID���õ����иò����Ķ�����ͳ����
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
