package com.chinasofti.mapping;

import org.springframework.stereotype.Repository;
import com.chinasofti.commonmapper.CommonMapper;
import com.chinasofti.entity.Score;

@Repository
public interface ScoreDao extends CommonMapper<Score> {
}
