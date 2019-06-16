package yummy.dao;

import java.util.ArrayList;

import yummy.model.Client;
import yummy.model.Manager;
import yummy.model.Restaurant;

public interface ManagerDao {
	public boolean approveR(Restaurant r);//����ͨ��ĳ����
	public Manager getManager(String id, String password);//��¼
	public ArrayList<Restaurant> getAllUnderApparoveR();//��ȡ���д���˵Ĳ�����Ϣ
	public ArrayList<Client> getAllClients();//��ȡ���л�Ա��Ϣ��ͳ����
	public ArrayList<Restaurant> getAllRestaurants();//��ȡ���в�����Ϣ��ͳ����
}
