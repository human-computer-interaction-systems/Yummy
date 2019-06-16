package yummy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import yummy.dao.DiscountDao;
import yummy.dao.GoodsDao;
import yummy.dao.OrderDao;
import yummy.dao.RestaurantDao;
import yummy.model.Discount;
import yummy.model.Goods;
import yummy.model.Order;
import yummy.model.Restaurant;

public class RestaurantServiceBean implements RestaurantService{
	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private DiscountDao discountDao;
	
	@Override
	public String getNewRid() {
		// TODO Auto-generated method stub
		return restaurantDao.getNewRid();
	}

	@Override
	public boolean registerRestaurant(Restaurant newR) {
		// TODO Auto-generated method stub
		boolean resultFlag = true;
		
		if(!restaurantDao.registerRestaurant(newR)) {
			resultFlag = false;
		}
		return resultFlag;
	}

	@Override
	public Restaurant getRestaurant(String rid, String password) {
		// TODO Auto-generated method stub
		return restaurantDao.getRestaurant(rid, password);
	}

	@Override
	public boolean modifyInfo(Restaurant r) {
		// TODO Auto-generated method stub
		return restaurantDao.modifyInfo(r);
	}

	@Override
	public boolean affirmOrder(int oid) {
		// TODO Auto-generated method stub
		Order order = orderDao.getOrder(oid);
		return orderDao.affirmOrder(order);
	}

	@Override
	public boolean addGoods(ArrayList<Goods> goods) {
		// TODO Auto-generated method stub
		return goodsDao.addGoods(goods);
	}

	@Override
	public void sentErrorMessage(String message, HttpServletRequest req) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("message",message);
	}

	@Override
	public void sentMessage(String message, HttpServletRequest req) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("message",message);
	}

	@Override
	public void forwardPage(String page, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispater=req.getRequestDispatcher(resp.encodeURL(page));
		dispater.forward(req,resp);
	}

	@Override
	public ArrayList<Order> getRestaurantOrders(int rid) {
		// TODO Auto-generated method stub
		return orderDao.getRestaurantOrders(rid);
	}

	@Override
	public boolean addDiscount(Discount d) {
		// TODO Auto-generated method stub
		return discountDao.addDiscount(d);
	}

	@Override
	public ArrayList<Discount> getRestaurantDis(int rid) {
		// TODO Auto-generated method stub
		return discountDao.getRestaurantDis(rid);
	}

}
