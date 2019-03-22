package com.chinasofti.mapping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.chinasofti.vo.School;

@Repository
public interface SchoolMapper {
	// 显示所有学校
	public ArrayList<School> showAllSchool();

}
