package yummy.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.gson.Gson;

import yummy.model.Client;
import yummy.service.ClientService;

/**
 * Servlet implementation class ClientLoginServlet
 */
@WebServlet("/ClientLoginServlet")
public class ClientLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ApplicationContext appliationContext;
	
	private static ClientService clientService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	clientService = (ClientService)appliationContext.getBean("ClientService");
    }  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//doPost(request, response);
		String email = request.getParameter("email");
		Client client = clientService.getClientByEmail(email);
		System.out.println("name: "+client.getCname());
		Gson gson = new Gson();
		String json = gson.toJson(client);
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
		
		String name = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		//doGet(request, response);
		
		System.out.println(name);
		System.out.println(pwd);
		Client client = new Client();
		if(name.contains("@")&&name.contains("."))
		{
			client = clientService.getClientByEmail(name);
		}else {
		    client = clientService.getClientByName(name, pwd);
		}
		if(client.getCname()!=null && client.getLevel() != 0 && client.getPassword().equals(pwd)) {
			HttpSession session = request.getSession(true);
	        session.setAttribute("client", client);
	        response.sendRedirect("ClientInfo.jsp");
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
        out.println("<a href=\"Login.jsp?identity=1\">返回</a>");
        out.println("</body></html>");
    }
}
