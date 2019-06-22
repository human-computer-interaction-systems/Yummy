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
 * Servlet implementation class RestaurantInfoChangeServlet
 */
@WebServlet("/RestaurantInfoChangeServlet")
public class RestaurantInfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantInfoChangeServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		Restaurant res = (Restaurant) session.getAttribute("res");
		if(!request.getParameter("raddress").equals("")) {
			res.setRaddress(request.getParameter("raddress"));
        }

        System.out.println(restaurantService.modifyInfo(res));
        
        //���»Ự��
        Restaurant newRes = restaurantService.getRestaurant(Integer.toString(res.getRid()), res.getPassword());
        session.setAttribute("res", newRes);

        response.sendRedirect("RestaurantInfo.jsp");
	}

}
