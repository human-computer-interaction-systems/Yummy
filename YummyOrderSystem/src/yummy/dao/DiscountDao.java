package yummy.dao;

import java.util.ArrayList;

import yummy.model.Discount;

public interface DiscountDao {
	public boolean addDiscount(Discount d);//增加一个优惠
	public ArrayList<Discount> getRestaurantDis(int rid);//输入rid，得到该餐厅所有的优惠政策
}
