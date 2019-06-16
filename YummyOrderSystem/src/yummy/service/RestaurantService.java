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
	public String getNewRid();//从数据库获取七位识别码
	public boolean registerRestaurant(Restaurant newR);//注册新的餐厅
	public Restaurant getRestaurant(String rid, String password);//识别码和密码登录
	public boolean modifyInfo(Restaurant r);//申请修改餐厅信息，待审核，输入rid,address,type
	public boolean affirmOrder(int oid);//输入订单号，确认该订单送达，修改order表和restaurant表
	public boolean addGoods(ArrayList<Goods> goods);
	
	public boolean addDiscount(Discount d);//增加一个优惠
	public ArrayList<Discount> getRestaurantDis(int rid);//输入rid，得到该餐厅所有的优惠政策
	
	public ArrayList<Order> getRestaurantOrders(int rid);//输入餐厅ID，得到所有该餐厅的订单，统计用
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
