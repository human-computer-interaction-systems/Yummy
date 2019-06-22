package yummy.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.gson.Gson;

import yummy.service.ResStatService;

/**
 * Servlet implementation class RestaurantModelServlet
 */
@WebServlet("/RestaurantModelServlet")
public class RestaurantModelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ApplicationContext appliationContext;
	private static ResStatService resStatService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantModelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext1.xml");
    	resStatService = (ResStatService)appliationContext.getBean("ResStatService");
    }  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int rid = Integer.parseInt(request.getParameter("rid"));
		System.out.println("rid: "+rid);
		
		
		Map<String,Object> map = new HashMap<>();
		List<Number> overview = resStatService.getOverviewData(rid);
		List<List<Number>> chart1 = resStatService.getLastWeekTur(rid);
		List<List<Number>> chart2 = resStatService.getThisMonthTur(rid);
		List<List<Number>> chart3 = resStatService.getLastWeekOrderN(rid);
		List<List<Number>> chart4 = resStatService.getThisMonthOrderN(rid);
		List<List<Number>> chart5 = resStatService.getPerMonthOrder(rid);
		List<List<Number>> chart6 = resStatService.getPerMonthMarket(rid);
		List<List<Number>> chart7 = resStatService.getOrderStatistics(rid);
		List<List<Number>> chart8 = resStatService.getClientStatistics(rid);
		List<Number> chart9 = resStatService.getHistoricalTurnover(rid);
		
		
		map.put("overview", overview);
		map.put("c1", chart1);
		map.put("c2", chart2);
		map.put("c3", chart3);
		map.put("c4", chart4);
		map.put("c5", chart5);
		map.put("c6", chart6);
		map.put("c7", chart7);
		map.put("c8", chart8);
		map.put("c9", chart9);
		
		
		
		Gson gson = new Gson();
		String json = gson.toJson(map);
		System.out.println(json);
		response.setCharacterEncoding("UTF-8");  
		response.setContentType("application/json; charset=utf-8");  
		PrintWriter writer = response.getWriter();
		writer.append(json);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
