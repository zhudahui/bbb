package com.chinasofti.mapping;

import org.springframework.stereotype.Repository;
import com.chinasofti.commonmapper.CommonMapper;
import com.chinasofti.entity.Admin;

@Repository
public interface AdminDao extends CommonMapper<Admin> {
}
