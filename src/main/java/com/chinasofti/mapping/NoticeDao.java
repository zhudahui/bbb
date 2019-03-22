package com.chinasofti.mapping;

import org.springframework.stereotype.Repository;
import com.chinasofti.commonmapper.CommonMapper;
import com.chinasofti.entity.Notice;

@Repository
public interface NoticeDao extends CommonMapper<Notice> {
}
