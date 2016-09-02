package com.kitri.project01;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	String e_mail ="";
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@RequestMapping("/index")
	public String index(){
		
		return "index";
	}
	
	//회원 가입 처리
	@RequestMapping(value="/sign_up", method=RequestMethod.POST)
	public String sign_up(HttpServletRequest request, Model model, HttpSession session){
		//		try{
		System.out.println("sign_up() start");
		//HttpSession session = request.getSession();
		String thisMail = request.getParameter("email");
		String thisValid = request.getParameter("valid-value");
		String pass = request.getParameter("password");
		String repass = request.getParameter("repass");
		String name = request.getParameter("name");
		
		System.out.println(thisMail);
		System.out.println(thisValid);
		System.out.println(pass);
		System.out.println(repass);


		boolean checkOk = false;

		String msg ="";
		MemberDto dto;
		IDao dao = sqlSession.getMapper(IDao.class);

		try{


			if(!thisMail.equals(e_mail)){
				msg = "인증 이메일과 입력 이메일이 다릅니다.";
				checkOk = false;
			}else if(!thisValid.equals(rnum)){
				msg = "인증번호가 틀렸습니다.";
				checkOk = false;
			}else if(!pass.equals(repass)){
				msg = "비밀번호와 재입력 비밀번호가 다릅니다.";
				checkOk = false;
			}else{
				checkOk=true;
			}

			if(checkOk){
				dao.sign_up(thisMail, request.getParameter("password"), request.getParameter("name"));
				//model.addAttribute(request.getParameter("email"));
				session.setAttribute("userId", request.getParameter("name"));
				msg ="가입되었습니다.";
			}

		}catch(Exception e){
			e.printStackTrace();
			msg="문제가 발생했습니다.\n다시 시도해주세요";
		}


		model.addAttribute("result", msg);

		return "Send";
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
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameter("password"));
		
		String page = "redirect:index";
		String msg="";

		MemberDto dto;
		IDao dao = sqlSession.getMapper(IDao.class);

		try{
			dto=dao.sign_in(request.getParameter("email"), request.getParameter("password"));
			System.out.println(request.getParameter("email"));
			System.out.println("dto.getEmail : "+ dto.getEmail());

			if(dto.getEmail().equals(request.getParameter("email"))){
				session.setAttribute("userId", dto.getName());
			}else{
				msg = "비밀번호나 이메일이 틀렸습니다.";
				page="Send";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("result",msg);
		


		
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
		
		return page;
	}
	
	//회원 가입시 인증 메일 보내기
    @RequestMapping(value="/sendmail", method=RequestMethod.POST)
    public String sendEmailAction (HttpServletRequest request, Model model) throws Exception {
   
    	System.out.println("sendmail() start");
    	
    	
    	boolean checkOk = false;
		String msg ="";

    	Random r = new Random();
    	int rn = (r.nextInt(1000000)+100000);
    	if(rn>1000000) rn-=100001;
    	rnum = rn +"";
    	
    	
        e_mail=request.getParameter("email");
        
    	MemberDto dto;
		IDao dao = sqlSession.getMapper(IDao.class);
		try{
			dto = dao.check_id(e_mail);
			if(dto.getEmail().equals(e_mail)){
				msg = "이미 가입된 이메일입니다.";
				checkOk = false;
			}
			
			
		}catch(NullPointerException e){
			checkOk = true;
		}
        
        System.out.println("email = "+e_mail);
        System.out.println("rnum = "+rnum);
        
        try{
        	if(checkOk){
        		email.setContent("인증 번호는 "+rnum+" 입니다.");
                email.setReceiver(e_mail);
                email.setSubject("인증 메일입니다.");
                emailSender.SendEmail(email);
                
                msg =e_mail+"로 메일 전송 성공";

        	}
            
        }catch(Exception e){
        	msg="실패 이유 : " + e.getMessage();
		       
        }
            model.addAttribute("result", msg);
        return "Send";
    }
    
    //비밀번호 찾기 메일 보내기
	@RequestMapping(value="/sendpw", method=RequestMethod.POST)
    public String sendPW (HttpServletRequest request, Model model) throws Exception {
		System.out.println("sendpw() start");
		
		
		String msg ="";
		String page="redirect:index";
		
		MemberDto dto;
		String mail=request.getParameter("email");
		IDao dao = sqlSession.getMapper(IDao.class);
		
		try{
			dto=dao.find_pw(mail);
			
	        String password=dto.getPassword();
	        System.out.println("email = "+ mail +"password = "+password);
	        
	        if(password!=null) {
	        	email.setContent("비밀번호는 "+password+" 입니다.");
	            email.setReceiver(mail);
	            email.setSubject("비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	           // emailSender.SendMail(email);
	        }else{
	        	page = "Send";
	        }
	        
		}catch(NullPointerException e){
			
			msg = "가입되지 않은 이메일입니다.";
			page = "Send";
			
		}
		
		
        model.addAttribute("result", msg);

        return page;
    }
	

		
	@RequestMapping(value="/check_id")
	public @ResponseBody Map<String , Object> checkID (HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("check_id() start");
		Map<String, Object> jsonObject = new HashMap<String, Object>();
		MemberDto dto;
		String e_mail=request.getParameter("email");
		IDao dao = sqlSession.getMapper(IDao.class);

		dto=dao.check_id(e_mail);

		String id = dto.getEmail();
		System.out.println("email = "+id);

		if(id != null) {
			jsonObject.put("result", "true");
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jsonObject);
			
		}else{
			jsonObject.put("result", "false");
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jsonObject);	
		}
	         
	    return jsonObject; 
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
