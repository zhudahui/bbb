package com.chinasofti.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.mapping.BankManageMapper;
import com.chinasofti.vo.BankManage;

@Service("bankManageService")
public class BankManageService {
	@Autowired
	private BankManageMapper mapper;

	// 登录
	public int login(String bm_id, String bm_pwd) {
		int flag;
		if (mapper.getBankManage(bm_id, bm_pwd) == 1) {
			flag = 1;
		} else {
			flag = 0;
		}
		System.out.println(flag);
		return flag;
	}

	// 显示所有银行用户
	public ArrayList showAllBankManage() {
		ArrayList<BankManage> bankManage = mapper.showAllBankManage();
		return bankManage;
	}

	// 根据id显示name
	public String getName(String bm_id) {
		String bm_name;
		bm_name = mapper.getName(bm_id);
		return bm_name;
	}

	// 根据bm_id查找银行用户基本资料
	public BankManage showBankManageById(String bm_id) {
		BankManage bankManage = mapper.showBankManageById(bm_id);
		return bankManage;
	}

	// 根据关键字keyword查询银行用户
	public ArrayList<BankManage> findBankManageByKeyWord(String keyword) {
		return mapper.findBankManageByKeyWord(keyword);
	}
	
	// 管理员删除用户
	public void delete_admin(String bm_id) {
		mapper.delete_admin(bm_id);
	}
}
