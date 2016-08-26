package com.kitri.project01;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kitri.project01.dao.IDao;
import com.kitri.project01.dto.MemberDto;
import com.kitri.project01.mail.Email;
import com.kitri.project01.mail.EmailSender;
import com.kitri.project01.mail.Sender;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//ContentDao dao;
	
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	private EmailSender emailSender;
	private Sender sender;
	private Email email;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/index")
	public String index(){
		
		return "index";
	}
	@RequestMapping(value="/sign_up", method=RequestMethod.POST)
	public String sign_up(HttpServletRequest request, Model model, HttpSession session){
		System.out.println("sign_up");
		//HttpSession session = request.getSession();
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.sign_up(request.getParameter("email"), request.getParameter("password"), request.getParameter("userid"));
		//model.addAttribute(request.getParameter("email"));
		session.setAttribute("email", request.getParameter("email"));
		return "redirect:index";
	}
	
	@RequestMapping(value="/sign_out")
	public String sign_out(Model model, HttpSession session){
		session.invalidate();
		return "redirect:index";
	}
	
	@RequestMapping(value="/sign_in", method=RequestMethod.POST)
	public String sign_in(HttpServletRequest request, Model model, HttpSession session){
		System.out.println("sign in/////////////////////////////");
		System.out.println(request.getParameter("logemail"));
		System.out.println(request.getParameter("passwordinput"));
		
			MemberDto dto;
			IDao dao = sqlSession.getMapper(IDao.class);
			dto=dao.sign_in(request.getParameter("logemail"), request.getParameter("passwordinput"));
			System.out.println(request.getParameter("logemail"));
			System.out.println("dto.getEmail : "+ dto.getEmail());
			
			if(dto.getEmail().equals(request.getParameter("logemail"))){
				session.setAttribute("email", dto.getEmail());
			}else{
				System.out.println("��й�ȣ�� �̸����� Ʋ��");
			}
		

		
		
		/*
		
		model.addAttribute("request", request);
		SignInCommand command = new SignInCommand();
		command.execute(model);
		System.out.println(request.getParameter("email"));
		
		MemberDto dto;
		SignCheck sc = new SignCheck();
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(sc.check(request, dto)){
			model.addAttribute(request.getParameter("email"));
		}*/
		
		return "redirect:index";
	}
	
	@RequestMapping(value="/sendpw", method=RequestMethod.POST)
    public String sendEmailAction (HttpServletRequest request, Model model) throws Exception {
		
		MemberDto dto;
		String mail=request.getParameter("email");
		IDao dao = sqlSession.getMapper(IDao.class);
		dto=dao.find_pw(mail);
		
        
        String password=dto.getPassword();
        
        if(password!=null) {
            email.setContent("��й�ȣ�� ["+password+"] �Դϴ�.");
            email.setReceiver(mail);
            email.setSubject(mail+"�� ��й�ȣ ã�� �����Դϴ�.");
           // emailSender.SendMail(email);
        }
        return "redirect:index";
    }
	
	@RequestMapping(value="/sendvalue", method=RequestMethod.POST)
    public String sendvalue (HttpServletRequest request, Model model) throws Exception {
		
		/*
		String to=request.getParameter("email");
		String from = "recipe";
		String title = to+"�� ������ȣ �����Դϴ�.";
		String content ="������ȣ�� [  ] �Դϴ�.";
		
		System.out.println(to+"  "+ from);
		emailSender.sendMail(from, to, title, content);

		return "redirect:index";
		
		
		email = new Email();
		emailSender = new EmailSender(); 
		
		email.setReceiver(request.getParameter("email"));
		email.setContent("������ȣ�� [  ] �Դϴ�.");
		email.setSubject("������ȣ �����Դϴ�.");
		String from = "recipe";
		String title = "�� ������ȣ �����Դϴ�.";
		String content ="������ȣ�� [  ] �Դϴ�.";
		
		System.out.println(request.getParameter("email")+"\n"+email.getReceiver());
		emailSender.sendMail(email);

		 */
		
		email = new Email();
		emailSender = new EmailSender(); 
		sender = new Sender();
		
		sender.setMailSender(mailSender);
		
		email.setReceiver(request.getParameter("email"));
		email.setContent("������ȣ�� [  ] �Դϴ�.");
		email.setSubject("������ȣ �����Դϴ�.");
		
		String to = request.getParameter("email");
		String subject = "�� ������ȣ �����Դϴ�.";
		String content ="������ȣ�� [  ] �Դϴ�.";
		
		System.out.println(request.getParameter("email")+"\n"+email.getReceiver());
		//emailSender.sendMail(email);
		sender.sendmail(to);
		return "redirect:index";
    }
	
	
	
}
