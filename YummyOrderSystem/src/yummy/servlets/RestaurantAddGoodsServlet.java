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

import yummy.model.Goods;
import yummy.model.Restaurant;
import yummy.service.RestaurantService;

/**
 * Servlet implementation class RestaurantAddGoodsServlet
 */
@WebServlet("/RestaurantAddGoodsServlet")
public class RestaurantAddGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantAddGoodsServlet() {
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
		
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		
		HttpSession session = request.getSession(true);
        Restaurant res = (Restaurant) session.getAttribute("res");
        
        ArrayList<Goods> newGoods = new ArrayList<Goods>();
        Goods goods = new Goods();
        goods.setRid(res.getRid());
        goods.setFoodName(name);
        goods.setPrice(Double.parseDouble(price));
        goods.setQuantity(Integer.parseInt(quantity));
        goods.setNumber(0);
        goods.setAmount(0);
        newGoods.add(goods);
        
        System.out.println(restaurantService.addGoods(newGoods));
        
        //更新会话域
        Restaurant newRes = restaurantService.getRestaurant(Integer.toString(res.getRid()), res.getPassword());
        session.setAttribute("res", newRes);
        
        response.sendRedirect("RestaurantInfo.jsp");
	}

}
