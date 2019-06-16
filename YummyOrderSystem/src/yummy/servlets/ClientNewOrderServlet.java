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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import yummy.model.Client;
import yummy.model.Goods;
import yummy.model.Order;
import yummy.service.ClientService;

/**
 * Servlet implementation class ClientNewOrderServlet
 */
@WebServlet("/ClientNewOrderServlet")
public class ClientNewOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static ApplicationContext appliationContext;
	
	private static ClientService clientService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientNewOrderServlet() {
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
		
		String orderData = request.getParameter("data");
		System.out.println("data: "+orderData);
		
		JsonObject jsonObject = (JsonObject) new JsonParser().parse(orderData);
		Order newOrder = new Order();
		newOrder.setCid(jsonObject.get("cid").getAsInt());
		newOrder.setRid(jsonObject.get("rid").getAsInt());
		newOrder.setCaddress(jsonObject.get("caddress").getAsString());
		newOrder.setTotalAmount(jsonObject.get("totalAmount").getAsDouble());
		
		System.out.println(newOrder.getRid());
		System.out.println(newOrder.getCid());
		System.out.println(newOrder.getCaddress());
		
		JsonArray goods = jsonObject.getAsJsonArray("goods");
		ArrayList<Goods> gs = new ArrayList<Goods>();
		for(int i = 0; i < goods.size(); i++) {
			JsonObject jsonObject2 = goods.get(i).getAsJsonObject();
			Goods a = new Goods();
			a.setRid(jsonObject2.get("rid").getAsInt());
			a.setFoodName(jsonObject2.get("foodName").getAsString());
			a.setNumber(jsonObject2.get("number").getAsInt());
			a.setAmount(jsonObject2.get("amount").getAsDouble());
			gs.add(a);
		}
		
		newOrder.setGoods(gs);
		
		System.out.println(clientService.newOrder(newOrder));
		
		//¸¶¿î
		HttpSession session = request.getSession(true);
        Client client = (Client) session.getAttribute("client");
		System.out.println(clientService.payment(client.getCid(), client.getPaymentCode(), newOrder.getTotalAmount()));
		Client newClient = clientService.getClientByEmail(client.getEmail());
        session.setAttribute("client", newClient);
	}

}
