package yummy.servlets;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
public class MailSend {
	public static String sendSecurityCode(String email)
	   {   
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
	      Session session = Session.getDefaultInstance(properties,new Authenticator(){
	          public PasswordAuthentication getPasswordAuthentication()
	          {
	           return new PasswordAuthentication("2637468371@qq.com", "edxqqlwxcqddeadc"); //�������ʼ��û�������Ȩ��
	          }
	         });
	      
	      String securityCode = "";
	 
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
	      
	      return securityCode;
	   }
	
	public static void main(String[] args) {
		System.out.println(sendSecurityCode("zhaoyong981224@163.com"));
	}
}
