package com.chinasofti.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.chinasofti.mapping.NoticeDao;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.service.BankManageService;
import com.chinasofti.service.NoticeService;
import com.chinasofti.service.StudentService;
import com.chinasofti.service.SchoolManageService;
import com.chinasofti.vo.Notice;
import com.chinasofti.vo.Student;
import com.chinasofti.vo.Bank;
import com.chinasofti.vo.BankManage;
import com.chinasofti.vo.CreditRequest;
import com.chinasofti.vo.SchoolManage;

@Controller
@RequestMapping("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private SchoolManageService schoolManageService;
	@Autowired
	private BankManageService bankManageService;

	@Autowired
	private NoticeDao noticeDao;

	// 管理员端
	// 显示所有公告-管理员
	@RequestMapping("showAllNotice")
	public ModelAndView showList(HttpSession session) {
		ArrayList<Notice> notice = noticeService.showAllNotice();
		ModelAndView mav = new ModelAndView("admin/notice_search_admin");
		mav.addObject("all", notice);
		System.out.println("NoticeController.java 显示所有公告");
		return mav;
	}

	// 根据关键字keyword查询公告-管理员
	@RequestMapping("search")
	@ResponseBody
	public ModelAndView showNotice(String keyword) {
		ArrayList<Notice> notice = noticeService.findNoticeByKeyWord(keyword);
		ModelAndView modelAndView = new ModelAndView("admin/notice_search_admin");
		modelAndView.addObject("all", notice);
		System.out.println("NoticeController.java 根据关键字keyword:" + keyword + "  查询公告");
		// System.out.println(notice);
		return modelAndView;
	}

	// 显示公告详情-管理员
	@RequestMapping("showNoticeDetail")
	public ModelAndView showNoticeDetail(int n_id) {
		Notice notice = noticeService.findNoticeById(n_id);
		ModelAndView modelAndView = new ModelAndView("admin/notice_search_check_admin");
		modelAndView.addObject("notice", notice);
		System.out.println("NoticeController.java 显示公告详情 公告id:" + n_id);
		return modelAndView;
	}

	// 管理员删除公告
	@RequestMapping("delete_admin")
	public ModelAndView delete_admin(HttpSession session, int n_id) {
		noticeService.delete_admin(n_id);
		ModelAndView modelAndView = new ModelAndView("redirect:/notice/showAllNotice");
		return modelAndView;
	}

	// 添加公告-管理员
	@RequestMapping("add")
	public ModelAndView addNotice(Notice notice) {
		noticeService.addNotice(notice);
		ModelAndView modelAndView = new ModelAndView("redirect:/notice/showAllNotice");
		return modelAndView;
	}

	@RequestMapping("updateNotice")
	public ModelAndView updateNotice(Notice notice) {
		noticeService.updateNotice(notice);
		ModelAndView modelAndView = new ModelAndView("redirect:/notice/showAllNotice");
		return modelAndView;
	}

	// 学生端
	// 显示所有银行公告
	@RequestMapping("showBankNotice_student")
	public ModelAndView showBankNotice_student(HttpSession session) {
		ArrayList<Notice> notice = noticeService.showBankNotice();
		ArrayList<Bank> bank = new ArrayList<Bank>();
		if (notice != null) {
			// 遍历
			for (int i = 0; i < notice.size(); i++) {
				Notice n = notice.get(i);
				String n_author = n.getN_author();
				Bank b = noticeService.getBank(n_author);
				bank.add(b);
			}
		}
		ModelAndView modelAndView = new ModelAndView("student/notice_bank_student");
		modelAndView.addObject("notice", notice);
		modelAndView.addObject("bank", bank);
		System.out.println("NoticeController.java 显示所有银行公告");
		return modelAndView;
		// ArrayList<Notice> notice = noticeService.showBankNotice();
		// ModelAndView modelAndView = new ModelAndView("student/notice_bank_student");
		// modelAndView.addObject("all", notice);
		// System.out.println("NoticeController.java 显示所有银行公告");
		// return modelAndView;
	}

	// 显示银行公告详情-学生
	@RequestMapping("showBankNoticeDetail_student")
	public ModelAndView showBankNoticeDetail_student(int n_id, String n_author) {
		Notice notice = noticeService.findNoticeById(n_id);
		Bank bank = noticeService.showBank(n_author);
		ModelAndView modelAndView = new ModelAndView("student/notice_bank_check_student");
		modelAndView.addObject("notice", notice);
		modelAndView.addObject("bank", bank);
		System.out.println("NoticeController.java 显示公告详情  公告id:" + n_id);
		return modelAndView;
	}

	// 显示所有学校公告
	@RequestMapping("showSchoolNotice_student")
	public ModelAndView showSchoolNotice_student(HttpSession session) {
		com.chinasofti.entity.Notice n = new com.chinasofti.entity.Notice();
		n.setNType("s");
		List<com.chinasofti.entity.Notice> select = noticeDao.select(n);
		ModelAndView modelAndView = new ModelAndView("student/notice_school_student");
		modelAndView.addObject("all", select);
		System.out.println("NoticeController.java 显示所有学校公告");
		return modelAndView;
	}

	// 显示学校公告详情-学生
	@RequestMapping("showSchoolNoticeDetail_student")
	public ModelAndView showSchoolNoticeDetail_student(int n_id) {
		Notice notice = noticeService.findNoticeById(n_id);
		ModelAndView modelAndView = new ModelAndView("student/notice_school_check_student");
		modelAndView.addObject("notice", notice);
		System.out.println("NoticeController.java 显示公告详情  公告id:" + n_id);
		return modelAndView;
	}

	// 按关键字keyword查询银行公告-学生
	@RequestMapping("search_bank_student")
	public ModelAndView search_bank_student(String keyword) {
		ArrayList<Notice> notice = noticeService.findBankNoticeByKeyWord_student(keyword);
		ArrayList<Bank> bank = new ArrayList<Bank>();
		if (notice != null) {
			// 遍历
			for (int i = 0; i < notice.size(); i++) {
				Notice n = notice.get(i);
				String n_author = n.getN_author();
				Bank b = noticeService.getBank(n_author);
				bank.add(b);
			}
		}
		ModelAndView modelAndView = new ModelAndView("student/notice_bank_student");
		modelAndView.addObject("notice", notice);
		modelAndView.addObject("bank", bank);
		System.out.println("NoticeController.java 显示所有银行公告");
		return modelAndView;
	}

	// 根据关键字keyword查询学校公告-学生
	@RequestMapping("search_school_student")
	@ResponseBody
	public ModelAndView search_school_student(HttpSession session, String keyword) throws ParseException {
		String s_id = (String) session.getAttribute("s_id");
		// System.out.println(keyword + "," + s_id);
		Student student = studentService.showStudentById(s_id);
		String s_school = student.getS_school();
		System.out.println(s_school);
		ArrayList<Notice> notice = noticeService.findSchoolNoticeByKeyWord_student(keyword, s_school);
		List<com.chinasofti.entity.Notice> results = new ArrayList<>();
        for (Notice n1 : notice) {
            com.chinasofti.entity.Notice n = new com.chinasofti.entity.Notice();
            n.setNId(n1.getN_id());
            n.setNTitle(n1.getN_title());
            n.setNBody(n1.getN_body());
            n.setNAuthor(n1.getN_author());
            n.setNDate(DateUtils.parseDate(n1.getN_date(), "yyyy-MM-dd"));
            n.setNType(n1.getN_type());
            n.setFlag(n1.getFlag());
            results.add(n);
        }
		ModelAndView modelAndView = new ModelAndView("student/notice_school_student");
		modelAndView.addObject("all", results);
		System.out.println("NoticeController.java 根据关键字keyword:" + keyword + "  查询公告");
		return modelAndView;
	}

	// 学校端
	// 显示所有银行公告
	@RequestMapping("showBankNotice_schoolmanage")
	public ModelAndView showBankNotice_schoolmanage(HttpSession session) {
		ArrayList<Notice> notice = noticeService.showBankNotice();
		ArrayList<Bank> bank = new ArrayList<Bank>();
		if (notice != null) {
			// 遍历
			for (int i = 0; i < notice.size(); i++) {
				Notice n = notice.get(i);
				String n_author = n.getN_author();
				Bank b = noticeService.getBank(n_author);
				bank.add(b);
			}
		}
		ModelAndView modelAndView = new ModelAndView("schoolmanage/notice_bank_schoolmanage");
		modelAndView.addObject("notice", notice);
		modelAndView.addObject("bank", bank);
		System.out.println("NoticeController.java 显示所有银行公告");
		return modelAndView;
	}

	// 显示银行公告详情-学校
	@RequestMapping("showBankNoticeDetail_schoolmanage")
	public ModelAndView showBankNoticeDetail_schoolmanage(int n_id, String n_author) {
		System.out.println(n_author);
		Notice notice = noticeService.findNoticeById(n_id);
		Bank bank = noticeService.showBank(n_author);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/notice_bank_check_schoolmanage");
		modelAndView.addObject("notice", notice);
		modelAndView.addObject("bank", bank);
		System.out.println("NoticeController.java 显示公告详情  公告id:" + n_id);
		return modelAndView;
	}

	// 显示所有学校公告
	@RequestMapping("showSchoolNotice_schoolmanage")
	public ModelAndView showSchoolNotice_schoolmanage(HttpSession session, String sm_id) {
		ArrayList<Notice> notice = noticeService.showSchoolNotice2(sm_id);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/notice_school_schoolmanage");
		modelAndView.addObject("all", notice);
		System.out.println("NoticeController.java 显示所有学校公告");
		return modelAndView;
	}

	// 显示学校公告详情-学校
	@RequestMapping("showSchoolNoticeDetail_schoolmanage")
	public ModelAndView showSchoolNoticeDetail_schoolmanage(int n_id) {
		Notice notice = noticeService.findNoticeById(n_id);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/notice_school_check_schoolmanage");
		modelAndView.addObject("notice", notice);
		System.out.println("NoticeController.java 显示公告详情  公告id:" + n_id);
		return modelAndView;
	}

	// 按关键字keyword查询银行公告-学校
	@RequestMapping("search_bank_schoolmanage")
	public ModelAndView search_bank_schoolmanage(String keyword) {
		ArrayList<Notice> notice = noticeService.findBankNoticeByKeyWord_student(keyword);
		ArrayList<Bank> bank = new ArrayList<Bank>();
		if (notice != null) {
			// 遍历
			for (int i = 0; i < notice.size(); i++) {
				Notice n = notice.get(i);
				String n_author = n.getN_author();
				Bank b = noticeService.getBank(n_author);
				bank.add(b);
			}
		}
		ModelAndView modelAndView = new ModelAndView("schoolmanage/notice_bank_schoolmanage");
		modelAndView.addObject("notice", notice);
		modelAndView.addObject("bank", bank);
		System.out.println("NoticeController.java 显示所有银行公告");
		return modelAndView;
	}

	// 根据关键字keyword查询学校公告-学校
	@RequestMapping("search_school_schoolmanage")
	@ResponseBody
	public ModelAndView search_school_schoolmanage(HttpSession session, String keyword) {
		String sm_id = (String) session.getAttribute("sm_id");
		// System.out.println(keyword + "," + s_id);
		SchoolManage schoolManage = schoolManageService.showschoolManageById(sm_id);
		String sm_school = schoolManage.getSm_school();
		System.out.println(sm_school);
		ArrayList<Notice> notice = noticeService.findSchoolNoticeByKeyWord_student(keyword, sm_school);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/notice_school_schoolmanage");
		modelAndView.addObject("all", notice);
		System.out.println("NoticeController.java 根据关键字keyword:" + keyword + "  查询公告");
		return modelAndView;
	}

	// 学校删除学校公告
	@RequestMapping("delete_schoolmanage")
	public ModelAndView delete_schoolmanage(HttpSession session, int n_id) {
		noticeService.delete_schoolmanage(n_id);
		String sm_id = (String) session.getAttribute("sm_id");
		ArrayList<Notice> notice = noticeService.showSchoolNotice2(sm_id);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/notice_school_schoolmanage");
		modelAndView.addObject("all", notice);
		System.out.println("NoticeController.java 已删除公告 n_id:" + n_id);
		return modelAndView;
	}

	// 银行端
	// 显示所有本银行的公告
	@RequestMapping("showBankNotice_bankmanage")
	public ModelAndView showBankNotice_bankmanage(HttpSession session, String bm_id) {
		ArrayList<Notice> notice = noticeService.showBankNoticeById(bm_id);
		ModelAndView modelAndView = new ModelAndView("bankmanage/notice_search_bankmanage");
		modelAndView.addObject("all", notice);
		System.out.println("NoticeController.java 显示所有银行" + bm_id + "的公告");
		return modelAndView;
	}

	// 显示银行公告详情-银行
	@RequestMapping("showBankNoticeDetail_bankmanage")
	public ModelAndView showBankNoticeDetail_bankmanage(int n_id) {
		Notice notice = noticeService.findNoticeById(n_id);
		ModelAndView modelAndView = new ModelAndView("bankmanage/notice_search_check_bankmanage");
		modelAndView.addObject("notice", notice);
		System.out.println("NoticeController.java 显示公告详情  公告id:" + n_id);
		return modelAndView;
	}

	// 根据关键字keyword查询学校公告-学校
	@RequestMapping("search_bank_bankmanage")
	@ResponseBody
	public ModelAndView search_bank_bankmanage(HttpSession session, String keyword) {
		String bm_id = (String) session.getAttribute("bm_id");
		BankManage bankManage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankManage.getBm_bank();
		ArrayList<Notice> notice = noticeService.findBankNoticeByKeyWord_bankmanage(keyword, bm_bank);
		ModelAndView modelAndView = new ModelAndView("bankmanage/notice_search_bankmanage");
		modelAndView.addObject("all", notice);
		System.out.println("NoticeController.java 根据关键字keyword:" + keyword + "  查询公告");
		return modelAndView;
	}

	// 学校删除学校公告
	@RequestMapping("delete_bankmanage")
	public ModelAndView delete_bankmanage(HttpSession session, int n_id) {
		noticeService.delete_schoolmanage(n_id);
		String bm_id = (String) session.getAttribute("bm_id");
		ArrayList<Notice> notice = noticeService.showBankNoticeById(bm_id);
		ModelAndView modelAndView = new ModelAndView("bankmanage/notice_search_bankmanage");
		modelAndView.addObject("all", notice);
		System.out.println("NoticeController.java 显示所有银行" + bm_id + "的公告");
		return modelAndView;
	}

}
