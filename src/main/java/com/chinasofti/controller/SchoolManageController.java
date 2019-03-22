package com.chinasofti.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.chinasofti.entity.School;
import com.chinasofti.entity.Schoolmanage;
import com.chinasofti.mapping.SchoolDao;
import com.chinasofti.mapping.SchoolmanageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.service.SchoolManageService;
import com.chinasofti.vo.SchoolManage;

@Controller
@RequestMapping("schoolmanage")
public class SchoolManageController {
	@Autowired
	private SchoolManageService schoolManageService;

	@Autowired
	private SchoolmanageDao schoolmanageDao;

	@Autowired
	private SchoolDao schoolDao;

	// 登录
	@RequestMapping("login")
	public ModelAndView login(String sm_id, String sm_pwd, HttpSession session) throws IOException {
		int flag = schoolManageService.login(sm_id, sm_pwd);// 0不可登录，1可登录，2用户名或密码错误
		System.out.println(sm_id + "," + sm_pwd + "," + flag);
		if (flag == 0) {
			ModelAndView modelAndView = new ModelAndView("login");// 返回登录页面
			modelAndView.addObject("message", "登录失败！请重新登录");
			return modelAndView;
		} else if (flag == 1) {
			ModelAndView modelAndView = new ModelAndView("schoolmanage/home_schoolmanage");
			String sm_name = schoolManageService.getName(sm_id);
			session.setAttribute("sm_name", sm_name);
			session.setAttribute("sm_id", sm_id);
			System.out.println("SchoolManageController.java 登录--" + session.getAttribute("sm_id"));
			return modelAndView;
		}
		return null;
	}

	// 管理员端
	// 显示所有学校用户
	@RequestMapping("showAllSchoolManage")
	public ModelAndView showList(HttpSession session) {
		ArrayList<SchoolManage> schoolmanage = schoolManageService.showAllSchoolManage();
		ModelAndView mav = new ModelAndView("admin/user_schoolmanage_admin");
		mav.addObject("all", schoolmanage);
		System.out.println("SchoolManageController.java 显示所有学校用户");
		return mav;
	}

	// 显示用户详细资料
	@RequestMapping("showSchoolManageDetail_admin")
	public ModelAndView showSchoolManageDetail_admin(HttpSession session, String sm_id) {
		SchoolManage schoolManage = schoolManageService.showschoolManageById(sm_id);
		ModelAndView mav = new ModelAndView("admin/user_schoolmanage_check_admin");
		List<School> schools = schoolDao.selectAll();
		mav.addObject("schoolManage", schoolManage);
		mav.addObject("all", schools);
		System.out.println("SchoolManageController.java 显示" + sm_id + "的个人资料");
		return mav;
	}

	// 根据关键字keyword查询学校用户-管理员
	@RequestMapping("search_admin")
	@ResponseBody
	public ModelAndView search_admin(String keyword) {
		ArrayList<SchoolManage> schoolmanage = schoolManageService.findSchoolManageByKeyWord(keyword);
		ModelAndView modelAndView = new ModelAndView("admin/user_schoolmanage_admin");
		modelAndView.addObject("all", schoolmanage);
		System.out.println("SchoolManageController.java 根据关键字keyword:" + keyword + "  查询用户");
		return modelAndView;
	}
	
	// 管理员删除用户
	@RequestMapping("delete_admin")
	public ModelAndView delete_admin(HttpSession session, String sm_id) {
		schoolManageService.delete_admin(sm_id);
		ArrayList<SchoolManage> schoolmanage = schoolManageService.showAllSchoolManage();
		ModelAndView mav = new ModelAndView("admin/user_schoolmanage_admin");
		mav.addObject("all", schoolmanage);
		System.out.println("SchoolManageController.java 删除用户 sm_id:"+sm_id);
		return mav;
	}

	// 管理员添加用户
	@RequestMapping("add_admin")
	public ModelAndView add_admin(HttpSession session, SchoolManage sm) {
		//System.out.println(sm.getSm_id()+","+sm.getSm_name()+","+sm.getSm_pwd()+","+sm_id);
		schoolManageService.add_admin(sm);
		ArrayList<SchoolManage> schoolmanage = schoolManageService.showAllSchoolManage();
		ModelAndView mav = new ModelAndView("admin/user_schoolmanage_admin");
		mav.addObject("all", schoolmanage);
		System.out.println("SchoolManageController.java 添加用户成功");
		return mav;
	}
	
	// 学校端
	// 显示用户详细资料
	@RequestMapping("showSchoolManageDetail_schoolmanage")
	public ModelAndView showSchoolManageDetail_schoolmanage(HttpSession session, String sm_id) {
		SchoolManage schoolManage = schoolManageService.showschoolManageById(sm_id);
		ModelAndView mav = new ModelAndView("schoolmanage/personal_basic_schoolmanage");
		mav.addObject("schoolManage", schoolManage);
		System.out.println("SchoolManageController.java 显示" + sm_id + "的个人资料");
		return mav;
	}

	@RequestMapping("modifySchoolManage")
	public ModelAndView modifySchoolManage(Schoolmanage schoolmanage) {
		schoolmanageDao.updateByPrimaryKeySelective(schoolmanage);
		ModelAndView mav = new ModelAndView("redirect:/schoolmanage/showSchoolManageDetail_admin?sm_id=" + schoolmanage.getSmId());
		return mav;
	}
}
