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
	public boolean approveR(String rid);//����ͨ��ĳ����
	public Manager getManager(String id, String password);//��¼
	public ArrayList<Restaurant> getAllUnderApparoveR();//��ȡ���д���˵Ĳ�����Ϣ
	public ArrayList<Client> getAllClients();//��ȡ���л�Ա��Ϣ��ͳ����
	public ArrayList<Restaurant> getAllRestaurants();//��ȡ���в�����Ϣ��ͳ����
	
	
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
