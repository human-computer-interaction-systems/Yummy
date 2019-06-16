package yummy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yummy.model.Client;
import yummy.model.Order;

public interface ClientService {
	//登录验证level = 0暂定在servlet中
	public boolean registerClient(Client newclient);//注册新会员
	public Client getClientByName(String cname, String password);//用户名和密码登录
	public Client getClientByEmail(String email);//邮箱验证登录
	public boolean modifyInfo(Client client);//输入cid,cname,phone 和address
	public boolean writeOff(int cid);//按名称注销，方式为将账户级别设置为0，级别为0的用户为已注销用户，不可再使用
	public boolean recharge(int cid, int paymentCode, double amount);//给账户充值
	public boolean payment(int cid, int paymentCode, double amount);//付款
	public boolean checkPaymentCode(int cid, int paymentCode);//检查账户密码
	
	public boolean upgrade(int cid);//输入cid，将该客户从普通会员提升为高级会员
	public boolean newOrder(Order order);
	public boolean cancelOrder(int oid);//输入订单号，取消该订单，修改order表和client表
	public ArrayList<Order> getClientOrders(int cid);//输入客户ID，得到所有该客户的订单,统计用

	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
