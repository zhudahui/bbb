package com.chinasofti.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.mapping.SchoolManageMapper;
import com.chinasofti.vo.SchoolManage;

@Service("schoolManageService")
public class SchoolManageService {
	@Autowired
	private SchoolManageMapper mapper;

	// 登录
	public int login(String sm_id, String sm_pwd) {
		int flag;
		if (mapper.getSchoolManage(sm_id, sm_pwd) == 1) {
			flag = 1;
		} else {
			flag = 0;
		}
		System.out.println(flag);
		return flag;
	}

	// 根据id显示name
	public String getName(String sm_id) {
		String sm_name;
		sm_name = mapper.getName(sm_id);
		return sm_name;
	}

	// 显示所有学校用户
	public ArrayList showAllSchoolManage() {
		ArrayList<SchoolManage> schoolmanage = mapper.showAllSchoolManage();
		return schoolmanage;
	}

	// 管理员删除用户
	public void delete_admin(String sm_id) {
		mapper.delete_admin(sm_id);
	}

	// 管理员添加用户
	public void add_admin(SchoolManage sm) {
		mapper.add_admin(sm);
	}

	// 根据sm_id查找学校用户基本资料
	public SchoolManage showschoolManageById(String sm_id) {
		SchoolManage schoolManage = mapper.showschoolManageById(sm_id);
		return schoolManage;
	}

	// 根据关键字keyword查询学校用户
	public ArrayList<SchoolManage> findSchoolManageByKeyWord(String keyword) {
		return mapper.findSchoolManageByKeyWord(keyword);
	}

}
