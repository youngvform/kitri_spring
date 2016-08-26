package com.kitri.project01.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.kitri.project01.dao.IDao;
import com.kitri.project01.dto.MemberDto;


public class SignInCommand {
	@Autowired
	private SqlSession sqlSession;
	
	public void execute(Model model) {
		// TODO Auto-generated method stub

		MemberDto dto = new MemberDto();
		Map<String, Object> map = model.asMap();
		HttpServletRequest request =  (HttpServletRequest)map.get("request");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		IDao dao = sqlSession.getMapper(IDao.class);
		dto = dao.sign_in(email, password);
		if(dto.getEmail().equals(email)){
			model.addAttribute("content_view", dto);
		}else{
			
		}
	}
}
