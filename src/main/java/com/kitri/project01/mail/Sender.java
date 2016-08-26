
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
		
		String subject = "님 인증번호 메일입니다.";
		String content ="인증번호는 [  ] 입니다.";
		
		msg.setSubject(subject);
		msg.setText(content);
		msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(to));
		
		
		//MimeMessage msg = new MimeMessage(mailSender.createMimeMessage());
//		
//		try {
//			to = "bigrecipe@gmail.com";
//            message.setSubject("[공지] 회원 가입 안내", "UTF-8");
//            String htmlContent = "<strong>안녕하세요</strong>, 반갑습니다.";
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
//			msg.setSubject(subject); // 제목 설정
//			msg.setText(content);  // 내용 설정
//			//msg.setSentDate(new Date());// 보내는 날짜 설정
//			msg.setContent(content, "text/html;charset=UTF-8"); 
//			//Transport.send(msg);  // 메일 보내기
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
