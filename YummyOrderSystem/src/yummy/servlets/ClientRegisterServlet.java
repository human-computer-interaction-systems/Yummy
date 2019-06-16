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

import yummy.model.Client;
import yummy.service.ClientService;

/**
 * Servlet implementation class ClientRegisterServlet
 */
@WebServlet("/ClientRegisterServlet")
public class ClientRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ApplicationContext appliationContext;
	
	private static ClientService clientService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientRegisterServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Client newclient = new Client();
		
		String name = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("u_mail");
		String phone = request.getParameter("phone");
		String paymentCode = request.getParameter("paymentCode");
		String address = request.getParameter("address");
		
		newclient.setCname(name);
		newclient.setPassword(pwd);
		newclient.setEmail(email);
		newclient.setPhone(phone);
		newclient.setPaymentCode(Integer.parseInt(paymentCode));
		ArrayList<String> a = new ArrayList<String>();
		a.add(address);
		newclient.setAddresses(a);
		clientService.registerClient(newclient);
		
		//点击跳转到主页，传递参数
		Client client = clientService.getClientByName(name, pwd);
		HttpSession session = request.getSession(true);
        session.setAttribute("client", client);
        response.sendRedirect("ClientGetRs.jsp");
	}
	
	

}
