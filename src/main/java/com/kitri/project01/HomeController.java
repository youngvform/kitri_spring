package com.kitri.project01;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.project01.dao.IDao;
import com.kitri.project01.dto.MemberDto;
import com.kitri.project01.sendmail.Email;
import com.kitri.project01.sendmail.EmailSender;


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
	   private EmailSender emailSender;
	   @Autowired
	   private Email email;
	
	   
	   
	String rnum="";
	
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
	
	//회원 가입 처리
	@RequestMapping(value="/sign_up", method=RequestMethod.POST)
	public String sign_up(HttpServletRequest request, Model model, HttpSession session){
		System.out.println("sign_up() start");
		//HttpSession session = request.getSession();
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.sign_up(request.getParameter("email"), request.getParameter("password"), request.getParameter("userid"));
		//model.addAttribute(request.getParameter("email"));
		session.setAttribute("email", request.getParameter("email"));
		return "redirect:index";
	}
	
	//로그아웃 처리
	@RequestMapping(value="/sign_out")
	public String sign_out(Model model, HttpSession session){
		System.out.println("sign_out() start");
		session.invalidate();
		return "redirect:index";
	}
	
	
	//로그인 처리
	@RequestMapping(value="/sign_in", method=RequestMethod.POST)
	public String sign_in(HttpServletRequest request, Model model, HttpSession session){
		System.out.println("sign in() start");
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
				System.out.println("비밀번호나 이메일이 틀림");
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
	
	//회원 가입시 인증 메일 보내기
    @RequestMapping(value="/sendmail", method=RequestMethod.POST)
    public String sendEmailAction (HttpServletRequest request) throws Exception {
   
    	System.out.println("sendmail() start");
    	
    	Random r = new Random();
    	int rn = (r.nextInt(1000000)+100000);
    	if(rn>1000000) rn-=100001;
    	rnum = rn +"";
    	String msg="";
    	
        String e_mail=request.getParameter("email");
 
        System.out.println("rnum = "+rnum);
        
        try{
            email.setContent("인증 번호는 "+rnum+" 입니다.");
            email.setReceiver(e_mail);
            email.setSubject("인증 메일입니다.");
            emailSender.SendEmail(email);
            
            msg =e_mail+"로 메일 전송 성공";
            
        }catch(Exception e){
        	msg="실패 이유 : " + e.getMessage();
		       
        }
            
        return "Send";
    }
    
    //비밀번호 찾기 메일 보내기
	@RequestMapping(value="/sendpw", method=RequestMethod.POST)
    public String sendPW (HttpServletRequest request) throws Exception {
		System.out.println("sendpw() start");
		
		MemberDto dto;
		String e_mail=request.getParameter("email");
		IDao dao = sqlSession.getMapper(IDao.class);
		dto=dao.find_pw(e_mail);
		
        
        String password=dto.getPassword();
        System.out.println("email = "+e_mail +"password = "+password);
        
        if(password!=null) {
        	email.setContent("비밀번호는 "+password+" 입니다.");
            email.setReceiver(e_mail);
            email.setSubject("비밀번호 찾기 메일입니다.");
            emailSender.SendEmail(email);
           // emailSender.SendMail(email);
        }
        return "redirect:index";
    }
	
	//회원 탈퇴
	@RequestMapping("/deleteID")
	public String deleteID(HttpSession session){
		String email = (String) session.getAttribute("email");
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.deleteID(email);
		
		return "redirect:index";
	}
	
	


	
	
	
}
