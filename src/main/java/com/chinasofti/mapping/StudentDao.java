package com.chinasofti.mapping;

import org.springframework.stereotype.Repository;
import com.chinasofti.commonmapper.CommonMapper;
import com.chinasofti.entity.Student;

@Repository
public interface StudentDao extends CommonMapper<Student> {
}
