package yummy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;


import yummy.dao.ClientDao;
import yummy.dao.OrderDao;
import yummy.model.Client;
import yummy.model.Order;

public class ClientServiceBean implements ClientService{
	@Autowired
	private ClientDao clientDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public Client getClientByName(String cname, String password) {
		// TODO Auto-generated method stub
		return clientDao.getClientByName(cname, password);
	}

	@Override
	public Client getClientByEmail(String email) {
		// TODO Auto-generated method stub
		return clientDao.getClientByEmail(email);
	}

	@Override
	public boolean registerClient(Client newclient) {
		// TODO Auto-generated method stub
		boolean resultFlag = true;
		
		//register a new client
		if(clientDao.registerClient(newclient)) {
			//get the cid 
			int cid = clientDao.getCid(newclient.getCname(), newclient.getEmail());
			clientDao.addAddress(cid, newclient.getAddresses());//add the new client's addresses
		}else {
			resultFlag = false;
		}
		
		return resultFlag;
	}

	@Override
	public boolean modifyInfo(Client client) {
		// TODO Auto-generated method stub
		boolean resultFlag = true;
		
		if(!clientDao.modifyInfo(client)) {
			resultFlag = false;
		}//modify the name and the password
		
		clientDao.deleteAddress(client.getCid());//delete old addresses
		clientDao.addAddress(client.getCid(), client.getAddresses());//add the new addresses
		
		return resultFlag;
	}

	@Override
	public boolean writeOff(int cid) {
		// TODO Auto-generated method stub
		return clientDao.writeOff(cid);
	}

	@Override
	public boolean recharge(int cid, int paymentCode, double amount) {
		// TODO Auto-generated method stub
		return clientDao.recharge(cid, paymentCode, amount);
	}

	@Override
	public boolean newOrder(Order order) {
		// TODO Auto-generated method stub
		return orderDao.newOrder(order);
	}

	@Override
	public boolean cancelOrder(int oid) {
		// TODO Auto-generated method stub
		Order order = orderDao.getOrder(oid);
		System.out.println(order.getOrderTime());
		return orderDao.cancelOrder(order);
	}

	@Override
	public boolean payment(int cid, int paymentCode, double amount) {
		// TODO Auto-generated method stub
		return clientDao.payment(cid, paymentCode, amount);
	}

	@Override
	public boolean checkPaymentCode(int cid, int paymentCode) {
		// TODO Auto-generated method stub
		return clientDao.checkPaymentCode(cid, paymentCode);
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
	public ArrayList<Order> getClientOrders(int cid) {
		// TODO Auto-generated method stub
		return orderDao.getClientOrders(cid);
	}

	@Override
	public boolean upgrade(int cid) {
		// TODO Auto-generated method stub
		return clientDao.upgrade(cid);
	}
}
