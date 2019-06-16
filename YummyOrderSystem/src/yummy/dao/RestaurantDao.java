package yummy.dao;

import yummy.model.Restaurant;

public interface RestaurantDao {
	public String getNewRid();//从数据库获取七位识别码
	public boolean registerRestaurant(Restaurant newR);//注册新的餐厅，更新restaurant表
	public Restaurant getRestaurant(String rid, String password);//识别码和密码登录
	public boolean modifyInfo(Restaurant r);//申请修改餐厅信息，待审核，修改rapplication表
}
