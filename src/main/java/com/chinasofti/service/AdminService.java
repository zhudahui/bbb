package com.chinasofti.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.mapping.AdminMapper;
import com.chinasofti.vo.Admin;
import com.chinasofti.vo.CreditRequest;

@Service("adminsService")
public class AdminService {
	@Autowired
	private AdminMapper mapper;

	//登录
	public int login(String a_id,String a_pwd) {
		int flag;
		if(mapper.getAdmin(a_id, a_pwd)==1) {
			flag = 1;
		}else {
			flag = 0;
		}
		System.out.println(flag);
		return flag;
	}
}
