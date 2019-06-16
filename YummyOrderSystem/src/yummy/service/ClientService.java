package yummy.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yummy.model.Client;
import yummy.model.Order;

public interface ClientService {
	//��¼��֤level = 0�ݶ���servlet��
	public boolean registerClient(Client newclient);//ע���»�Ա
	public Client getClientByName(String cname, String password);//�û����������¼
	public Client getClientByEmail(String email);//������֤��¼
	public boolean modifyInfo(Client client);//����cid,cname,phone ��address
	public boolean writeOff(int cid);//������ע������ʽΪ���˻���������Ϊ0������Ϊ0���û�Ϊ��ע���û���������ʹ��
	public boolean recharge(int cid, int paymentCode, double amount);//���˻���ֵ
	public boolean payment(int cid, int paymentCode, double amount);//����
	public boolean checkPaymentCode(int cid, int paymentCode);//����˻�����
	
	public boolean upgrade(int cid);//����cid�����ÿͻ�����ͨ��Ա����Ϊ�߼���Ա
	public boolean newOrder(Order order);
	public boolean cancelOrder(int oid);//���붩���ţ�ȡ���ö������޸�order���client��
	public ArrayList<Order> getClientOrders(int cid);//����ͻ�ID���õ����иÿͻ��Ķ���,ͳ����

	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
