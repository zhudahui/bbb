package com.chinasofti.controller;

import com.chinasofti.entity.Student;
import com.chinasofti.mapping.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class JumpController {

	@Autowired
	private StudentDao studentDao;

	// 直接跳转到对应的页面
	// 默认项目首页
	@RequestMapping("index") // 跳转到index.jsp
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	// 登录页面
	@RequestMapping("login")
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	@RequestMapping("login_student")
	public ModelAndView login_student() {
		return new ModelAndView("student/login_student");
	}
	@RequestMapping("login_admin")
	public ModelAndView login_admin() {
		return new ModelAndView("admin/login_admin");
	}
	@RequestMapping("login_schoolmanage")
	public ModelAndView login_schoolmanage() {
		return new ModelAndView("schoolmanage/login_schoolmanage");
	}
	@RequestMapping("login_bankmanage")
	public ModelAndView login_bankmanage() {
		return new ModelAndView("bankmanage/login_bankmanage");
	}

	// 页脚
	@RequestMapping("footer")
	public ModelAndView footer() {
		return new ModelAndView("footer");
	}

	// 联系我们
	@RequestMapping("contact")
	public ModelAndView contact() {
		return new ModelAndView("contact");
	}

	//*********学生端*********
	@RequestMapping("home_student")//学生端首页
	public ModelAndView home_student() {
		return new ModelAndView("student/home_student");
	}
	//联系客服
	@RequestMapping("contact_admin_student")//联系系统客服
	public ModelAndView contact_admin_student() {
		return new ModelAndView("student/contact_admin_student");
	}
	@RequestMapping("contact_bank_student")//联系银行客服
	public ModelAndView contact_bank_student() {
		return new ModelAndView("student/contact_bank_student");
	}
	@RequestMapping("contact_school_student")//联系学校老师
	public ModelAndView contact_school_student() {
		return new ModelAndView("student/contact_school_student");
	}
	//贷款
	@RequestMapping("loan_request_student")//申请贷款
	public ModelAndView loan_request_student(HttpSession session) {
		String s_id = (String)session.getAttribute("s_id");
		Student student = studentDao.selectByPrimaryKey(s_id);
		ModelAndView modelAndView = new ModelAndView("student/loan_request_student");
		modelAndView.addObject("student", student);
		return modelAndView;
	}
	@RequestMapping("loan_search_student")//查询贷款申请
	public ModelAndView loan_search_student() {
		return new ModelAndView("student/loan_search_student");
	}
	@RequestMapping("loan_search_cancel_student")//取消申请
	public ModelAndView loan_search_cancel_student() {
		return new ModelAndView("student/loan_search_cancel_student");
	}
	@RequestMapping("loan_search_check_student")//查看进度
	public ModelAndView loan_search_check_student() {
		return new ModelAndView("student/loan_search_check_student");
	}
	@RequestMapping("loan_search_modify_student")//修改申请
	public ModelAndView loan_search_modify_student() {
		return new ModelAndView("student/loan_search_modify_student");
	}
	//公告
	@RequestMapping("notice_bank_student")//银行公告
	public ModelAndView notice_bank_student() {
		return new ModelAndView("student/notice_bank_student");
	}
	@RequestMapping("notice_bank_check_student")//查看银行公告详情
	public ModelAndView notice_bank_check_student() {
		return new ModelAndView("student/notice_bank_check_student");
	}
	@RequestMapping("notice_school_student")//学校公告
	public ModelAndView notice_school_student() {
		return new ModelAndView("student/notice_school_student");
	}
	@RequestMapping("notice_school_check_student")//查看学校公告详情
	public ModelAndView notice_school_check_student() {
		return new ModelAndView("student/notice_school_check_student");
	}
	//个人资料
	@RequestMapping("personal_basic_student")//个人基本资料
	public ModelAndView personal_basic_student() {
		return new ModelAndView("student/personal_basic_student");
	}
	@RequestMapping("personal_score_student")//成绩查询
	public ModelAndView personal_score_student() {
		return new ModelAndView("student/personal_score_student");
	}
	
	//*********学校管理员 学校端*********
	@RequestMapping("home_schoolmanage")//学校管理员首页
	public ModelAndView home_schoolmanage() {
		return new ModelAndView("schoolmanage/home_school");
	}
	//联系客服
	@RequestMapping("contact_admin_schoolmanage")//联系系统客服
	public ModelAndView contact_admin_schoolmanage() {
		return new ModelAndView("schoolmanage/contact_admin_schoolmanage");
	}
	@RequestMapping("contact_bank_schoolmanage")//联系系统客服
	public ModelAndView contact_bank_schoolmanage() {
		return new ModelAndView("schoolmanage/contact_bank_schoolmanage");
	}
	//贷款
	@RequestMapping("loan_complete_schoolmanage")//已审批的贷款
	public ModelAndView loan_complete_schoolmanage() {
		return new ModelAndView("schoolmanage/loan_complete_schoolmanage");
	}
	@RequestMapping("loan_complete_check_schoolmanage")//已审批的贷款详情
	public ModelAndView loan_complete_check_schoolmanage() {
		return new ModelAndView("schoolmanage/loan_complete_check_schoolmanage");
	}
	@RequestMapping("loan_notcomplete_schoolmanage")//未审批的贷款
	public ModelAndView loan_notcomplete_schoolmanage() {
		return new ModelAndView("schoolmanage/loan_notcomplete_schoolmanage");
	}
	@RequestMapping("loan_notcomplete_check_schoolmanage")//未审批的贷款详情
	public ModelAndView loan_notcomplete_check_schoolmanage() {
		return new ModelAndView("schoolmanage/loan_notcomplete_check_schoolmanage");
	}
	//公告
	@RequestMapping("notice_add_schoolmanage")//发布公告
	public ModelAndView notice_add_schoolmanage() {
		return new ModelAndView("schoolmanage/notice_add_schoolmanage");
	}
	@RequestMapping("notice_bank_schoolmanage")//银行公告
	public ModelAndView notice_bank_schoolmanage() {
		return new ModelAndView("schoolmanage/notice_bank_schoolmanage");
	}
	@RequestMapping("notice_bank_check_schoolmanage")//银行公告详情页
	public ModelAndView notice_bank_check_schoolmanage() {
		return new ModelAndView("schoolmanage/notice_bank_check_schoolmanage");
	}
	@RequestMapping("notice_school_schoolmanage")//学校公告
	public ModelAndView notice_school_schoolmanage() {
		return new ModelAndView("schoolmanage/notice_school_schoolmanage");
	}
	@RequestMapping("notice_school_check_schoolmanage")//学校公告详情页
	public ModelAndView notice_school_check_schoolmanage() {
		return new ModelAndView("schoolmanage/notice_school_check_schoolmanage");
	}
	//个人资料
	@RequestMapping("personal_basic_schoolmanage")//学校管理员个人资料
	public ModelAndView personal_basic_schoolmanage() {
		return new ModelAndView("schoolmanage/personal_basic_schoolmanage");
	}
	@RequestMapping("personal_score_schoolmanage")//查看学生成绩
	public ModelAndView personal_score_schoolmanage() {
		return new ModelAndView("schoolmanage/personal_score_schoolmanage");
	}
	@RequestMapping("personal_studentbasic_schoolmanage")//查看学生信息
	public ModelAndView personal_studentbasic_schoolmanage() {
		return new ModelAndView("schoolmanage/personal_studentbasic_schoolmanage");
	}
	@RequestMapping("personal_studentbasic_check_schoolmanage")//查看学生详细信息
	public ModelAndView personal_studentbasic_check_schoolmanage() {
		return new ModelAndView("schoolmanage/personal_studentbasic_check_schoolmanage");
	}
	
	//*********银行管理员*********
	@RequestMapping("home_bankmanage")//银行管理员首页
	public ModelAndView home_bankmanage() {
		return new ModelAndView("bankmanage/home_bankmanage");
	}
	//联系客服
	@RequestMapping("contact_admin_bankmanage")//联系系统客服
	public ModelAndView contact_admin_bankmanage() {
		return new ModelAndView("bankmanage/contact_admin_bankmanage");
	}
	@RequestMapping("contact_school_bankmanage")//联系学校客服
	public ModelAndView contact_school_bankmanage() {
		return new ModelAndView("bankmanage/contact_school_bankmanage");
	}
	//贷款
	@RequestMapping("loan_complete_bankmanage")//已审批过的贷款申请页
	public ModelAndView loan_complete_bankmanage() {
		return new ModelAndView("bankmanage/loan_complete_bankmanage");
	}
	@RequestMapping("loan_complete_check_bankmanage")//已审批过的贷款请求的详情页
	public ModelAndView loan_complete_check_bankmanage() {
		return new ModelAndView("bankmanage/loan_complete_check_bankmanage");
	}
	@RequestMapping("loan_notcomplete_bankmanage")//未审批过的贷款申请页
	public ModelAndView loan_notcomplete_bankmanage() {
		return new ModelAndView("bankmanage/loan_notcomplete_bankmanage");
	}
	@RequestMapping("loan_notcomplete_check_bankmanage")//未审批过的贷款请求的详情页
	public ModelAndView loan_notcomplete_check_bankmanage() {
		return new ModelAndView("bankmanage/loan_notcomplete_check_bankmanage");
	}
	//公告
	@RequestMapping("notice_add_bankmanage")//发布公告
	public ModelAndView notice_add_bankmanage() {
		return new ModelAndView("bankmanage/notice_add_bankmanage");
	}
	@RequestMapping("notice_search_bankmanage")//查询银行公告
	public ModelAndView notice_search_bankmanage() {
		return new ModelAndView("bankmanage/notice_search_bankmanage");
	}
	@RequestMapping("notice_search_check_bankmanage")//银行公告详情页
	public ModelAndView notice_search_check_bankmanage() {
		return new ModelAndView("bankmanage/notice_search_check_bankmanage");
	}
	//个人资料
	@RequestMapping("personal_basic_bankmanage")//管理员的个人资料
	public ModelAndView personal_basic_bankmanage() {
		return new ModelAndView("bankmanage/personal_basic_bankmanage");
	}
	@RequestMapping("personal_schoolbasic_bankmanage")//学校信息
	public ModelAndView personal_schoolbasic_bankmanage() {
		return new ModelAndView("bankmanage/personal_schoolbasic_bankmanage");
	}
	@RequestMapping("personal_studentbasic_bankmanage")//学生信息
	public ModelAndView personal_studentbasic_bankmanage() {
		return new ModelAndView("bankmanage/personal_studentbasic_bankmanage");
	}
	
	//*********管理员端*********
	@RequestMapping("home_admin")//管理员首页
	public ModelAndView home_admin() {
		return new ModelAndView("admin/home_admin");
	}
	//公告
	@RequestMapping("notice_add_admin")//添加公告
	public ModelAndView notice_add_admin() {
		return new ModelAndView("admin/notice_add_admin");
	}
	@RequestMapping("notice_search_admin")//查询公告
	public ModelAndView notice_search_admin() {
		return new ModelAndView("admin/notice_search_admin");
	}
	@RequestMapping("notice_search_check_admin")//查看公告具体内容
	public ModelAndView notice_search_check_admin() {
		return new ModelAndView("admin/notice_search_check_admin");
	}
	@RequestMapping("notice_search_modify_admin")//修改公告
	public ModelAndView notice_search_modify_admin() {
		return new ModelAndView("admin/notice_search_modify_admin");
	}
	//贷款
	@RequestMapping("request_add_admin")//添加贷款申请
	public ModelAndView request_add_admin() {
		return new ModelAndView("admin/request_add_admin");
	}
	@RequestMapping("request_search_admin")//查询申请
	public ModelAndView request_search_admin() {
		return new ModelAndView("admin/request_search_admin");
	}
	@RequestMapping("request_search_check_admin")//查看申请具体内容
	public ModelAndView request_search_check_admin() {
		return new ModelAndView("admin/request_search_check_admin");
	}
	@RequestMapping("request_search_modify_admin")//修改申请
	public ModelAndView request_search_modify_admin() {
		return new ModelAndView("admin/request_search_modify_admin");
	}
	//用户
	@RequestMapping("user_student_admin")//学生用户
	public ModelAndView user_student_admin() {
		return new ModelAndView("admin/user_student_admin");
	}
	@RequestMapping("user_student_add_admin")//添加学生用户
	public ModelAndView user_student_add_admin() {
		return new ModelAndView("admin/user_student_add_admin");
	}
	@RequestMapping("user_student_check_admin")//查看学生用户详细信息
	public ModelAndView user_student_check_admin() {
		return new ModelAndView("admin/user_student_check_admin");
	}
	@RequestMapping("user_schoolmanage_admin")//学校用户
	public ModelAndView user_schoolmanage_admin() {
		return new ModelAndView("admin/user_schoolmanage_admin");
	}
	@RequestMapping("user_schoolmanage_add_admin")//添加学校用户
	public ModelAndView user_schoolmanage_add_admin() {
		return new ModelAndView("admin/user_schoolmanage_add_admin");
	}
	@RequestMapping("user_schoolmanage_check_admin")//查看学校用户详细信息
	public ModelAndView user_schoolmanage_check_admin() {
		return new ModelAndView("admin/user_schoolmanage_check_admin");
	}
	@RequestMapping("user_bankmanage_admin")//银行用户
	public ModelAndView user_bankmanage_admin() {
		return new ModelAndView("admin/user_bankmanage_admin");
	}
	@RequestMapping("user_bankmanage_add_admin")//添加银行用户
	public ModelAndView user_bankmanage_add_admin() {
		return new ModelAndView("admin/user_bankmanage_add_admin");
	}
	@RequestMapping("user_bankmanage_check_admin")//查看银行用户详细信息
	public ModelAndView user_bankmanage_check_admin() {
		return new ModelAndView("admin/user_bankmanage_check_admin");
	}
	/*@RequestMapping("user_add_admin")//添加用户
	public ModelAndView user_add_admin() {
		return new ModelAndView("admin/user_add_admin");
	}
	@RequestMapping("user_search_admin")//查询用户
	public ModelAndView user_search_admin() {
		return new ModelAndView("admin/user_search_admin");
	}
	@RequestMapping("user_search_check_admin")//查看用户详细信息
	public ModelAndView user_search_check_admin() {
		return new ModelAndView("admin/user_search_check_admin");
	}
	@RequestMapping("user_search_modify_admin")//修改用户信息
	public ModelAndView user_search_modify_admin() {
		return new ModelAndView("admin/user_search_modify_admin");
	}*/

}
