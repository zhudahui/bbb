package com.chinasofti.mapping;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
	// 根据用户名和密码查找用户
	public int getAdmin(@Param("a_id") String a_id, @Param("a_pwd") String a_pwd);
}
