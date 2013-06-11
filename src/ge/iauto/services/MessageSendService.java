package ge.iauto.services;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MessageSendService {
	public static void sendMessage(String to,String code){
		final String username = "freeiauto@gmail.com";
		final String password = "otherwise";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("from-email@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));
			message.setSubject("IAUTO - ვერიფიკაცია","UTF-8");
			message.setText("თქვენი ვერიფიკაციის კოდია:  " + code,"UTF-8");
 
			Transport.send(message);
 
			System.out.println("message sent!");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
