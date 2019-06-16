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

import yummy.model.Manager;
import yummy.model.Restaurant;
import yummy.service.ManagerService;

/**
 * Servlet implementation class ManagerApprovalServlet
 */
@WebServlet("/ManagerApprovalServlet")
public class ManagerApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static ApplicationContext appliationContext;
	private static ManagerService managerService;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext.xml"); 
    	managerService = (ManagerService)appliationContext.getBean("ManagerService");
    } 
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String rid = request.getParameter("rid");
		System.out.println("rid: "+rid);
		System.out.println(managerService.approveR(rid));
		
		HttpSession session = request.getSession(true);
        Manager m =  (Manager) session.getAttribute("manager");
        Manager newM = managerService.getManager(Integer.toString(m.getManagerId()), m.getPassword());
        session.setAttribute("manager", newM);
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
