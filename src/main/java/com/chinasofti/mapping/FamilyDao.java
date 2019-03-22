package com.chinasofti.mapping;

import org.springframework.stereotype.Repository;
import com.chinasofti.commonmapper.CommonMapper;
import com.chinasofti.entity.Family;

@Repository
public interface FamilyDao extends CommonMapper<Family> {
}
