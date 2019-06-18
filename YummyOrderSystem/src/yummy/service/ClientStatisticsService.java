package yummy.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yummy.model.ClientFavor;

public interface ClientStatisticsService {
	public List<Number> getOverviewData(int cid);// �õ�ĳ�û����µĸ������ݣ�������
	public List<List<Number>> getLastWeekCon(int cid);// �õ�ĳ�û����ܵ�����ͳ�ƣ�����list�ֱ��ǲ������Ѻ��̵�����
	public List<List<Number>> getThisMonthCon(int cid);// �õ�ĳ�û�����ÿ������ͳ�ƣ�����list�ֱ���ÿ�ܹ��������Ѻ���ĩ����
	public List<List<Number>> getConProStatistics(int cid);// �õ�ĳ�û��������ѱ���ͳ�ƣ�����list�ֱ𰴲�����������ѽ��ͳ��
	public List<List<Number>> getHistoricalCon(int cid);// �õ�ĳ�û���ʷÿ�����ѽ��ĸ�list�ֱ���ÿ�����ȵ������µ����ݣ���12����
	public List<Number> getHistoricalConType(int cid);// �õ�ĳ�û��������µ���������ͳ��
	public List<ClientFavor> getMyFavorRes(int cid);// �����û������������ѵõ��û���ϲ���Ĳ���ǰ����
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
