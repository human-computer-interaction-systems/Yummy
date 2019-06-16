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

import yummy.model.Client;
import yummy.service.ClientService;

/**
 * Servlet implementation class ClientCancelOrderServlvt
 */
@WebServlet("/ClientCancelOrderServlvt")
public class ClientCancelOrderServlvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ApplicationContext appliationContext;
	
	private static ClientService clientService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientCancelOrderServlvt() {
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
		String oid = request.getParameter("oid");
		System.out.println("oid: "+oid);
		clientService.cancelOrder(Integer.parseInt(oid));
		
		HttpSession session = request.getSession(true);
        Client client = (Client) session.getAttribute("client");
		Client newClient = clientService.getClientByEmail(client.getEmail());
        session.setAttribute("client", newClient);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
