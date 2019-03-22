package com.chinasofti.mapping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.chinasofti.vo.SchoolManage;

@Repository
public interface SchoolManageMapper {
	// 根据用户名和密码查找用户
	public int getSchoolManage(@Param("sm_id") String sm_id, @Param("sm_pwd") String sm_pwd);
	
	//显示所有学校用户
	public ArrayList<SchoolManage> showAllSchoolManage();
	
	//管理员删除用户
	public int delete_admin(@Param("sm_id") String sm_id);
	
	//管理员添加用户
	public void add_admin(@Param("sm")SchoolManage sm);
	
	//根据id获取name
	public String getName(@Param("sm_id") String sm_id);
	
	//根据sm_id查找schoolmanage
	public SchoolManage showschoolManageById(@Param("sm_id") String sm_id);
	
	//根据关键字keyword查询学校用户
	public ArrayList<SchoolManage> findSchoolManageByKeyWord(@Param("keyword") String keyword);
	
}
