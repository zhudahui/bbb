package com.chinasofti.mapping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.chinasofti.vo.Student;

@Repository
public interface StudentMapper {
	// 根据用户名和密码查找用户
	public int getStudent(@Param("s_id") String s_id, @Param("s_pwd") String s_pwd);

	//显示所有学生用户
	public ArrayList<Student> showAllStudent();
	
	//根据关键字keyword查询学生用户
	public ArrayList<Student> findStudentByKeyWord(@Param("keyword") String keyword);
	
	//管理员删除用户
	public int delete_admin(@Param("s_id") String s_id);

	//根据id获取name
	public String getName(@Param("s_id") String s_id);
	
	//根据s_id查找学生基本资料
	public Student showStudentById(@Param("s_id") String s_id);
	
	//显示本校的所有学生用户
	public ArrayList<Student> showAllStudent_schoolmanage(@Param("sm_id") String sm_id);
	
	//显示在本银行申请过贷款的所有学生用户
	public ArrayList<Student> showAllStudent_bankmanage(@Param("bm_bank") String bm_bank);
	
	//根据关键字keyword查询在本银行申请过贷款的所有学生用户-银行
	public ArrayList<Student> findStudentByKeyWord_bankmanage(@Param("keyword") String keyword,@Param("bm_bank") String bm_bank);

	@Update("update student set s_address = #{s_address}, s_phone = #{s_phone}, s_qq = #{s_qq}, s_email = #{s_email} where s_id = #{s_id}")
    void updateById(@Param("s_id") String s_id, @Param("s_address")String s_address, @Param("s_phone")String s_phone, @Param("s_qq")String s_qq, @Param("s_email")String s_email);

    // 根据用户名，来更新用户的登录时间（用户都不重名）
//	public int updateRegistTime(@Param("userName") String userName, @Param("userRegistDate") Timestamp userRegistDate);
}
