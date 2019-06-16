package yummy.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SelectServlet
 */
@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       //用于选择转发到相应的登录注册界面并传递参数
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String identity = request.getParameter("identity");
		String operation = request.getParameter("loginOrR");
		if(operation.equals("1")) {
			response.sendRedirect("Login.jsp?"+"identity="+identity);
		}
		else {
			if(identity.equals("1")) {
				response.sendRedirect("ClientRegister.jsp");
			}
			else {
				response.sendRedirect("RestaurantRegister.jsp?");
			}
		}
		System.out.println(identity);
		System.out.println(operation);
		//根据参数转发页面并发送参数
	}

}
