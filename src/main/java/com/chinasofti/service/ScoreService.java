package com.chinasofti.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.mapping.ScoreMapper;
import com.chinasofti.vo.Course;
import com.chinasofti.vo.Score;

@Service
public class ScoreService {
	@Autowired
	private ScoreMapper scoreMapper;

	// 根据s_id查找学生成绩
	public ArrayList showScoreById(String s_id) {
		ArrayList<Score> score = scoreMapper.showScoreById(s_id);
		return score;
	}

	// 根据s_id关联查找课程信息
	public Course getCourse(String c_id) {
		Course course = scoreMapper.getCourse(c_id);
		return course;
	}

	// 按课程关键字查询学生成绩-学生
	public ArrayList<Score> searchScoreByKeyWord(String keyword, String s_id) {
		ArrayList<Score> score = scoreMapper.searchScoreByKeyWord(keyword, s_id);
		return score;
	}

	// 按课程关键字查询学生成绩-学校
	public ArrayList<Score> searchScoreByKeyWord_schoolmanage(String keyword, String school) {
		ArrayList<Score> score = scoreMapper.searchScoreByKeyWord_schoolmanage(keyword, school);
		return score;
	}

	// 根据sm_id关联查找学生成绩
	public ArrayList showScoreBySchool(String sm_id) {
		ArrayList<Score> score = scoreMapper.showScoreBySchool(sm_id);
		return score;
	}
}
