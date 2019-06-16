package yummy.dao;

import java.util.ArrayList;

import yummy.model.Client;

public interface ClientDao {
	public boolean registerClient(Client newclient);//注册新会员
	
	public boolean addAddress(int cid, ArrayList<String> addresses);//增加用户地址
	public boolean deleteAddress(int cid);//删除用户地址，用来修改会员地址
	
	public Client getClientByName(String cname, String password);//用户名和密码登录
	public Client getClientByEmail(String email);//邮箱验证登录
	public int getCid(String cname, String email);//根据邮箱和姓名得到cid
	
	public boolean modifyInfo(Client client);//此函数仅修改电话，姓名
	public boolean writeOff(int cid);//按名称注销，方式为将账户级别设置为0，级别为0的用户为已注销用户，不可再使用
	
	public boolean upgrade(int cid);//输入cid，将该客户从普通会员提升为高级会员
	public boolean recharge(int cid, int paymentCode, double amount);//给账户充值
	public boolean payment(int cid, int paymentCode, double amount);//付款
	public boolean checkPaymentCode(int cid, int paymentCode);//检查账户密码
}
