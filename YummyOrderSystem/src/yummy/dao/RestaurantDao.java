package yummy.dao;

import yummy.model.Restaurant;

public interface RestaurantDao {
	public String getNewRid();//�����ݿ��ȡ��λʶ����
	public boolean registerRestaurant(Restaurant newR);//ע���µĲ���������restaurant��
	public Restaurant getRestaurant(String rid, String password);//ʶ����������¼
	public boolean modifyInfo(Restaurant r);//�����޸Ĳ�����Ϣ������ˣ��޸�rapplication��
}
