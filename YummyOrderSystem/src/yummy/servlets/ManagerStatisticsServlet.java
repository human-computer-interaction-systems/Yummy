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

import yummy.model.Client;
import yummy.model.Restaurant;
import yummy.service.ManagerService;

/**
 * Servlet implementation class ManagerStatisticsServlet
 */
@WebServlet("/ManagerStatisticsServlet")
public class ManagerStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	private static ManagerService managerService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerStatisticsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	managerService = (ManagerService)appliationContext.getBean("ManagerService");
    }  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ArrayList<Client> allClients = managerService.getAllClients();
		ArrayList<Restaurant> allRes = managerService.getAllRestaurants();
		int ctype1 = 0;
		int ctype2 = 0;
		int rtype1 = 0;
		int rtype2 = 0;
		
		for(Client e: allClients) {
			if(e.getLevel() == 1) {
				ctype1++;
			}else if(e.getLevel() == 2) {
				ctype2++;
			}
		}
		
		for(Restaurant e: allRes) {
			if(e.getRtype() == 1) {
				rtype1++;
			}else if(e.getRtype() == 2) {
				rtype2++;
			}
		}
		
		Map<String,Integer> map = new HashMap<>();
		map.put("ctype1", ctype1);
		map.put("ctype2", ctype2);
		map.put("rtype1", rtype1);
		map.put("rtype2", rtype2);
		
		
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
