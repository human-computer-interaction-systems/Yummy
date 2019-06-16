package yummy.dao;

import java.util.ArrayList;

import yummy.model.Client;
import yummy.model.Manager;
import yummy.model.Restaurant;

public interface ManagerDao {
	public boolean approveR(Restaurant r);//审批通过某餐厅
	public Manager getManager(String id, String password);//登录
	public ArrayList<Restaurant> getAllUnderApparoveR();//获取所有待审核的餐厅信息
	public ArrayList<Client> getAllClients();//获取所有会员信息，统计用
	public ArrayList<Restaurant> getAllRestaurants();//获取所有餐厅信息，统计用
}
