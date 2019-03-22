package com.chinasofti.mapping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.chinasofti.vo.Notice;
import com.chinasofti.vo.Bank;

@Repository
public interface NoticeMapper {
	//显示所有公告
	public ArrayList<Notice> showAllNotice();
	
	//管理员删除公告
	public void delete_admin(@Param("n_id") int n_id);
	
	//显示所有银行公告
	public ArrayList<Notice> showBankNotice();
	
	//根据n_id关联查找银行信息
	public Bank getBank(@Param("n_author") String n_author);
	
	//显示所有银行
	public Bank showBank(@Param("b_id") String b_id);
	
	//显示所有学校公告-学生
	public ArrayList<Notice> showSchoolNotice(@Param("s_id") String s_id);
	
	//显示所有学校公告-学校
	public ArrayList<Notice> showSchoolNotice2(@Param("sm_id") String sm_id);
	
	//根据关键字keyword查询公告
	public ArrayList<Notice> findNoticeByKeyWord(@Param("keyword") String keyword);
	
	//学生端根据关键字keyword查询银行的公告
	public ArrayList<Notice> findBankNoticeByKeyWord_student(@Param("keyword") String keyword);
	
	//学生端根据关键字keyword查询本校的公告
	public ArrayList<Notice> findSchoolNoticeByKeyWord_student(@Param("keyword") String keyword,@Param("s_school") String s_school);
	
	//学校删除学校公告
	public void delete_schoolmanage(@Param("n_id") int n_id);
	
	//显示公告详情
	public Notice findNoticeById(@Param("n_id")int n_id);
	
	//显示所有本银行的公告-银行
	public ArrayList<Notice> showBankNoticeById(@Param("bm_id") String bm_id);
	
	//添加公告
	public void addNotice(@Param("notice")Notice notice);

	//银行根据关键字keyword查询本行的公告
	public ArrayList<Notice> findBankNoticeByKeyWord_bankmanage(@Param("keyword") String keyword,@Param("bm_bank") String bm_bank);

	@Update("update notice set n_title = #{notice.n_title}, n_body = #{notice.n_body}, n_author = #{notice.n_author}, n_date = #{notice.n_date}, n_type = #{notice.n_type} where n_id = #{notice.n_id}")
    void updateNotice(@Param("notice") Notice notice);
}
