package com.chinasofti.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.service.SchoolManageService;
import com.chinasofti.service.ScoreService;
import com.chinasofti.vo.Course;
import com.chinasofti.vo.SchoolManage;
import com.chinasofti.vo.Score;

@Controller
@RequestMapping("score")
public class ScoreController {
	@Autowired
	private ScoreService scoreService;
	@Autowired
	private SchoolManageService schoolManageService;
	
	// 学生端
	// 显示学生成绩
	@RequestMapping("showScore_student")
	public ModelAndView showScore_student(HttpSession session, String s_id) {
		ArrayList<Score> score = scoreService.showScoreById(s_id);
		ArrayList<Course> course = new ArrayList<Course>();
		if (score != null) {
			// 遍历
			for (int i = 0; i < score.size(); i++) {
				Score s = score.get(i);
				String c_id = s.getC_id();
				Course c = scoreService.getCourse(c_id);
				course.add(c);
			}
		}
		ModelAndView mav = new ModelAndView("student/personal_score_student");
		mav.addObject("score", score);
		mav.addObject("course", course);
		System.out.println("ScoreController.java 显示" + s_id + "的成绩");
		return mav;
	}

	@RequestMapping("showScore_school")
	public ModelAndView showScore_school(HttpSession session, String s_id) {
		ArrayList<Score> score = scoreService.showScoreById(s_id);
		ArrayList<Course> course = new ArrayList<Course>();
		if (score != null) {
			// 遍历
			for (int i = 0; i < score.size(); i++) {
				Score s = score.get(i);
				String c_id = s.getC_id();
				Course c = scoreService.getCourse(c_id);
				course.add(c);
			}
		}
		ModelAndView mav = new ModelAndView("schoolmanage/personal_score_school");
		mav.addObject("score", score);
		mav.addObject("course", course);
		System.out.println("ScoreController.java 显示" + s_id + "的成绩");
		return mav;
	}

	// 按课程关键字查询学生成绩
	@RequestMapping("search_student")
	public ModelAndView search_student(HttpSession session, String keyword) {
		String s_id = (String) session.getAttribute("s_id");
		ArrayList<Score> score = scoreService.searchScoreByKeyWord(keyword, s_id);
		ArrayList<Course> course = new ArrayList<Course>();
		if (score != null) {
			// 遍历
			for (int i = 0; i < score.size(); i++) {
				Score s = score.get(i);
				String c_id = s.getC_id();
				Course c = scoreService.getCourse(c_id);
				course.add(c);
			}
		}
		ModelAndView mav = new ModelAndView("student/personal_score_student");
		mav.addObject("score", score);
		mav.addObject("course", course);
		System.out.println("ScoreController.java 显示" + s_id + "keyword为“" + keyword + "”的成绩");
		return mav;
	}

	// 学校端
	// 显示所有学生的成绩
	@RequestMapping("showScore_schoolmanage")
	public ModelAndView showScore_schoolmanage(HttpSession session, String sm_id) {
		ArrayList<Score> score = scoreService.showScoreBySchool(sm_id);
		ArrayList<Course> course = new ArrayList<Course>();
		if (score != null) {
			// 遍历
			for (int i = 0; i < score.size(); i++) {
				Score s = score.get(i);
				String c_id = s.getC_id();
				Course c = scoreService.getCourse(c_id);
				course.add(c);
			}
		}
		ModelAndView mav = new ModelAndView("schoolmanage/personal_score_schoolmanage");
		mav.addObject("score", score);
		mav.addObject("course", course);
		System.out.println("ScoreController.java 显示学校" + sm_id + "的成绩");
		return mav;
	}

	// 按课程关键字查询学生成绩
	@RequestMapping("search_schoolmanage")
	public ModelAndView search_schoolmanage(HttpSession session, String keyword) {
		String sm_id = (String) session.getAttribute("sm_id");
		SchoolManage schoolmanage = schoolManageService.showschoolManageById(sm_id);
		String school = schoolmanage.getSm_school();
		ArrayList<Score> score = scoreService.searchScoreByKeyWord_schoolmanage(keyword, school);
		ArrayList<Course> course = new ArrayList<Course>();
		if (score != null) {
			// 遍历
			for (int i = 0; i < score.size(); i++) {
				Score s = score.get(i);
				String c_id = s.getC_id();
				Course c = scoreService.getCourse(c_id);
				course.add(c);
			}
		}
		ModelAndView mav = new ModelAndView("schoolmanage/personal_score_schoolmanage");
		mav.addObject("score", score);
		mav.addObject("course", course);
		System.out.println("ScoreController.java 显示" + sm_id + "keyword为“" + keyword + "”的成绩");
		return mav;
	}
}
