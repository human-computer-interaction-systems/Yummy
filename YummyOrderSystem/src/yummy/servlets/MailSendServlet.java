package yummy.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.Session;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class MailSendServlet
 */
@WebServlet("/MailSendServlet")
public class MailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("hello");
		String email = request.getParameter("email");
		System.out.println(email);
		Gson gson = new Gson();
		String securityCode = sendSecurityCode(email);
		String json = gson.toJson(securityCode);
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
		

		doGet(request, response);
	}
	
	private String sendSecurityCode(String email)
	   {   
		String securityCode = "";
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			Session session = (Session) envCtx.lookup("mail/Dog");
			// 收件人电子邮箱
		      String to = email;
		 
		      // 发件人电子邮箱
		      String from = "2637468371@qq.com";
		 
		      // 指定发送邮件的主机为 localhost
		      String host = "smtp.qq.com";
		 
		      // 获取系统属性
		      Properties properties = System.getProperties();
		 
		      // 设置邮件服务器
		      properties.setProperty("mail.smtp.host", host);
		      
		      properties.put("mail.smtp.auth", "true");
		 
		      // 获取默认session对象
		      session = Session.getDefaultInstance(properties,new Authenticator(){
		          public PasswordAuthentication getPasswordAuthentication()
		          {
		           return new PasswordAuthentication("2637468371@qq.com", "edxqqlwxcqddeadc"); //发件人邮件用户名、授权码
		          }
		         });
		      
		      
		 
		      try{
		         // 创建默认的 MimeMessage 对象
		         MimeMessage message = new MimeMessage(session);
		 
		         // Set From: 头部头字段
		         message.setFrom(new InternetAddress(from));
		 
		         // Set To: 头部头字段
		         message.addRecipient(Message.RecipientType.TO,
		                                  new InternetAddress(to));
		 
		         // Set Subject: 头部头字段
		         message.setSubject("yummy系统验证");
		         
		         //六位随机数
		         securityCode = Integer.toString((int)((Math.random()*9+1)*100000));
		 
		         // 设置消息体
		         message.setText("您的验证码为:  "+securityCode);
		 
		         // 发送消息
		         Transport.send(message);
		         System.out.println("Sent message successfully....");
		      }catch (MessagingException mex) {
		         mex.printStackTrace();
		      }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

		
	      
	      
	      return securityCode;
	   }

}


