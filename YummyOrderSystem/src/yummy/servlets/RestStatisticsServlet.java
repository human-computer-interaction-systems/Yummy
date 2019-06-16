package yummy.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.gson.Gson;

import yummy.model.Order;
import yummy.service.RestaurantService;

/**
 * Servlet implementation class RestStatisticsServlet
 */
@WebServlet("/RestStatisticsServlet")
public class RestStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestStatisticsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	restaurantService = (RestaurantService)appliationContext.getBean("RestaurantService");
    }  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String rid = request.getParameter("rid");
		System.out.println("rid: "+rid);
		ArrayList<Order> orders = restaurantService.getRestaurantOrders(Integer.parseInt(rid));
		int historyDelivered = 0;
		int historyUndelivered = 0;
		int largeOrder = 0;
		int smallOrder = 0;
		for(Order e: orders) {
			if(e.isDelivery()&&!e.isDisorder()) {
				historyDelivered++;
				if(e.getTotalAmount() > 100) {
					largeOrder++;
				}else if(e.getTotalAmount() <= 100) {
					smallOrder++;
				}
			}else if(!e.isDelivery()&&e.isDisorder()) {
				historyUndelivered++;
			}
		}
		
		Map<String,Integer> map = new HashMap<>();
		map.put("ctype1", historyDelivered);
		map.put("ctype2", historyUndelivered);
		map.put("rtype1", largeOrder);
		map.put("rtype2", smallOrder);
		
		
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
