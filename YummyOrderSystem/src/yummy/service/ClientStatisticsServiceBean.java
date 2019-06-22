package yummy.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yummy.model.ClientFavor;

public class ClientStatisticsServiceBean implements ClientStatisticsService{

	@Override
	public List<Number> getOverviewData(int cid) {
		// TODO Auto-generated method stub
		return Arrays.asList(15, 2, 318.8, 6);
	}

	@Override
	public List<List<Number>> getLastWeekCon(int cid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(32.2, 16.5, 18.0, 33.0, 45.1, 38.6, 44.6), 
				Arrays.asList(0.0, 6.0, 4.0, 10.0, 8.0, 30.0, 27.0)
				);
	}

	@Override
	public List<List<Number>> getThisMonthCon(int cid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(102.2, 132.2, 144.8, 93.5), 
				Arrays.asList(69.0, 50.0, 83.2, 28.0)
				);
	}

	@Override
	public List<List<Number>> getConProStatistics(int cid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(506.16, 196.84), 
				Arrays.asList(10, 32, 9, 4)
				);
	}

	@Override
	public List<List<Number>> getHistoricalCon(int cid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(433, 858, 937), 
				Arrays.asList(831, 734, 551), 
				Arrays.asList(864, 652, 825), 
				Arrays.asList(724, 539, 391)
				);
	}

	@Override
	public List<Number> getHistoricalConType(int cid) {
		// TODO Auto-generated method stub
		return Arrays.asList(42, 130, 33, 65, 122);
	}

	@Override
	public List<ClientFavor> getMyFavorRes(int cid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				new ClientFavor("悠悠舒芙蕾", 21, 0.20),
				new ClientFavor("贡茶", 18, 0.172),
				new ClientFavor("成都冒菜", 15, 0.143),
				new ClientFavor("兰州拉面", 12, 0.114),
				new ClientFavor("平价水果店", 10, 0.095));
	}
	
	@Override
	public void sentErrorMessage(String message, HttpServletRequest req) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("message",message);
	}

	@Override
	public void sentMessage(String message, HttpServletRequest req) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("message",message);
	}

	@Override
	public void forwardPage(String page, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispater=req.getRequestDispatcher(resp.encodeURL(page));
		dispater.forward(req,resp);
	}

	

}
