package yummy.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import yummy.model.Client;
import yummy.model.Manager;
import yummy.model.Restaurant;
import yummy.service.ManagerService;
import yummy.service.RestaurantService;

/**
 * Servlet implementation class ManagerServlet
 */
@WebServlet("/ManagerServlet")
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ApplicationContext appliationContext;
	private static ManagerService managerService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Manager m = new Manager();
		m = managerService.getManager("123456", "yummyManager");
		System.out.println(m.getSysbanance());
		ArrayList<Restaurant> res = managerService.getAllUnderApparoveR();
		for(Restaurant e: res) {
			System.out.println(e.getRid()+" "+e.getRaddress()+" "+e.getRtype());
		}
		//System.out.println(managerService.approveR("1903003"));
		ArrayList<Client> clients = managerService.getAllClients();
		for(Client e: clients) {
			System.out.println(e.getCname()+" "+e.getLevel()+" "+e.getEmail());
		}
		ArrayList<Restaurant> rests = managerService.getAllRestaurants();
		for(Restaurant e:rests) {
			System.out.println(e.getRname()+" "+e.getRaddress()+" "+e.getRtype());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
