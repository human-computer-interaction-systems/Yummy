package yummy.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ResStatService {
	public List<Number> getOverviewData(int rid); // �õ�ĳ�������µĸ������ݣ�������
	public List<Number> getHistoricalTurnover(int rid); // �õ�ĳ������ȥʮ�����µ�Ӫҵ��
	public List<List<Number>> getLastWeekTur(int rid); // �õ�ĳ��������ÿ��Ӫҵ�����list�ֱ�������ʱ�Σ�����ʱ�κ�ȫ���Ӫҵ��
	public List<List<Number>> getThisMonthTur(int rid); // �õ�ĳ�������²�ͬʱ��Ӫҵ�����list�ֱ��ǹ����պ���ĩӪҵ��
	public List<List<Number>> getLastWeekOrderN(int rid); // �õ�����ÿ�ն�������������list�ֱ��ǳɽ����˶���������
	public List<List<Number>> getThisMonthOrderN(int rid);// �õ����²�ͬʱ�ζ�������������list�ֱ��ǹ����պ���ĩ��������
	public List<List<Number>> getPerMonthOrder(int rid);// �õ�����ÿ��ƽ�������۸�Ͷ����ɹ��ʣ�����list
	public List<List<Number>> getPerMonthMarket(int rid);// �г�����������list�ֱ���ƽ�������۸�ָ���Ͷ����г�ռ��
	public List<List<Number>> getOrderStatistics(int rid);// �ͻ�����ͼ1������list�ֱ𰴿ͻ��ȼ��Ͳ�ͬʱ��ͳ��
	public List<List<Number>> getClientStatistics(int rid);// �ͻ�����ͼ2������list�ֱ��Ա������ͳ��
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
