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

import yummy.model.Manager;
import yummy.service.ManagerService;

/**
 * Servlet implementation class ManagerLoginServlet
 */
@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	private static ManagerService managerService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext1.xml");
    	managerService = (ManagerService)appliationContext.getBean("ManagerService");
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
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("uname");//�˴���id��
		String pwd = request.getParameter("pwd");
		System.out.println(id);
		System.out.println(pwd);
		Manager manager = managerService.getManager(id, pwd);
		if(manager.getPassword()!=null) {
			HttpSession session = request.getSession(true);
	        session.setAttribute("manager", manager);
	        
	        request.getRequestDispatcher("ManagerInfo.jsp").forward(request, response);
		}else {
			showErrorMessage(response, "�û����������������������");
		}
	}
	
	private void showErrorMessage(HttpServletResponse res, String msg) throws IOException{
		//�޸�
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        out.println("<html>");
        out.println("<head><title>Login</title></head>");
        out.println("<body>");
        out.println("<h1>��¼������Ϣ</h1>");
        out.println("<h2>"+msg+"</h2>");
        out.println("<a href=\"Login.jsp?identity=3\">����</a>");
        out.println("</body></html>");
    }

}
