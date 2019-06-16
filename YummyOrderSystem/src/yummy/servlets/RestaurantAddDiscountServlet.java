package yummy.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import yummy.model.Discount;
import yummy.model.Restaurant;
import yummy.service.RestaurantService;

/**
 * Servlet implementation class RestaurantAddDiscountServlet
 */
@WebServlet("/RestaurantAddDiscountServlet")
public class RestaurantAddDiscountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantAddDiscountServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String amount = request.getParameter("amount");
		String discount = request.getParameter("discount");
		
		HttpSession session = request.getSession(true);
        Restaurant res = (Restaurant) session.getAttribute("res");
        
        Discount dis = new Discount();
        dis.setRid(res.getRid());
        dis.setAmount(Double.parseDouble(amount));
        dis.setDiscount(Double.parseDouble(discount));
        
        //添加该优惠信息
        System.out.println(restaurantService.addDiscount(dis));
        
        ArrayList<Discount> newdis = restaurantService.getRestaurantDis(res.getRid());
        session.setAttribute("resDiscount", newdis);
        
        response.sendRedirect("RestaurantInfo.jsp");
	}

}
