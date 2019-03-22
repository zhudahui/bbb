package com.chinasofti.mapping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.chinasofti.vo.CreditRequest;
import com.chinasofti.vo.Student;
import com.chinasofti.vo.Family;

@Repository
public interface CreditRequestMapper {
	// 显示所有贷款申请单
	public ArrayList<CreditRequest> showAllRequest();

	// 根据关键字keyword查询申请
	public ArrayList<CreditRequest> findRequestByKeyWord(@Param("keyword") String keyword);
	
	// 删除申请-管理员
	public int delete_admin(@Param("r_id") int r_id);

	// 根据关键字keyword查询申请-学生
	public ArrayList<CreditRequest> findRequestByKeyWord_student(@Param("keyword") String keyword,
			@Param("s_id") String s_id);

	// 学生查询个人所有申请
	public ArrayList<CreditRequest> findRequestByS_id(@Param("s_id") String s_id);

	// 学生查询个人信息
	public Student findStudentByS_id(@Param("s_id") String s_id);

	// 学生查询申请详情(根据r_id查找creditrequest表)
	public CreditRequest findRequestByR_id(@Param("r_id") int r_id);

	// 学生查询家庭信息
	public ArrayList<Family> findFamilyByS_id(@Param("s_id") String s_id);
	
	// 学生取消申请
	public int delete_student(@Param("r_id") int r_id);

	// 显示所有未经学校审批的申请
	public ArrayList<CreditRequest> showAllNotCompleteRequest(@Param("s_school") String s_school);

	// 显示所有已经学校审批的申请
	public ArrayList<CreditRequest> showAllCompleteRequest(@Param("s_school") String s_school);

	// 根据关键字keyword查询未审批的申请-学校
	public ArrayList<CreditRequest> findNotCompleteRequestByKeyWord_schoolmanage(@Param("keyword") String keyword,
			@Param("school") String school);

	// 根据关键字keyword查询已审批的申请-学校
	public ArrayList<CreditRequest> findCompleteRequestByKeyWord_schoolmanage(@Param("keyword") String keyword,
			@Param("school") String school);

	// 通过申请-学校
	public int pass_schoolmanage(@Param("r_id") int r_id, @Param("schoolidea") String schoolidea);

	// 否决申请-学校
	public int fail_schoolmanage(@Param("r_id") int r_id, @Param("schoolidea") String schoolidea);

	// 显示所有未经银行审批的申请
	public ArrayList<CreditRequest> showAllNotCompleteRequest_bankmanage(@Param("bm_bank") String bm_bank);

	// 显示所有已经学校审批的申请
	public ArrayList<CreditRequest> showAllCompleteRequest_bankmanage(@Param("bm_bank") String bm_bank);

	// 根据关键字keyword查询未审批的申请-银行
	public ArrayList<CreditRequest> findNotCompleteRequestByKeyWord_bankmanage(@Param("keyword") String keyword,
			@Param("bm_bank") String bm_bank);

	// 根据关键字keyword查询已审批的申请-银行
	public ArrayList<CreditRequest> findCompleteRequestByKeyWord_bankmanage(@Param("keyword") String keyword,
			@Param("bm_bank") String bm_bank);

	// 通过申请-银行
	public int pass_bankmanage(@Param("r_id") int r_id, @Param("bankidea") String bankidea);

	// 否决申请-银行
	public int fail_bankmanage(@Param("r_id") int r_id, @Param("bankidea") String bankidea);
}
