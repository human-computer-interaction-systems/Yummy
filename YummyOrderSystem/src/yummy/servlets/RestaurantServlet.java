package yummy.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import yummy.service.RestaurantService;

/**
 * Servlet implementation class RestaurantServlet
 */
@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String newRid = restaurantService.getNewRid();
		System.out.println(restaurantService.getNewRid());
		
//		//ע��
//		Restaurant newR = new Restaurant();
//		newR.setRid(Integer.parseInt(newRid));
//		newR.setRname("��ʽը��");
//		newR.setRtype(1);
//		newR.setRaddress("����·1��");
//		newR.setBalance(0);
//		ArrayList<Goods> newRGoods = new ArrayList<Goods>();
//		Goods temp = new Goods();
//		temp.setRid(Integer.parseInt(newRid));
//		temp.setFoodName("ը��");
//		temp.setPrice(18);
//		temp.setQuantity(100);
//		temp.setAmount(0);
//		//temp.setPrice(0);
//		newRGoods.add(temp);
//		newR.setRgoods(newRGoods);
//		System.out.println(restaurantService.registerRestaurant(newR));
		
		//�޸���Ϣ
//		Restaurant newR = new Restaurant();
//		newR.setRid(1903003);
//		newR.setRaddress("�人·1��");
//		newR.setRtype(2);
//		System.out.println(restaurantService.modifyInfo(newR));
		
//		Restaurant r = restaurantService.getRestaurant("1903001", "bmcs123");
//		System.out.println(r.getRname()+" "+r.getBalance());
//		for(Goods e: r.getRgoods()) {
//			System.out.println(e.getFoodName()+" "+e.getQuantity());
//		}
		
		//�����ʹ����
		System.out.println(restaurantService.affirmOrder(2));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
