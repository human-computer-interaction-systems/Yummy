package yummy.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResStatServiceBean implements ResStatService{

	@Override
	public List<Number> getOverviewData(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(2350, 1103, 72, 23760);
	}

	@Override
	public List<Number> getHistoricalTurnover(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(5232, 8023, 10753, 13323, 15230, 14324, 17042,19633,20536,21632,23091,22453);
	}

	@Override
	public List<List<Number>> getLastWeekTur(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(322, 165, 180, 330, 451, 386, 446), 
				Arrays.asList(893, 534, 614, 870, 743, 1184, 1265),
				Arrays.asList(1215, 699, 794, 1210, 1194, 1570, 1711)
				);
	}

	@Override
	public List<List<Number>> getThisMonthTur(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(4400, 5672, 4812, 4586), 
				Arrays.asList(2896, 3472, 3281, 2709)
				);
	}

	@Override
	public List<List<Number>> getLastWeekOrderN(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(43, 38, 46, 35, 43, 58, 62), 
				Arrays.asList(6, 7, 4, 5, 8, 9, 8)
				);
	}

	@Override
	public List<List<Number>> getThisMonthOrderN(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(290, 370, 325, 400), 
				Arrays.asList(64, 62, 47, 40)
				);
	}

	@Override
	public List<List<Number>> getPerMonthOrder(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(20.3,22.7,24.4,25.0,24.8,26.6), 
				Arrays.asList(92,94,93.5,94.7,96.5,97)
				);
	}

	@Override
	public List<List<Number>> getPerMonthMarket(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(80.2,82.3,80.9,86.4,87.1,92.0), 
				Arrays.asList(5,8,12.3,13.5,12.8,13.6)
				);
	}

	@Override
	public List<List<Number>> getOrderStatistics(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(813, 529), 
				Arrays.asList(208, 320, 451, 124)
				);
	}

	@Override
	public List<List<Number>> getClientStatistics(int rid) {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(426, 677), 
				Arrays.asList(23, 194, 43, 12)
				);
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
