package com.chinasofti.controller;

import com.chinasofti.entity.Bankmanage;
import com.chinasofti.mapping.BankmanageDao;
import com.chinasofti.service.BankManageService;
import com.chinasofti.vo.BankManage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.chinasofti.entity.Notice;
import com.chinasofti.mapping.NoticeDao;
import com.chinasofti.service.BankManageService;
import com.chinasofti.vo.BankManage;

import com.chinasofti.service.BankManageService;
import com.chinasofti.vo.BankManage;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("bankmanage")
public class BankManageController {
	@Autowired
	private BankManageService bankManageService;
	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private BankmanageDao bankmanageDao;

	// 登录
	@RequestMapping("login")
	public ModelAndView login(String bm_id, String bm_pwd, HttpSession session) throws IOException {
		int flag = bankManageService.login(bm_id, bm_pwd);// 0不可登录，1可登录，2用户名或密码错误
		System.out.println(bm_id + "," + bm_pwd + "," + flag);
		if (flag == 0) {
			ModelAndView modelAndView = new ModelAndView("login");// 返回登录页面
			modelAndView.addObject("message", "登录失败！请重新登录");
			return modelAndView;
		} else if (flag == 1) {
			ModelAndView modelAndView = new ModelAndView("bankmanage/home_bankmanage");
			String bm_name = bankManageService.getName(bm_id);
			session.setAttribute("bm_name", bm_name);
			session.setAttribute("bm_id", bm_id);
			System.out.println("BankManageController.java 登录--" + session.getAttribute("bm_id"));
			return modelAndView;
		}
		return null;
	}

	// 管理员端
	// 显示所有银行用户
	@RequestMapping("showAllBankManage")
	public ModelAndView showList(HttpSession session) {
		ArrayList<BankManage> bankmanage = bankManageService.showAllBankManage();
		ModelAndView mav = new ModelAndView("admin/user_bankmanage_admin");
		mav.addObject("all", bankmanage);
		System.out.println("BankManageController.java 显示所有银行用户");
		return mav;
	}

	@RequestMapping("showAddBankManage")
	public ModelAndView showAddBankManage(HttpSession session) {
		List<Bankmanage> bankmanages = bankmanageDao.selectAll();
		ModelAndView mav = new ModelAndView("admin/user_bankmanage_add_admin");
		mav.addObject("all", bankmanages);
		System.out.println("BankManageController.java 显示");
		return mav;
	}

	// 显示用户详细资料
	@RequestMapping("showBankManageDetail_admin")
	public ModelAndView showBankManageDetail_admin(HttpSession session, String bm_id) {
		BankManage bankManage = bankManageService.showBankManageById(bm_id);
		ModelAndView mav = new ModelAndView("admin/user_bankmanage_check_admin");
		mav.addObject("bankManage", bankManage);
		System.out.println("BankManageController.java 显示" + bm_id + "的个人资料");
		return mav;
	}

	// 根据关键字keyword查询银行用户-管理员
	@RequestMapping("search_admin")
	@ResponseBody
	public ModelAndView search_admin(String keyword) {
		ArrayList<BankManage> bankmanage = bankManageService.findBankManageByKeyWord(keyword);
		ModelAndView modelAndView = new ModelAndView("admin/user_bankmanage_admin");
		modelAndView.addObject("all", bankmanage);
		System.out.println("BankManageController.java 根据关键字keyword:" + keyword + "  查询用户");
		return modelAndView;
	}
	
	// 管理员删除用户
	@RequestMapping("delete_admin")
	public ModelAndView delete_admin(HttpSession session, String bm_id) {
		bankManageService.delete_admin(bm_id);
		ArrayList<BankManage> bankmanage = bankManageService.showAllBankManage();
		ModelAndView mav = new ModelAndView("admin/user_bankmanage_admin");
		mav.addObject("all", bankmanage);
		System.out.println("BankManageController.java 显示所有银行用户");
		return mav;
	}

	// 银行端
	// 显示用户详细资料
	@RequestMapping("showBankManageDetail_bankmanage")
	public ModelAndView showBankManageDetail_bankmanage(HttpSession session, String bm_id) {
		BankManage bankManage = bankManageService.showBankManageById(bm_id);
		ModelAndView mav = new ModelAndView("bankmanage/personal_basic_bankmanage");
		mav.addObject("bankManage", bankManage);
		System.out.println("SchoolManageController.java 显示" + bm_id + "的个人资料");
		return mav;
	}

	//修改银行公告
	@RequestMapping("updateNotice")
	public ModelAndView updateNotice(Notice notice){
		ModelAndView mav = new ModelAndView("bankmanage/notice_search_bankmanage");
		System.out.println("notice="+notice);
		notice.setFlag(1);
		noticeDao.updateByPrimaryKey(notice);
		return mav;
	}
	


	@RequestMapping("modifyBankmanage")
	public ModelAndView modifyBankmanage(com.chinasofti.entity.Bankmanage bankManage) {
		bankmanageDao.updateByPrimaryKeySelective(bankManage);
		ModelAndView mav = new ModelAndView("redirect:/bankmanage/showAllBankManage");
		return mav;
	}

	@RequestMapping("addBankmanage")
	public ModelAndView addBankmanage(com.chinasofti.entity.Bankmanage bankManage) {
		bankmanageDao.insert(bankManage);
		ModelAndView mav = new ModelAndView("redirect:/bankmanage/showAllBankManage");
		return mav;
	}

}





