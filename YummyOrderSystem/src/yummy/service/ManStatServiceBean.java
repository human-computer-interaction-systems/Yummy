package yummy.service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManStatServiceBean implements ManStatService{

	@Override
	public List<Number> getOverviewData() {
		// TODO Auto-generated method stub
		return Arrays.asList(32580, 14, 13920, 55891);
	}

	@Override
	public List<List<Number>> getHistoricalTurnover() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(28421, 30295, 35942, 38402, 40352, 46021, 45395, 53021, 50492, 53021, 54120, 55891), 
				Arrays.asList(8543, 8702, 9032, 9435, 9823, 10221, 11024, 12301, 10234, 13842, 14430, 13920)
				);
	}

	@Override
	public List<List<Number>> getLastWeekTur() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(733, 714, 843, 830, 1020, 914, 1042), 
				Arrays.asList(1099, 1176, 880, 1073, 1299, 1370, 1259),
				Arrays.asList(1832, 1890, 1723, 1903, 2319, 2284, 2301)
				);
	}

	@Override
	public List<List<Number>> getThisMonthTur() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(11042, 10390, 9942, 9702), 
				Arrays.asList(4320, 3801, 4310, 4125)				
				);
	}

	@Override
	public List<List<Number>> getLastWeekOrderN() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(523, 462, 520, 510, 580, 588, 572), 
				Arrays.asList(52, 47, 74, 63, 83, 60, 53)				
				);
	}

	@Override
	public List<List<Number>> getThisMonthOrderN() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(1802, 1942, 1784, 1952), 
				Arrays.asList(402, 390, 420, 368)				
				);
	}

	@Override
	public List<List<Number>> getPerMonthOrder() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(20.3,22.7,24.4,25.0,24.8,26.6), 
				Arrays.asList(92,94,93.5,94.7,96.5,97)				
				);
	}

	@Override
	public List<List<Number>> getPerQuarterMarket() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(20.3,22.7,24.4,25.0,24.8,26.6), 
				Arrays.asList(72.3,78.0,82.8,87.0,90.4,93.0)				
				);
	}

	@Override
	public List<List<Number>> getClientStatistics1() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(813, 290), 
				Arrays.asList(156, 638, 267, 42)
				);
	}

	@Override
	public List<List<Number>> getClientStatistics2() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(703, 400), 
				Arrays.asList(206, 594, 243, 60)
				);
	}

	@Override
	public List<List<Number>> getResStatistics1() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(11, 3), 
				Arrays.asList(2, 7, 3, 1)
				);
	}

	@Override
	public List<List<Number>> getResStatistics2() {
		// TODO Auto-generated method stub
		return Arrays.asList(
				Arrays.asList(2, 12), 
				Arrays.asList(2, 5, 4, 3)
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
