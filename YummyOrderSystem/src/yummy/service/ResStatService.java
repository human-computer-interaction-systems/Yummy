package yummy.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ResStatService {
	public List<Number> getOverviewData(int rid); // 得到某餐厅本月的概览数据，共四项
	public List<Number> getHistoricalTurnover(int rid); // 得到某餐厅过去十二个月的营业额
	public List<List<Number>> getLastWeekTur(int rid); // 得到某餐厅上周每日营业额，三个list分别是上午时段，下午时段和全天的营业额
	public List<List<Number>> getThisMonthTur(int rid); // 得到某餐厅本月不同时段营业额，两个list分别是工作日和周末营业额
	public List<List<Number>> getLastWeekOrderN(int rid); // 得到上周每日订单数量，两个list分别是成交和退订订单数量
	public List<List<Number>> getThisMonthOrderN(int rid);// 得到本月不同时段订单数量，两个list分别是工作日和周末订单数量
	public List<List<Number>> getPerMonthOrder(int rid);// 得到本店每月平均订单价格和订单成功率，两个list
	public List<List<Number>> getPerMonthMarket(int rid);// 市场分析，两个list分别是平均订单价格指数和订单市场占比
	public List<List<Number>> getOrderStatistics(int rid);// 客户分析图1，两个list分别按客户等级和不同时段统计
	public List<List<Number>> getClientStatistics(int rid);// 客户分析图2，两个list分别按性别和年龄统计
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
