package com.chinasofti.controller;

import java.io.IOException;

import java.sql.Date;

import java.util.List;


import javax.servlet.http.HttpSession;

import com.chinasofti.constant.EnumAuditRuleType;
import com.chinasofti.entity.Family;
import com.chinasofti.entity.School;
import com.chinasofti.entity.Student;
import com.chinasofti.mapping.SchoolDao;
import com.chinasofti.mapping.StudentDao;

import com.chinasofti.service.AuditService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.entity.Creditrequest;
import com.chinasofti.mapping.CreditRequestMapper;
import com.chinasofti.mapping.CreditrequestDao;
import com.chinasofti.mapping.FamilyDao;
import com.chinasofti.service.AdminService;
import com.chinasofti.vo.CreditRequestParam;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CreditrequestDao creditrequestDao;
	
	@Autowired
	private StudentDao studentDao;
	

	@Autowired
	private FamilyDao familyDao;

	@Autowired
	private SchoolDao schoolDao;

	@Autowired
	private AuditService auditService;

	// 登录
	@RequestMapping("login")
	public ModelAndView login(String a_id, String a_pwd, HttpSession session) throws IOException {
		int flag = adminService.login(a_id, a_pwd);// 0不可登录，1可登录，2用户名或密码错误
		System.out.println(a_id + "," + a_pwd + "," + flag);
		if (flag == 0) {
			ModelAndView modelAndView = new ModelAndView("login");// 返回登录页面
			modelAndView.addObject("message", "登录失败！请重新登录");
			return modelAndView;
		} else if (flag == 1) {
			ModelAndView modelAndView = new ModelAndView("admin/home_admin");
			session.setAttribute("a_id", a_id);//向页面传值
			System.out.println("AdminController.java 登录--" + session.getAttribute("a_id"));
			return modelAndView;
		}
		/*
		 * else if(flag==2) { // 次数>5禁止登录 // count 存储位置：--cookie,session //
		 * 没有进行存储，直接获取count Integer count=(Integer) session.getAttribute("count");
		 * //第一次访问count=null if(count==null) { session.setAttribute("count", 1); }else {
		 * count++; session.setAttribute("count", count); } }
		 */
		return null;
	}

	//手动添加申请信息
	@RequestMapping("addRequestInfos")
	public ModelAndView addRequestInfos(CreditRequestParam param){
		System.out.println("管理员开始添加申请信息");
		ModelAndView modelAndView = new ModelAndView("admin/request_add_admin");
		Creditrequest c = param.getC();
		c.setBId("102100020331");
		c.setSId(param.getS().getSId());
		java.util.Date now = new java.util.Date();
		c.setRequestdate(now);
		c.setFlag(1);
		creditrequestDao.insertUseGeneratedKeys(c);
		System.out.println("学号："+param.getS().getSId());
		studentDao.insert(param.getS());

		Family f = new Family();
		f.setSId(param.getS().getSId());
		familyDao.delete(f);
		if(param.getF1().getFNickname() != null && param.getF1().getFNickname() != ""){
			param.getF1().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF1());
		}
		if(param.getF2().getFNickname() != null && param.getF2().getFNickname() != ""){
			param.getF2().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF2());
		}
		if(param.getF3().getFNickname() != null && param.getF3().getFNickname() != ""){
			param.getF3().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF3());
		}
		if(param.getF4().getFNickname() != null && param.getF4().getFNickname() != ""){
			param.getF4().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF4());
		}
		if(param.getF5().getFNickname() != null && param.getF5().getFNickname() != ""){
			param.getF5().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF5());
		}
		auditService.autoAudit(EnumAuditRuleType.school, c, param.getS(), null, null, null);
		return modelAndView;
	}
	
	//管理员修改申请信息
	@RequestMapping("updateCreditRequest")
	public ModelAndView  updateCreditRequest(Creditrequest creditrequest){
		System.out.println("更新修改申请的 信息");
		ModelAndView modelAndView = new ModelAndView("redirect:/creditrequest/showAllRequest");
		//查询请求时间
		Creditrequest oldCreditrequest = creditrequestDao.selectByPrimaryKey(creditrequest.getRId());
		creditrequest.setBId(oldCreditrequest.getBId());
		creditrequest.setRequestdate(oldCreditrequest.getRequestdate());;
		System.out.println(creditrequest);
		creditrequestDao.updateByPrimaryKey(creditrequest);
		return modelAndView;
	}
	@RequestMapping("user_student_add_admin")
	public ModelAndView user_student_add_admin() throws IOException {
		List<School> schools = schoolDao.selectAll();
		ModelAndView m = new ModelAndView("admin/user_student_add_admin");
		m.addObject("all", schools);
		return m;
	}



}






