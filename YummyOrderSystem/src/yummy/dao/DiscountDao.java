package yummy.dao;

import java.util.ArrayList;

import yummy.model.Discount;

public interface DiscountDao {
	public boolean addDiscount(Discount d);//����һ���Ż�
	public ArrayList<Discount> getRestaurantDis(int rid);//����rid���õ��ò������е��Ż�����
}
