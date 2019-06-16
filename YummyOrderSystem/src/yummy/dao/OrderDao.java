package yummy.dao;

import java.util.ArrayList;

import yummy.model.Order;

public interface OrderDao {
	public boolean newOrder(Order order);//客户新建订单，修改order表和ordergoods表,资金变动用payment函数
	public boolean cancelOrder(Order order);//输入订单号，取消该订单，修改order表和client表，manager表
	public boolean affirmOrder(Order order);//输入订单号，确认该订单送达，修改order表和restaurant表，manager表,修改rfood减少库存
	public Order getOrder(int oid);//根据订单号得到订单
	public ArrayList<Order> getClientOrders(int cid);//输入客户ID，得到所有该客户的订单,统计用
	public ArrayList<Order> getRestaurantOrders(int rid);//输入餐厅ID，得到所有该餐厅的订单，统计用
}
