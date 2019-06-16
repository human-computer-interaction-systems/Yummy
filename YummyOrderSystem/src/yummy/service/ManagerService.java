package yummy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yummy.model.Client;
import yummy.model.Manager;
import yummy.model.Restaurant;

public interface ManagerService {
	public boolean approveR(String rid);//审批通过某餐厅
	public Manager getManager(String id, String password);//登录
	public ArrayList<Restaurant> getAllUnderApparoveR();//获取所有待审核的餐厅信息
	public ArrayList<Client> getAllClients();//获取所有会员信息，统计用
	public ArrayList<Restaurant> getAllRestaurants();//获取所有餐厅信息，统计用
	
	
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
