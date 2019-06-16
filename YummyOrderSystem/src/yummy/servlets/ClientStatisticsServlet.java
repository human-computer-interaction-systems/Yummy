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
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.gson.Gson;

import yummy.model.Client;
import yummy.model.Order;
import yummy.service.ClientService;

/**
 * Servlet implementation class ClientStatisticsServlet
 */
@WebServlet("/ClientStatisticsServlet")
public class ClientStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ApplicationContext appliationContext;
	
	private static ClientService clientService;
    /**	
     * @see HttpServlet#HttpServlet()
     */
    public ClientStatisticsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	clientService = (ClientService)appliationContext.getBean("ClientService");
    }  
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String cid = request.getParameter("cid");
		System.out.println("cid: "+cid);
		
		double consumption = 0;
		ArrayList<Order> orders = clientService.getClientOrders(Integer.parseInt(cid));
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
				consumption += e.getTotalAmount();
			}else if(!e.isDelivery()&&e.isDisorder()) {
				historyUndelivered++;
			}
		}
		
		if(consumption > 100) {
			HttpSession session = request.getSession(true);
	        Client client = (Client) session.getAttribute("client");
			if(client.getLevel() == 1) {
				System.out.println(clientService.upgrade(Integer.parseInt(cid)));
				Client newClient = clientService.getClientByEmail(client.getEmail());
		        session.setAttribute("client", newClient);
			}
			
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("ctype1", historyDelivered);
		map.put("ctype2", historyUndelivered);
		map.put("rtype1", largeOrder);
		map.put("rtype2", smallOrder);
		
		
		map.put("myDYDD", 15);
		map.put("myDYTD", 2);
		map.put("myDYXF", 318.8);
		map.put("myDYSJ", 6);
		
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
