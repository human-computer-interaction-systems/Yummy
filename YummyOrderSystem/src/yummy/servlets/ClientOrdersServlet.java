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
import yummy.service.ClientService;

/**
 * Servlet implementation class ClientOrdersServlet
 */
@WebServlet("/ClientOrdersServlet")
public class ClientOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ApplicationContext appliationContext;
	
	private static ClientService clientService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientOrdersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext1.xml");
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
		ArrayList<Order> orders = clientService.getClientOrders(Integer.parseInt(cid));
		ArrayList<Order> undelivered = new ArrayList<Order>();
		ArrayList<Order> historyDelivered = new ArrayList<Order>();
		ArrayList<Order> historyUndelivered = new ArrayList<Order>();
		for(Order e: orders) {
			System.out.println(e.getOid()+" "+e.getCid()+" "+e.isDelivery()+" "+e.isDisorder());
			if(!e.isDelivery()&&!e.isDisorder()) {
				undelivered.add(e);
			}else if(e.isDelivery()&&!e.isDisorder()) {
				historyDelivered.add(e);
			}else if(!e.isDelivery()&&e.isDisorder()) {
				historyUndelivered.add(e);
			}
		}
		Map<String,ArrayList<Order>> map = new HashMap<>();
		map.put("undelivered", undelivered);
		map.put("historyDelivered", historyDelivered);
		map.put("historyUndelivered", historyUndelivered);
		
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
