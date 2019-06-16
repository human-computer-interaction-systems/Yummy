package yummy.dao;

import java.util.ArrayList;

import yummy.model.Client;

public interface ClientDao {
	public boolean registerClient(Client newclient);//ע���»�Ա
	
	public boolean addAddress(int cid, ArrayList<String> addresses);//�����û���ַ
	public boolean deleteAddress(int cid);//ɾ���û���ַ�������޸Ļ�Ա��ַ
	
	public Client getClientByName(String cname, String password);//�û����������¼
	public Client getClientByEmail(String email);//������֤��¼
	public int getCid(String cname, String email);//��������������õ�cid
	
	public boolean modifyInfo(Client client);//�˺������޸ĵ绰������
	public boolean writeOff(int cid);//������ע������ʽΪ���˻���������Ϊ0������Ϊ0���û�Ϊ��ע���û���������ʹ��
	
	public boolean upgrade(int cid);//����cid�����ÿͻ�����ͨ��Ա����Ϊ�߼���Ա
	public boolean recharge(int cid, int paymentCode, double amount);//���˻���ֵ
	public boolean payment(int cid, int paymentCode, double amount);//����
	public boolean checkPaymentCode(int cid, int paymentCode);//����˻�����
}
