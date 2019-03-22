package com.chinasofti.mapping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.chinasofti.vo.BankManage;

@Repository
public interface BankManageMapper {
	// 根据用户名和密码查找用户
	public int getBankManage(@Param("bm_id") String bm_id, @Param("bm_pwd") String bm_pwd);
	
	//显示所有银行用户
	public ArrayList<BankManage> showAllBankManage();
	
	//根据id获取name
	public String getName(@Param("bm_id") String bm_id);
	
	//根据bm_id查找用户基本资料
	public BankManage showBankManageById(@Param("bm_id") String bm_id);
	
	//根据关键字keyword查询学校用户
	public ArrayList<BankManage> findBankManageByKeyWord(@Param("keyword") String keyword);
	
	//管理员删除用户
	public int delete_admin(@Param("bm_id") String bm_id);
}
