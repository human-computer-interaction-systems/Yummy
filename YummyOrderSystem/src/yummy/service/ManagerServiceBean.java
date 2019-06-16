package yummy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import yummy.dao.ClientDao;
import yummy.dao.ManagerDao;
import yummy.model.Client;
import yummy.model.Manager;
import yummy.model.Restaurant;

public class ManagerServiceBean implements ManagerService{
	@Autowired
	private ManagerDao managerDao;
	
	@Override
	public boolean approveR(String rid) {
		// TODO Auto-generated method stub
		ArrayList<Restaurant> res = managerDao.getAllUnderApparoveR();
		Restaurant r = null;
		for(Restaurant e: res) {
			if(e.getRid() == Integer.parseInt(rid)) {
				r = e;
			}
		}
		return managerDao.approveR(r);
	}

	@Override
	public Manager getManager(String id, String password) {
		// TODO Auto-generated method stub
		return managerDao.getManager(id, password);
	}

	@Override
	public ArrayList<Restaurant> getAllUnderApparoveR() {
		// TODO Auto-generated method stub
		return managerDao.getAllUnderApparoveR();
	}

	@Override
	public ArrayList<Client> getAllClients() {
		// TODO Auto-generated method stub
		return managerDao.getAllClients();
	}

	@Override
	public ArrayList<Restaurant> getAllRestaurants() {
		// TODO Auto-generated method stub
		return managerDao.getAllRestaurants();
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

}
