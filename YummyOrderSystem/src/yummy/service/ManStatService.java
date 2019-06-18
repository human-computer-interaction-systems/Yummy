package yummy.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ManStatService {
	public List<Number> getOverviewData(); // �õ�ƽ̨���µĸ������ݣ�������
	public List<List<Number>> getHistoricalTurnover(); // �õ�ƽ̨��ȥʮ�����µ�Ӫҵ��Ͷ�������������list
	public List<List<Number>> getLastWeekTur(); // �õ�ƽ̨����ÿ��Ӫҵ�����list�ֱ�������ʱ�Σ�����ʱ�κ�ȫ���Ӫҵ��
	public List<List<Number>> getThisMonthTur(); // �õ����²�ͬʱ��Ӫҵ�����list�ֱ��ǹ����պ���ĩӪҵ��
	public List<List<Number>> getLastWeekOrderN(); // �õ�����ÿ�ն�������������list�ֱ��ǳɽ����˶���������
	public List<List<Number>> getThisMonthOrderN();// �õ����²�ͬʱ�ζ�������������list�ֱ��ǹ����պ���ĩ��������
	public List<List<Number>> getPerMonthOrder();// �õ�ƽ̨ÿ��ƽ�������۸�Ͷ����ɹ��ʣ�����list
	public List<List<Number>> getPerQuarterMarket();// �õ�ƽ̨ÿ����ƽ�������۸�Ͷ����ɹ��ʣ�����list
	public List<List<Number>> getClientStatistics1();// �ͻ�����ͼ1������list�ֱ𰴿ͻ��ȼ��Ͳ�ͬ���ѽ��ͳ��
	public List<List<Number>> getClientStatistics2();// �ͻ�����ͼ2������list�ֱ��Ա������ͳ��
	public List<List<Number>> getResStatistics1();// ��������ͼ1������list�ֱ������ÿ��Ӫҵ��ͳ��
	public List<List<Number>> getResStatistics2();// ��������ͼ2������list�ֱ�Ӫҵʱ�������ͳ��
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
