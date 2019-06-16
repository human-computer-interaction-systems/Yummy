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
			// �ռ��˵�������
		      String to = email;
		 
		      // �����˵�������
		      String from = "2637468371@qq.com";
		 
		      // ָ�������ʼ�������Ϊ localhost
		      String host = "smtp.qq.com";
		 
		      // ��ȡϵͳ����
		      Properties properties = System.getProperties();
		 
		      // �����ʼ�������
		      properties.setProperty("mail.smtp.host", host);
		      
		      properties.put("mail.smtp.auth", "true");
		 
		      // ��ȡĬ��session����
		      session = Session.getDefaultInstance(properties,new Authenticator(){
		          public PasswordAuthentication getPasswordAuthentication()
		          {
		           return new PasswordAuthentication("2637468371@qq.com", "edxqqlwxcqddeadc"); //�������ʼ��û�������Ȩ��
		          }
		         });
		      
		      
		 
		      try{
		         // ����Ĭ�ϵ� MimeMessage ����
		         MimeMessage message = new MimeMessage(session);
		 
		         // Set From: ͷ��ͷ�ֶ�
		         message.setFrom(new InternetAddress(from));
		 
		         // Set To: ͷ��ͷ�ֶ�
		         message.addRecipient(Message.RecipientType.TO,
		                                  new InternetAddress(to));
		 
		         // Set Subject: ͷ��ͷ�ֶ�
		         message.setSubject("yummyϵͳ��֤");
		         
		         //��λ�����
		         securityCode = Integer.toString((int)((Math.random()*9+1)*100000));
		 
		         // ������Ϣ��
		         message.setText("������֤��Ϊ:  "+securityCode);
		 
		         // ������Ϣ
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


