package com.chinasofti.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.mapping.SchoolMapper;
import com.chinasofti.vo.School;

@Service("schoolService")
public class SchoolService {
	@Autowired
	private SchoolMapper schoolMapper;

	// 显示所有学校
	public ArrayList<School> showAllSchool() {
		ArrayList<School> school = schoolMapper.showAllSchool();
		return school;
	}

}
