package yummy.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.gson.Gson;

import yummy.model.Goods;
import yummy.model.Restaurant;
import yummy.service.RestaurantService;

/**
 * Servlet implementation class RestaurantRegister
 */
@WebServlet("/RestaurantRegister")
public class RestaurantRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantRegisterServlet() {
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
		
		String rid = restaurantService.getNewRid();
		//System.out.println(rid);
		Gson gson = new Gson();
		String json = gson.toJson(rid);
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
		
		Restaurant newR = new Restaurant();
		String rid = request.getParameter("rid");
		String rname = request.getParameter("rname");
		String password = request.getParameter("pwd");
		String address = request.getParameter("address");
		String typeS = request.getParameter("rtype");
		
		newR.setRid(Integer.parseInt(rid));
		newR.setRname(rname);
		newR.setPassword(password);
		newR.setRaddress(address);
		newR.setBalance(0);
		newR.setRgoods(new ArrayList<Goods>());
		newR.setRtype(Integer.parseInt(typeS));
		
		restaurantService.registerRestaurant(newR);
		
		//点击跳转到主页，传递参数
		Restaurant res = restaurantService.getRestaurant(rid, password);
		HttpSession session = request.getSession(true);
        session.setAttribute("res", res);
        response.sendRedirect("RestaurantInfo.jsp");
		
		//doGet(request, response);
		
	}

}
