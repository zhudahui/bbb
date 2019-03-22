package com.chinasofti.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.service.SchoolService;
import com.chinasofti.vo.School;

@Controller
@RequestMapping("school")
public class SchoolController {
	@Autowired
	private SchoolService schoolService;

	// 管理员端
	// 显示所有学校
	@RequestMapping("showAllSchool")
	public ModelAndView getSchool(HttpSession session) {
		ArrayList<School> school = schoolService.showAllSchool();
		ModelAndView mav = new ModelAndView("admin/user_schoolmanage_add_admin");
		mav.addObject("all", school);
		System.out.println("SchoolController.java 获取所有学校");
		return mav;
	}
}
