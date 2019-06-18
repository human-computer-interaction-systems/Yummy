package yummy.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import yummy.model.Client;
import yummy.model.Restaurant;
import yummy.service.ManStatService;
import yummy.service.ManagerService;

/**
 * Servlet implementation class ManagerModelServlet
 */
@WebServlet("/ManagerModelServlet")
public class ManagerModelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ApplicationContext appliationContext;
	private static ManStatService manStatService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerModelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	manStatService = (ManStatService)appliationContext.getBean("ManStatService");
    }  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		Map<String,Object> map = new HashMap<>();
		
		List<Number> overview = manStatService.getOverviewData();
		List<List<Number>> chart1 = manStatService.getLastWeekTur();
		List<List<Number>> chart2 = manStatService.getThisMonthTur();
		List<List<Number>> chart3 = manStatService.getLastWeekOrderN();
		List<List<Number>> chart4 = manStatService.getThisMonthOrderN();
		List<List<Number>> chart5 = manStatService.getPerMonthOrder();
		List<List<Number>> chart6 = manStatService.getPerQuarterMarket();
		List<List<Number>> chart7 = manStatService.getClientStatistics1();
		List<List<Number>> chart8 = manStatService.getClientStatistics2();
		List<List<Number>> chart9 = manStatService.getHistoricalTurnover();
		List<List<Number>> chart10 = manStatService.getResStatistics1();
		List<List<Number>> chart11 = manStatService.getResStatistics2();
		
		
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
		map.put("c10", chart10);
		map.put("c11", chart11);
		
		
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
