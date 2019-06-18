package yummy.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ManStatService {
	public List<Number> getOverviewData(); // 得到平台本月的概览数据，共四项
	public List<List<Number>> getHistoricalTurnover(); // 得到平台过去十二个月的营业额和订单数量，两个list
	public List<List<Number>> getLastWeekTur(); // 得到平台上周每日营业额，三个list分别是上午时段，下午时段和全天的营业额
	public List<List<Number>> getThisMonthTur(); // 得到本月不同时段营业额，两个list分别是工作日和周末营业额
	public List<List<Number>> getLastWeekOrderN(); // 得到上周每日订单数量，两个list分别是成交和退订订单数量
	public List<List<Number>> getThisMonthOrderN();// 得到本月不同时段订单数量，两个list分别是工作日和周末订单数量
	public List<List<Number>> getPerMonthOrder();// 得到平台每月平均订单价格和订单成功率，两个list
	public List<List<Number>> getPerQuarterMarket();// 得到平台每季度平均订单价格和订单成功率，两个list
	public List<List<Number>> getClientStatistics1();// 客户分析图1，两个list分别按客户等级和不同消费金额统计
	public List<List<Number>> getClientStatistics2();// 客户分析图2，两个list分别按性别和年龄统计
	public List<List<Number>> getResStatistics1();// 餐厅分析图1，两个list分别按种类和每月营业额统计
	public List<List<Number>> getResStatistics2();// 餐厅分析图2，两个list分别按营业时间和种类统计
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
