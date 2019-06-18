package yummy.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yummy.model.ClientFavor;

public interface ClientStatisticsService {
	public List<Number> getOverviewData(int cid);// 得到某用户本月的概览数据，共四项
	public List<List<Number>> getLastWeekCon(int cid);// 得到某用户上周的消费统计，两个list分别是餐厅消费和商店消费
	public List<List<Number>> getThisMonthCon(int cid);// 得到某用户本月每周消费统计，两个list分别是每周工作日消费和周末消费
	public List<List<Number>> getConProStatistics(int cid);// 得到某用户本月消费比例统计，两个list分别按餐厅种类和消费金额统计
	public List<List<Number>> getHistoricalCon(int cid);// 得到某用户历史每月消费金额，四个list分别是每个季度的三个月的数据，共12个月
	public List<Number> getHistoricalConType(int cid);// 得到某用户近三个月的消费种类统计
	public List<ClientFavor> getMyFavorRes(int cid);// 根据用户进三个月消费得到用户最喜爱的餐厅前五名
	
	public void sentErrorMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void sentMessage(String message,HttpServletRequest req) 
			throws ServletException,IOException;

	public void forwardPage(String page,HttpServletRequest req,HttpServletResponse resp) 
			throws ServletException,IOException;
}
