package com.chinasofti.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.mapping.CreditRequestMapper;
import com.chinasofti.vo.CreditRequest;
import com.chinasofti.vo.Family;
import com.chinasofti.vo.Student;

@Service
public class CreditRequestService {
	@Autowired
	private CreditRequestMapper requestMapper;

	// 显示所有贷款申请单
	public ArrayList showAllRequest() {
		ArrayList<CreditRequest> request = requestMapper.showAllRequest();
		return request;
	}

	// 根据关键字keyword查询申请
	public ArrayList<CreditRequest> findRequestByKeyWord(String keyword) {
		return requestMapper.findRequestByKeyWord(keyword);
	}

	// 删除申请-管理员
	public void delete_admin(int r_id) {
		requestMapper.delete_admin(r_id);
	}

	// 根据关键字keyword查询申请-学生
	public ArrayList<CreditRequest> findRequestByKeyWord_student(String keyword, String s_id) {
		return requestMapper.findRequestByKeyWord_student(keyword, s_id);
	}

	// 学生查询个人所有申请(根据s_id查找creditrequest表)
	public ArrayList<CreditRequest> findRequestByS_id(String s_id) {
		return requestMapper.findRequestByS_id(s_id);
	}

	// 学生查询个人信息
	public Student findStudentByS_id(String s_id) {
		return requestMapper.findStudentByS_id(s_id);
	}

	// 学生查询申请详情(根据r_id查找creditrequest表)
	public CreditRequest findRequestByR_id(int r_id) {
		return requestMapper.findRequestByR_id(r_id);
	}

	// 学生查询家庭信息
	public ArrayList<Family> findFamilyByS_id(String s_id) {
		return requestMapper.findFamilyByS_id(s_id);
	}

	// 学生取消申请
	public void delete_student(int r_id) {
		requestMapper.delete_student(r_id);
	}

	// 显示所有未经学校审批的申请
	public ArrayList<CreditRequest> showAllNotCompleteRequest(String s_school) {
		return requestMapper.showAllNotCompleteRequest(s_school);
	}

	// 显示所有已经学校审批的申请
	public ArrayList<CreditRequest> showAllCompleteRequest(String s_school) {
		return requestMapper.showAllCompleteRequest(s_school);
	}

	// 根据关键字keyword查询未审批的申请-学校
	public ArrayList<CreditRequest> findNotCompleteRequestByKeyWord_schoolmanage(String keyword, String school) {
		return requestMapper.findNotCompleteRequestByKeyWord_schoolmanage(keyword, school);
	}

	// 根据关键字keyword查询已审批的申请-学校
	public ArrayList<CreditRequest> findCompleteRequestByKeyWord_schoolmanage(String keyword, String school) {
		return requestMapper.findCompleteRequestByKeyWord_schoolmanage(keyword, school);
	}

	// 通过申请-学校
	public void pass_schoolmanage(int r_id, String schoolidea) {
		requestMapper.pass_schoolmanage(r_id, schoolidea);
	}

	// 否决申请-学校
	public void fail_schoolmanage(int r_id, String schoolidea) {
		requestMapper.fail_schoolmanage(r_id, schoolidea);
	}

	// 显示所有未经银行审批的申请
	public ArrayList<CreditRequest> showAllNotCompleteRequest_bankmanage(String bm_bank) {
		return requestMapper.showAllNotCompleteRequest_bankmanage(bm_bank);
	}

	// 显示所有已经银行审批的申请
	public ArrayList<CreditRequest> showAllCompleteRequest_bankmanage(String bm_bank) {
		return requestMapper.showAllCompleteRequest_bankmanage(bm_bank);
	}

	// 根据关键字keyword查询未审批的申请-银行
	public ArrayList<CreditRequest> findNotCompleteRequestByKeyWord_bankmanage(String keyword, String bm_bank) {
		return requestMapper.findNotCompleteRequestByKeyWord_bankmanage(keyword, bm_bank);
	}

	// 根据关键字keyword查询已审批的申请-银行
	public ArrayList<CreditRequest> findCompleteRequestByKeyWord_bankmanage(String keyword, String bm_bank) {
		return requestMapper.findCompleteRequestByKeyWord_bankmanage(keyword, bm_bank);
	}

	// 通过申请-银行
	public void pass_bankmanage(int r_id, String bankidea) {
		requestMapper.pass_bankmanage(r_id, bankidea);
	}

	// 否决申请-银行
	public void fail_bankmanage(int r_id, String bankidea) {
		requestMapper.fail_bankmanage(r_id, bankidea);
	}
}
