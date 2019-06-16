package yummy.dao;

import java.util.ArrayList;

import yummy.model.Goods;

public interface GoodsDao {
	public boolean addGoods(ArrayList<Goods> goods);//为某个餐厅增加商品
}
