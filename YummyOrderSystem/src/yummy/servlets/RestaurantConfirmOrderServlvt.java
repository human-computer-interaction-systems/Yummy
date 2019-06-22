package yummy.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import yummy.model.Restaurant;
import yummy.service.RestaurantService;

/**
 * Servlet implementation class RestaurantConfirmOrderServlvt
 */
@WebServlet("/RestaurantConfirmOrderServlvt")
public class RestaurantConfirmOrderServlvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantConfirmOrderServlvt() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext1.xml");
    	restaurantService = (RestaurantService)appliationContext.getBean("RestaurantService");
    }  
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String oid = request.getParameter("oid");
		System.out.println("oid: "+oid);
		restaurantService.affirmOrder(Integer.parseInt(oid));
		
		HttpSession session = request.getSession(true);
        Restaurant res = (Restaurant) session.getAttribute("res");
        Restaurant newRes = restaurantService.getRestaurant(Integer.toString(res.getRid()), res.getPassword());
        session.setAttribute("res", newRes);
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
