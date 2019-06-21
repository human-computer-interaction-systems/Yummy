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

import yummy.model.Discount;
import yummy.model.Restaurant;
import yummy.service.RestaurantService;

/**
 * Servlet implementation class RegisterLoginServlet
 */
@WebServlet("/RestaurantLoginServlet")
public class RestaurantLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private static ApplicationContext appliationContext;
	private static RestaurantService restaurantService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestaurantLoginServlet() {
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
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String rid = request.getParameter("uname");//此处做识别码用
		String pwd = request.getParameter("pwd");
		System.out.println(rid);
		System.out.println(pwd);
		Restaurant res = restaurantService.getRestaurant(rid, pwd);
		if(res.getRname()!=null) {
			HttpSession session = request.getSession(true);
	        session.setAttribute("res", res);
	        System.out.println(res.getUrl());
	        ArrayList<Discount> dis = restaurantService.getRestaurantDis(Integer.parseInt(rid));
	        session.setAttribute("resDiscount", dis);
	        response.sendRedirect("RestaurantInfo.jsp");
		}else {
			showErrorMessage(response, "用户名或密码错误，请重新输入");
		}
	}
	
	private void showErrorMessage(HttpServletResponse res, String msg) throws IOException{
		//修改
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        out.println("<html>");
        out.println("<head><title>Login</title></head>");
        out.println("<body>");
        out.println("<h1>登录错误信息</h1>");
        out.println("<h2>"+msg+"</h2>");
        out.println("<a href=\"Login.jsp?identity=2\">返回</a>");
        out.println("</body></html>");
    }

}
