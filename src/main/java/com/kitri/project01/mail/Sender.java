
package com.kitri.project01.mail;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

public class Sender {

	@Autowired
	protected JavaMailSender mailSender;
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void sendmail(final String to) throws Exception{
		final MimeMessage msg = mailSender.createMimeMessage();
		
		String subject = "�� ������ȣ �����Դϴ�.";
		String content ="������ȣ�� [  ] �Դϴ�.";
		
		msg.setSubject(subject);
		msg.setText(content);
		msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(to));
		
		
		//MimeMessage msg = new MimeMessage(mailSender.createMimeMessage());
//		
//		try {
//			to = "bigrecipe@gmail.com";
//            message.setSubject("[����] ȸ�� ���� �ȳ�", "UTF-8");
//            String htmlContent = "<strong>�ȳ��ϼ���</strong>, �ݰ����ϴ�.";
//            message.setText(htmlContent, "UTF-8", "html");
//            message.setFrom(new InternetAddress("gz.kyungho@gmail.com"));
//            message.addRecipient(RecipientType.TO, new InternetAddress(to));
//            mailSender.send(message);
//       
//		} catch (MessagingException e) {
//            e.printStackTrace();
//            return;
//        } catch (MailException e) {
//            e.printStackTrace();
//            return;
//        } // try - catch
//		
//			to="bigrecipe@gmail.com";
//			subject="aaaa";
//			content = "bbb";
//			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
//			msg.setSubject(subject); // ���� ����
//			msg.setText(content);  // ���� ����
//			//msg.setSentDate(new Date());// ������ ��¥ ����
//			msg.setContent(content, "text/html;charset=UTF-8"); 
//			//Transport.send(msg);  // ���� ������
//			mailSender.send(msg);
		
//			final String from = "bigrecipe@gmail.com";
//			mailSender.send(new MimeMessagePreparator() {
//
//            @Override
//            public void prepare(MimeMessage paramMimeMessage) throws Exception {
//                MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(paramMimeMessage, true, "UTF-8");
//
//                mimeMessageHelper.setTo(to);
//                mimeMessageHelper.setFrom(from);
//                mimeMessageHelper.setSubject(subject);
//                mimeMessageHelper.setText(content);
//
//                //final File file = new File("test filename");
//
//                
//
//            };
//        });
//		
	}
}
