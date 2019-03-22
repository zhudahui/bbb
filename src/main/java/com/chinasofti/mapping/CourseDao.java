package com.chinasofti.mapping;

import org.springframework.stereotype.Repository;
import com.chinasofti.commonmapper.CommonMapper;
import com.chinasofti.entity.Course;

@Repository
public interface CourseDao extends CommonMapper<Course> {
}
