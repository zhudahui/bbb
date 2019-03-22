package com.chinasofti.mapping;

import org.springframework.stereotype.Repository;
import com.chinasofti.commonmapper.CommonMapper;
import com.chinasofti.entity.Teacher;

@Repository
public interface TeacherDao extends CommonMapper<Teacher> {
}
