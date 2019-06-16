package yummy.servlets;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
public class MailSend {
	public static String sendSecurityCode(String email)
	   {   
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
	      Session session = Session.getDefaultInstance(properties,new Authenticator(){
	          public PasswordAuthentication getPasswordAuthentication()
	          {
	           return new PasswordAuthentication("2637468371@qq.com", "edxqqlwxcqddeadc"); //发件人邮件用户名、授权码
	          }
	         });
	      
	      String securityCode = "";
	 
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
	      
	      return securityCode;
	   }
	
	public static void main(String[] args) {
		System.out.println(sendSecurityCode("zhaoyong981224@163.com"));
	}
}
