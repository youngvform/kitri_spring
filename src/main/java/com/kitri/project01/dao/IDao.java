package com.kitri.project01.dao;

import java.util.ArrayList;

import com.kitri.project01.dto.ContentDto;
import com.kitri.project01.dto.MemberDto;

public interface IDao {
	
	public void sign_up(String email, String password, String userid);
	public MemberDto sign_in(String email, String password);
	public MemberDto find_pw(String email);
	public MemberDto check_id(String email);
	public void deleteID(String email);
}
