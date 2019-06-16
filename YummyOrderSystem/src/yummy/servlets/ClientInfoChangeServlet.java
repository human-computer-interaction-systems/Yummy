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
 * Servlet implementation class ClientInfoChangeServlet
 */
@WebServlet("/ClientInfoChangeServlet")
public class ClientInfoChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	
	private static ClientService clientService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientInfoChangeServlet() {
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
		HttpSession session = request.getSession(true);
        Client client = (Client) session.getAttribute("client");
       
        if(!request.getParameter("name").equals("")) {
        	client.setCname(request.getParameter("name"));
        }
        if(!request.getParameter("phone").equals("")) {
        	client.setPhone(request.getParameter("phone"));
        }
        if(!request.getParameter("address").equals("")) {
        	ArrayList<String> addresses = client.getAddresses();
        	addresses.add(request.getParameter("address"));
        	client.setAddresses(addresses);
        }
        System.out.println(clientService.modifyInfo(client));
        Client newClient = clientService.getClientByEmail(client.getEmail());
        
        session.setAttribute("client", newClient);
        
        response.sendRedirect("ClientInfo.jsp");
	}

}
