package yummy.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import yummy.service.ClientService;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private static ApplicationContext appliationContext;
	
	private static ClientService clientService;
	
    public ClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {  
    	super.init();
    	appliationContext = new ClassPathXmlApplicationContext("applicationContext1.xml");
    	clientService = (ClientService)appliationContext.getBean("ClientService");
    }  

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//Client client = clientService.getClientByEmail("laogang@163.com");
		
//		Client client = new Client();
//		client.setCname("����");
//		client.setPhone("13895270005");
//		client.setPassword("zhaoyong123");
//		client.setLevel(1);
//		client.setPaymentCode(123456);
//		client.setEmail("zhaoyong@163.com");
//		ArrayList<String> addresses = new ArrayList<String>();
//		addresses.add("����23��");
//		addresses.add("��¥18��");
//		client.setAddresses(addresses);
//		System.out.println(clientService.registerClient(client));
		
//		Client client = clientService.getClientByName("����modTest", "zhaoyong123");
//		client.setCname("����");
//		client.setPhone("13895270005");
//		ArrayList<String> addresses = new ArrayList<String>();
//		addresses.add("����1��");
//		addresses.add("�½ֿ�10��");
//		client.setAddresses(addresses);
//		System.out.println(clientService.modifyInfo(client));
//		System.out.println(clientService.recharge(3, 345678, 200));
//		System.out.println(clientService.payment(4, 456789, 30));
//		System.out.println(clientService.writeOff(1));
		//System.out.println(clientService.recharge(2, 2312567, 100));
//		for(String e: client.getAddresses()) {
//			System.out.println(e);
//		}
//		PrintWriter out = response.getWriter();
//        out.println("<html>");
//        out.println("<head><title>Login</title></head>");
//        out.println("<body>");
////        out.println("<h2>"+client.getCid()+"</h2>");
////        for(String e: client.getAddresses()) {
////			//System.out.println(e);
////        	out.println("<h2>"+e+"</h2>");
////		}
//        out.println("</body></html>");
		
//		//���Ͳ���
//		Order order = new Order();
//		order.setCid(3);
//		order.setRid(1903003);
//		order.setCaddress("�Ͼ���ѧ��¥У�����ѧԺԺ¥");
//		order.setTotalAmount(18);
//		Calendar c = Calendar.getInstance();    
//		java.text.SimpleDateFormat f=new java.text.SimpleDateFormat("yyMMddHHmmss");
//		order.setOrderTime(f.format(c.getTime()));
//		 //System.out.println(f.format(c.getTime())); 
//		Goods goods = new Goods();
//		goods.setRid(1903003);
//		goods.setFoodName("ը��");
//		goods.setNumber(1);
//		goods.setAmount(18);
//		ArrayList<Goods> a = new ArrayList<Goods>();
//		a.add(goods);
//		order.setGoods(a);
//		
//		System.out.println(clientService.newOrder(order));
//		
//		//������ɸ���
//		System.out.println(clientService.payment(3, 345678, 18));
		
		//�˶�����
		System.out.println("hello");
		String email = request.getParameter("email");
		System.out.println(email);
	}

}
