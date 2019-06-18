package yummy.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.gson.Gson;

import yummy.model.Client;
import yummy.model.ClientFavor;
import yummy.model.Order;
import yummy.service.ClientService;
import yummy.service.ClientStatisticsService;

/**
 * Servlet implementation class ClientStatisticsServlet
 */
@WebServlet("/ClientModelServlet")
public class ClientModelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ApplicationContext appliationContext;
	
	private static ClientStatisticsService clientStatisticsService;
    /**	
     * @see HttpServlet#HttpServlet()
     */
    public ClientModelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	clientStatisticsService = (ClientStatisticsService)appliationContext.getBean("ClientStatisticsService");
    }  
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int cid = Integer.parseInt(request.getParameter("cid"));
		System.out.println("cid: "+cid);
		
		
		
		Map<String,Object> map = new HashMap<>();
		List<Number> overview = clientStatisticsService.getOverviewData(cid);
		List<List<Number>> chart1 = clientStatisticsService.getLastWeekCon(cid);
		List<List<Number>> chart2 = clientStatisticsService.getThisMonthCon(cid);
		List<List<Number>> chart3 = clientStatisticsService.getConProStatistics(cid);
		List<List<Number>> chart4 = clientStatisticsService.getHistoricalCon(cid);
		List<Number> chart5 = clientStatisticsService.getHistoricalConType(cid);
		
		List<ClientFavor> myFavor = clientStatisticsService.getMyFavorRes(cid);
		
		map.put("overview", overview);
		map.put("c1", chart1);
		map.put("c2", chart2);
		map.put("c3", chart3);
		map.put("c4", chart4);
		map.put("c5", chart5);
		map.put("myFavor", myFavor);
		
		
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
