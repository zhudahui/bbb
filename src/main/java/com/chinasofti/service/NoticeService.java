package com.chinasofti.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.mapping.NoticeMapper;
import com.chinasofti.vo.Notice;
import com.chinasofti.vo.Bank;

@Service
public class NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;

	// 显示所有公告
	public ArrayList showAllNotice() {
		ArrayList<Notice> notice = noticeMapper.showAllNotice();
		return notice;
	}

	// 管理员删除公告
	public void delete_admin(int n_id) {
		noticeMapper.delete_admin(n_id);
	}

	// 显示所有银行公告
	public ArrayList showBankNotice() {
		ArrayList<Notice> notice = noticeMapper.showBankNotice();
		return notice;
	}

	// 根据n_id关联查找银行信息
	public Bank getBank(String n_author) {
		Bank bank = noticeMapper.getBank(n_author);
		return bank;
	}

	// 显示所有银行
	public Bank showBank(String b_id) {
		Bank bank = noticeMapper.showBank(b_id);
		return bank;
	}

	// 显示所有学校公告-学生
	public ArrayList showSchoolNotice(String s_id) {
		ArrayList<Notice> notice = noticeMapper.showSchoolNotice(s_id);
		return notice;
	}

	// 显示所有学校公告-学校
	public ArrayList showSchoolNotice2(String sm_id) {
		ArrayList<Notice> notice = noticeMapper.showSchoolNotice2(sm_id);
		return notice;
	}

	// 根据关键字keyword查询公告
	public ArrayList<Notice> findNoticeByKeyWord(String keyword) {
		return noticeMapper.findNoticeByKeyWord(keyword);
	}

	// 学生端根据关键字keyword查询银行的公告
	public ArrayList<Notice> findBankNoticeByKeyWord_student(String keyword) {
		return noticeMapper.findBankNoticeByKeyWord_student(keyword);
	}

	// 学生端根据关键字keyword查询本校的公告
	public ArrayList<Notice> findSchoolNoticeByKeyWord_student(String keyword, String s_school) {
		return noticeMapper.findSchoolNoticeByKeyWord_student(keyword, s_school);
	}

	// 显示公告详情
	public Notice findNoticeById(int n_id) {
		return noticeMapper.findNoticeById(n_id);
	}

	// 学校删除学校公告
	public void delete_schoolmanage(int n_id) {
		noticeMapper.delete_schoolmanage(n_id);
	}

	// 添加公告
	public void addNotice(Notice notice) {
		noticeMapper.addNotice(notice);
	}

	// 显示所有本银行的公告-银行
	public ArrayList showBankNoticeById(String bm_id) {
		ArrayList<Notice> notice = noticeMapper.showBankNoticeById(bm_id);
		return notice;
	}

	// 银行根据关键字keyword查询本行的公告
	public ArrayList<Notice> findBankNoticeByKeyWord_bankmanage(String keyword, String bm_bank) {
		return noticeMapper.findBankNoticeByKeyWord_bankmanage(keyword, bm_bank);
	}

	public void updateNotice(Notice notice) {
		noticeMapper.updateNotice(notice);
	}
}
