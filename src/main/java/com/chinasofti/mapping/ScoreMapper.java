package com.chinasofti.mapping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.chinasofti.vo.Course;
import com.chinasofti.vo.Score;

@Repository
public interface ScoreMapper {
	//根据s_id查找学生基本资料
	public ArrayList<Score> showScoreById(@Param("s_id") String s_id);
	
	//根据s_id关联查找课程信息
	public Course getCourse(@Param("c_id") String c_id);
	
	//按课程关键字查询学生成绩
	public ArrayList<Score> searchScoreByKeyWord(@Param("keyword") String keyword,@Param("s_id") String s_id);
	
	//按课程关键字查询学生成绩
	public ArrayList<Score> searchScoreByKeyWord_schoolmanage(@Param("keyword") String keyword,@Param("school") String school);

	//根据s_id查找学生基本资料
	public ArrayList<Score> showScoreBySchool(@Param("sm_id") String sm_id);
}
