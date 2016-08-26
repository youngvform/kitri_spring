package com.kitri.project01.mail;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {
	
	@Autowired
	protected JavaMailSender mailSender;
	
	public void sendMail(Email email) throws Exception{
		MimeMessage msg = mailSender.createMimeMessage();
		try{
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
			
		}catch(MessagingException e){
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		try{
			mailSender.send(msg);
		}catch(MailException e){
			System.out.println("MailException ¹ß»ý");
			e.printStackTrace();
		}
	}
	/*
	public void sendMail(final String from, final String to, final String title, final String htmlCode) {
	    final MimeMessage msg = mailSender.createMimeMessage();
	    try {
	        msg.setSubject(title, "UTF-8");
	        msg.setText(htmlCode, "UTF-8", "html");
	        //msg.setFrom(new InternetAddress(from));
	        msg.addRecipients(RecipientType.TO, to);
	        mailSender.send(msg);
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
*/

}
