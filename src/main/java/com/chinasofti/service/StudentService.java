package com.chinasofti.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.mapping.StudentMapper;
import com.chinasofti.vo.Notice;
import com.chinasofti.vo.Student;

@Service
public class StudentService {
	@Autowired
	private StudentMapper studentMapper;

	// 登录
	public int login(String s_id, String s_pwd) {
		int flag;
		if (studentMapper.getStudent(s_id, s_pwd) == 1) {
			flag = 1;
		} else {
			flag = 0;
		}
		System.out.println(flag);
		return flag;
	}

	// 根据id显示name
	public String getName(String s_id) {
		String s_name;
		s_name = studentMapper.getName(s_id);
		return s_name;
	}

	// 显示所有学生用户
	public ArrayList showAllStudent() {
		ArrayList<Student> student = studentMapper.showAllStudent();
		return student;
	}

	// 根据关键字keyword查询学生用户
	public ArrayList<Student> findStudentByKeyWord(String keyword) {
		return studentMapper.findStudentByKeyWord(keyword);
	}
	
	// 管理员删除用户
	public void delete_admin(String s_id) {
		studentMapper.delete_admin(s_id);
	}

	// 根据s_id查找学生基本资料
	public Student showStudentById(String s_id) {
		Student student = studentMapper.showStudentById(s_id);
		return student;
	}

	// 显示本校的所有学生用户
	public ArrayList showAllStudent_schoolmanage(String sm_id) {
		ArrayList student = studentMapper.showAllStudent_schoolmanage(sm_id);
		return student;
	}

	// 显示在本银行申请过贷款的所有学生用户
	public ArrayList showAllStudent_bankmanage(String bm_bank) {
		ArrayList<Student> student = studentMapper.showAllStudent_bankmanage(bm_bank);
		return student;
	}

	// 根据关键字keyword查询在本银行申请过贷款的所有学生用户-银行
	public ArrayList<Student> findStudentByKeyWord_bankmanage(String keyword,String bm_bank) {
		return studentMapper.findStudentByKeyWord_bankmanage(keyword,bm_bank);
	}

	public void modifyStudent(String s_id, String s_address, String s_phone, String s_qq, String s_email) {
		studentMapper.updateById(s_id, s_address, s_phone, s_qq, s_email);
	}
}
