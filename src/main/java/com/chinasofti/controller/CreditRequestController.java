package com.chinasofti.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.chinasofti.entity.Creditrequest;
import com.chinasofti.mapping.CreditrequestDao;
import com.chinasofti.mapping.StudentDao;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.mapping.FamilyDao;
import com.chinasofti.service.BankManageService;
import com.chinasofti.service.CreditRequestService;
import com.chinasofti.service.SchoolManageService;
import com.chinasofti.service.StudentService;
import com.chinasofti.vo.BankManage;
import com.chinasofti.vo.CreditRequest;
import com.chinasofti.vo.Family;
import com.chinasofti.vo.Student;
import com.chinasofti.vo.SchoolManage;

@Controller
@RequestMapping("creditrequest")
public class CreditRequestController {

	@Autowired
	private CreditRequestService requestService;
	@Autowired
	private SchoolManageService schoolManageService;
	@Autowired
	private BankManageService bankManageService;
	@Autowired
	private FamilyDao familyDao;

	@Autowired
	private CreditrequestDao creditrequestDao;

	@Autowired
	private StudentDao studentDao;



	// 管理员端
	// 显示所有贷款申请单
	@RequestMapping("showAllRequest")
	public ModelAndView showList(HttpSession session) {
		ArrayList<CreditRequest> request = requestService.showAllRequest();
		ModelAndView mav = new ModelAndView("admin/request_search_admin");
		System.out.println("所有贷款申请："+request);
		mav.addObject("all", request);
		System.out.println("CreditRequestController.java 显示所有贷款申请单");
		return mav;
	}

	// 管理员显示申请具体内容
	@RequestMapping("showCreditRequestDetail_admin")
	public ModelAndView showCreditRequestDetail_admin(int r_id, String s_id) {
		CreditRequest request = requestService.findRequestByR_id(r_id);
		System.out.println("-->"+request);
		Student student = requestService.findStudentByS_id(s_id);
		ArrayList<Family> family = requestService.findFamilyByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("admin/request_search_check_admin");
		System.out.println("家庭收入："+request.getAnnualincome());
		modelAndView.addObject("request", request);
		modelAndView.addObject("student", student);
		//
		com.chinasofti.entity.Family fm = new com.chinasofti.entity.Family();
		fm.setSId(s_id);
		List<com.chinasofti.entity.Family> fms = familyDao.select(fm);
		//处理集合
		ArrayList<String> fNickname = new  ArrayList<String>();
		ArrayList<String> fName = new  ArrayList<String>();
		ArrayList<String> fCompany = new  ArrayList<String>();
		ArrayList<String> fPhone = new  ArrayList<String>();
		for(int i = 0 ; i < fms.size() ; i++ ){
			String fnn = fms.get(i).getFNickname();
			fNickname.add(i,fnn);
			String n = fms.get(i).getFName();
			fName.add(i,n);
			fCompany.add(i,fms.get(i).getFCompany());
			fPhone.add(i,fms.get(i).getFPhone());
		}
		modelAndView.addObject("fNickname", fNickname);
		modelAndView.addObject("fName", fName);
		modelAndView.addObject("fCompany", fCompany);
		modelAndView.addObject("fPhone", fPhone);
		if (family != null) {
			// 遍历
			for (int i = 0; i < family.size(); i++) {// i < family.size()
				StringBuilder str = new StringBuilder();
				str.append(i);
				Family f = family.get(i);
				modelAndView.addObject("f" + str, f);
			}
		}
		System.out.println("CreditRequestController.java 显示申请具体内容 申请id:" + r_id);
		return modelAndView;
	}

	@RequestMapping("showCreditRequestDetail_bank")
	public ModelAndView showCreditRequestDetail_bank(int r_id, String s_id) {
		CreditRequest request = requestService.findRequestByR_id(r_id);
		System.out.println("-->"+request);
		Student student = requestService.findStudentByS_id(s_id);
		ArrayList<Family> family = requestService.findFamilyByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("bankmanage/loan_notcomplete_check_bankmanage");
		System.out.println("家庭收入："+request.getAnnualincome());
		modelAndView.addObject("request", request);
		modelAndView.addObject("student", student);
		//
		com.chinasofti.entity.Family fm = new com.chinasofti.entity.Family();
		fm.setSId(s_id);
		List<com.chinasofti.entity.Family> fms = familyDao.select(fm);
		//处理集合
		ArrayList<String> fNickname = new  ArrayList<String>();
		ArrayList<String> fName = new  ArrayList<String>();
		ArrayList<String> fCompany = new  ArrayList<String>();
		ArrayList<String> fPhone = new  ArrayList<String>();
		for(int i = 0 ; i < fms.size() ; i++ ){
			String fnn = fms.get(i).getFNickname();
			fNickname.add(i,fnn);
			String n = fms.get(i).getFName();
			fName.add(i,n);
			fCompany.add(i,fms.get(i).getFCompany());
			fPhone.add(i,fms.get(i).getFPhone());
		}
		modelAndView.addObject("fNickname", fNickname);
		modelAndView.addObject("fName", fName);
		modelAndView.addObject("fCompany", fCompany);
		modelAndView.addObject("fPhone", fPhone);
		if (family != null) {
			// 遍历
			for (int i = 0; i < family.size(); i++) {// i < family.size()
				StringBuilder str = new StringBuilder();
				str.append(i);
				Family f = family.get(i);
				modelAndView.addObject("f" + str, f);
			}
		}
		System.out.println("CreditRequestController.java 显示申请具体内容 申请id:" + r_id);
		return modelAndView;
	}

	@RequestMapping("audit")
	@ResponseBody
	public Map<String, Object> audit(Integer r_id, String msg, String bankOrSchool, Integer status) {
		Creditrequest param = new Creditrequest();
		param.setRId(r_id);
		if(StringUtils.equals(bankOrSchool, "B")) {
			param.setBankidea(msg);
		} else {
			param.setSchoolidea(msg);
		}
		param.setFlag(status);
		creditrequestDao.updateByPrimaryKeySelective(param);
		Map<String, Object> res = new HashMap<>();
		res.put("status", "S");
		res.put("bm_id", "S");
		return res;
	}



	// 根据关键字keyword查询申请-管理员
	@RequestMapping("search_admin")
	@ResponseBody
	public ModelAndView search_admin(String keyword) {
		ArrayList<CreditRequest> request = requestService.findRequestByKeyWord(keyword);
		ModelAndView modelAndView = new ModelAndView("admin/request_search_admin");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 根据关键字keyword:" + keyword + "  查询申请");
		return modelAndView;
	}
	
	// 删除申请-管理员
	@RequestMapping("delete_admin")
	public ModelAndView delete_admin(HttpSession session, int r_id) {
		requestService.delete_admin(r_id);
		ArrayList<CreditRequest> request = requestService.showAllRequest();
		ModelAndView mav = new ModelAndView("admin/request_search_admin");
		mav.addObject("all", request);
		System.out.println("CreditRequestController.java 管理员删除申请 r_id:"+r_id);
		return mav;
	}

	// 学生端
	// 学生查询个人所有申请
	@RequestMapping("showAllRequest_student")
	@ResponseBody
	public ModelAndView showRequest_student(String s_id) {
		ArrayList<CreditRequest> request = requestService.findRequestByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("student/loan_search_student");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 学生" + s_id + "查询个人所有申请");
		return modelAndView;
	}

	// 学生端显示申请具体内容
	@RequestMapping("showRequestDetail")
	public ModelAndView showshowRequestDetail(int r_id, String s_id) {


		CreditRequest request = requestService.findRequestByR_id(r_id);
		System.out.println("-->"+request);
		Student student = requestService.findStudentByS_id(s_id);
		ArrayList<Family> family = requestService.findFamilyByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("student/loan_search_check_student");
		System.out.println("家庭收入："+request.getAnnualincome());
		modelAndView.addObject("request", request);
		modelAndView.addObject("student", student);
		//
		com.chinasofti.entity.Family fm = new com.chinasofti.entity.Family();
		fm.setSId(s_id);
		List<com.chinasofti.entity.Family> fms = familyDao.select(fm);
		//处理集合
		ArrayList<String> fNickname = new  ArrayList<String>();
		ArrayList<String> fName = new  ArrayList<String>();
		ArrayList<String> fCompany = new  ArrayList<String>();
		ArrayList<String> fPhone = new  ArrayList<String>();
		for(int i = 0 ; i < fms.size() ; i++ ){
			String fnn = fms.get(i).getFNickname();
			fNickname.add(i,fnn);
			String n = fms.get(i).getFName();
			fName.add(i,n);
			fCompany.add(i,fms.get(i).getFCompany());
			fPhone.add(i,fms.get(i).getFPhone());
		}
		modelAndView.addObject("fNickname", fNickname);
		modelAndView.addObject("fName", fName);
		modelAndView.addObject("fCompany", fCompany);
		modelAndView.addObject("fPhone", fPhone);
		if (family != null) {
			// 遍历
			for (int i = 0; i < family.size(); i++) {// i < family.size()
				StringBuilder str = new StringBuilder();
				str.append(i);
				Family f = family.get(i);
				modelAndView.addObject("f" + str, f);
			}
		}
		System.out.println("CreditRequestController.java 显示申请具体内容 申请id:" + r_id);
		return modelAndView;
	}

	// 根据关键字keyword查询申请-学生
	@RequestMapping("search_student")
	@ResponseBody
	public ModelAndView search_student(HttpSession session, String keyword) {
		String s_id = (String) session.getAttribute("s_id");
		// System.out.println(s_id);
		ArrayList<CreditRequest> request = requestService.findRequestByKeyWord_student(keyword, s_id);
		ModelAndView modelAndView = new ModelAndView("student/loan_search_student");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 根据关键字keyword:" + keyword + "  查询申请");
		return modelAndView;
	}

	// 学生取消申请
	@RequestMapping("delete_student")
	public ModelAndView delete_student(HttpSession session, int r_id) {
//		System.out.println("r_id:" + r_id);
		requestService.delete_student(r_id);
		String s_id = (String) session.getAttribute("s_id");
		ArrayList<CreditRequest> request = requestService.findRequestByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("student/loan_search_student");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 学生" + s_id + "查询个人所有申请");
		return modelAndView;
	}

	// 学校端
	// 显示所有未审批贷款申请单
	@RequestMapping("showAllRequest_schoolmanage")
	public ModelAndView showAllRequest_schoolmanage(HttpSession session, String sm_id) {
		SchoolManage schoolmanage = schoolManageService.showschoolManageById(sm_id);
		String school = schoolmanage.getSm_school();
		// System.out.println("school:"+school);
		ArrayList<CreditRequest> request = requestService.showAllNotCompleteRequest(school);
		ModelAndView mav = new ModelAndView("schoolmanage/loan_notcomplete_schoolmanage");
		mav.addObject("all", request);
		mav.addObject("schoolmanage", schoolmanage);
		System.out.println("CreditRequestController.java 显示所有未经学校审批的贷款申请单");
		return mav;
	}

	// 学校端显示未审批的申请具体内容
	@RequestMapping("showNotCompleteCreditRequestDetail_schoolmanage")
	public ModelAndView showNotCompleteCreditRequestDetail_schoolmanage(int r_id, String s_id, HttpSession session) {
		CreditRequest request = requestService.findRequestByR_id(r_id);
		Student student = requestService.findStudentByS_id(s_id);
		ArrayList<Family> family = requestService.findFamilyByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/loan_notcomplete_check_schoolmanage");
		modelAndView.addObject("request", request);
		modelAndView.addObject("student", student);
		if (family != null) {
			// 遍历
			for (int i = 0; i < family.size(); i++) {
				StringBuilder str = new StringBuilder();
				str.append(i);
				// System.out.println("i:"+str);
				Family f = family.get(i);
				modelAndView.addObject("f" + str, f);
			}
		}
		SchoolManage schoolmanage = schoolManageService.showschoolManageById((String)session.getAttribute("sm_id"));
		modelAndView.addObject("schoolmanage", schoolmanage);
		System.out.println("CreditRequestController.java 显示未经学校审批申请具体内容 申请id:" + r_id);
		return modelAndView;
	}

	// 显示所有已审批贷款申请单
	@RequestMapping("showAllCompleteRequest_schoolmanage")
	public ModelAndView showAllCompleteRequest_schoolmanage(HttpSession session, String sm_id) {
		SchoolManage schoolmanage = schoolManageService.showschoolManageById(sm_id);
		String school = schoolmanage.getSm_school();
		// System.out.println("school:"+school);
		ArrayList<CreditRequest> request = requestService.showAllCompleteRequest(school);
		ModelAndView mav = new ModelAndView("schoolmanage/loan_complete_schoolmanage");
		mav.addObject("all", request);
		System.out.println("CreditRequestController.java 显示所有已经学校审批的贷款申请单");
		return mav;
	}

	// 学校端显示已审批的申请具体内容
	@RequestMapping("showCompleteCreditRequestDetail_schoolmanage")
	public ModelAndView showCompleteCreditRequestDetail_schoolmanage(int r_id, String s_id) {

		CreditRequest request = requestService.findRequestByR_id(r_id);
		System.out.println("-->"+request);
		Student student = requestService.findStudentByS_id(s_id);
		ArrayList<Family> family = requestService.findFamilyByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/loan_complete_check_schoolmanage");
		System.out.println("家庭收入："+request.getAnnualincome());
		modelAndView.addObject("request", request);
		modelAndView.addObject("student", student);
		//
		com.chinasofti.entity.Family fm = new com.chinasofti.entity.Family();
		fm.setSId(s_id);
		List<com.chinasofti.entity.Family> fms = familyDao.select(fm);
		//处理集合
		ArrayList<String> fNickname = new  ArrayList<String>();
		ArrayList<String> fName = new  ArrayList<String>();
		ArrayList<String> fCompany = new  ArrayList<String>();
		ArrayList<String> fPhone = new  ArrayList<String>();
		for(int i = 0 ; i < fms.size() ; i++ ){
			String fnn = fms.get(i).getFNickname();
			fNickname.add(i,fnn);
			String n = fms.get(i).getFName();
			fName.add(i,n);
			fCompany.add(i,fms.get(i).getFCompany());
			fPhone.add(i,fms.get(i).getFPhone());
		}
		modelAndView.addObject("fNickname", fNickname);
		modelAndView.addObject("fName", fName);
		modelAndView.addObject("fCompany", fCompany);
		modelAndView.addObject("fPhone", fPhone);
		if (family != null) {
			// 遍历
			for (int i = 0; i < family.size(); i++) {// i < family.size()
				StringBuilder str = new StringBuilder();
				str.append(i);
				Family f = family.get(i);
				modelAndView.addObject("f" + str, f);
			}
		}
		System.out.println("CreditRequestController.java 显示申请具体内容 申请id:" + r_id);
		return modelAndView;
	}

	// 根据关键字keyword查询未审批的申请-学校
	@RequestMapping("search_notcomplete_schoolmanage")
	@ResponseBody
	public ModelAndView search_notcomplete_schoolmanage(HttpSession session, String keyword) {
		String sm_id = (String) session.getAttribute("sm_id");
		SchoolManage schoolmanage = schoolManageService.showschoolManageById(sm_id);
		String school = schoolmanage.getSm_school();
		ArrayList<CreditRequest> request = requestService.findNotCompleteRequestByKeyWord_schoolmanage(keyword, school);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/loan_notcomplete_schoolmanage");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 根据关键字keyword:" + keyword + "  查询申请");
		return modelAndView;
	}

	// 根据关键字keyword查询已审批的申请-学校
	@RequestMapping("search_complete_schoolmanage")
	@ResponseBody
	public ModelAndView search_complete_schoolmanage(HttpSession session, String keyword) {
		String sm_id = (String) session.getAttribute("sm_id");
		SchoolManage schoolmanage = schoolManageService.showschoolManageById(sm_id);
		String school = schoolmanage.getSm_school();
		ArrayList<CreditRequest> request = requestService.findCompleteRequestByKeyWord_schoolmanage(keyword, school);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/loan_complete_schoolmanage");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 根据关键字keyword:" + keyword + "  查询申请");
		return modelAndView;
	}

	// 学校端通过申请
	@RequestMapping("pass_schoolmanage")
	public ModelAndView pass_schoolmanage(HttpSession session, int r_id, String schoolidea) {
		System.out.println("r_id:" + r_id);
		requestService.pass_schoolmanage(r_id, schoolidea);
		String sm_id = (String) session.getAttribute("sm_id");
		SchoolManage schoolmanage = schoolManageService.showschoolManageById(sm_id);
		String school = schoolmanage.getSm_school();
		ArrayList<CreditRequest> request = requestService.showAllNotCompleteRequest(school);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/loan_notcomplete_schoolmanage");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 已审批申请，结果：通过 申请id:" + r_id);
		return modelAndView;
	}

	// 学校端否决申请
	@RequestMapping("fail_schoolmanage")
	public ModelAndView fail_schoolmanage(HttpSession session, int r_id, String schoolidea) {
		System.out.println("r_id:" + r_id);
		requestService.fail_schoolmanage(r_id, schoolidea);
		String sm_id = (String) session.getAttribute("sm_id");
		SchoolManage schoolmanage = schoolManageService.showschoolManageById(sm_id);
		String school = schoolmanage.getSm_school();
		ArrayList<CreditRequest> request = requestService.showAllNotCompleteRequest(school);
		ModelAndView modelAndView = new ModelAndView("schoolmanage/loan_notcomplete_schoolmanage");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 已审批申请，结果：否决 申请id:" + r_id);
		return modelAndView;
	}

	// 银行端
	// 显示所有未审批贷款申请单
	@RequestMapping("showNotCompleteCreditRequest_bankmanage")
	public ModelAndView showNotCompleteCreditRequest_bankmanage(HttpSession session, String bm_id) {
		BankManage bankmanage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankmanage.getBm_bank();
		ArrayList<CreditRequest> request = requestService.showAllNotCompleteRequest_bankmanage(bm_bank);
		ModelAndView mav = new ModelAndView("bankmanage/loan_notcomplete_bankmanage");
		mav.addObject("all", request);
		System.out.println("CreditRequestController.java 显示所有未经银行审批的贷款申请单");
		return mav;
	}

	// 银行端显示未审批的申请具体内容
	@RequestMapping("showNotCompleteCreditRequestDetail_bankmanage")
	public ModelAndView showNotCompleteCreditRequestDetail_bankmanage(int r_id, String s_id) {
		CreditRequest request = requestService.findRequestByR_id(r_id);
		Student student = requestService.findStudentByS_id(s_id);
		ArrayList<Family> family = requestService.findFamilyByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("bankmanage/loan_notcomplete_check_bankmanage");
		modelAndView.addObject("request", request);
		modelAndView.addObject("student", student);
		if (family != null) {
			// 遍历
			for (int i = 0; i < family.size(); i++) {// i < family.size()
				StringBuilder str = new StringBuilder();
				str.append(i);
				// System.out.println("i:"+str);
				Family f = family.get(i);
				modelAndView.addObject("f" + str, f);
			}
		}
		System.out.println("CreditRequestController.java 显示未经银行审批申请具体内容 申请id:" + r_id);
		return modelAndView;
	}

	// 显示所有已审批贷款申请单
	@RequestMapping("showAllCompleteRequest_bankmanage")
	public ModelAndView showAllCompleteRequest_bankmanage(HttpSession session, String bm_id) {
		BankManage bankmanage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankmanage.getBm_bank();
		ArrayList<CreditRequest> request = requestService.showAllCompleteRequest_bankmanage(bm_bank);
		ModelAndView mav = new ModelAndView("bankmanage/loan_complete_bankmanage");
		mav.addObject("all", request);
		System.out.println("CreditRequestController.java 显示所有已经银行审批的贷款申请单");
		return mav;
	}

	// 银行端显示已审批的申请具体内容
	@RequestMapping("showCompleteCreditRequestDetail_bankmanage")
	public ModelAndView showCompleteCreditRequestDetail_bankmanage(int r_id, String s_id) {
		CreditRequest request = requestService.findRequestByR_id(r_id);
		Student student = requestService.findStudentByS_id(s_id);
		ArrayList<Family> family = requestService.findFamilyByS_id(s_id);
		ModelAndView modelAndView = new ModelAndView("bankmanage/loan_complete_check_bankmanage");
		modelAndView.addObject("request", request);
		modelAndView.addObject("student", student);
		if (family != null) {
			// 遍历
			for (int i = 0; i < family.size(); i++) {
				StringBuilder str = new StringBuilder();
				str.append(i);
				Family f = family.get(i);
				modelAndView.addObject("f" + str, f);
			}
		}
		System.out.println("CreditRequestController.java 显示已经银行审批申请具体内容 申请id:" + r_id);
		return modelAndView;
	}

	// 根据关键字keyword查询未审批的申请-银行
	@RequestMapping("search_notcomplete_bankmanage")
	@ResponseBody
	public ModelAndView search_notcomplete_bankmanage(HttpSession session, String keyword) {
		String bm_id = (String) session.getAttribute("bm_id");
		BankManage bankManage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankManage.getBm_bank();
		ArrayList<CreditRequest> request = requestService.findNotCompleteRequestByKeyWord_bankmanage(keyword, bm_bank);
		ModelAndView modelAndView = new ModelAndView("bankmanage/loan_notcomplete_bankmanage");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 根据关键字keyword:" + keyword + "  查询申请");
		return modelAndView;
	}

	// 根据关键字keyword查询已审批的申请-银行
	@RequestMapping("search_complete_bankmanage")
	@ResponseBody
	public ModelAndView search_complete_bankmanage(HttpSession session, String keyword) {
		String bm_id = (String) session.getAttribute("bm_id");
		BankManage bankManage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankManage.getBm_bank();
		ArrayList<CreditRequest> request = requestService.findCompleteRequestByKeyWord_bankmanage(keyword, bm_bank);
		ModelAndView modelAndView = new ModelAndView("bankmanage/loan_complete_bankmanage");
		modelAndView.addObject("all", request);
		System.out.println("CreditRequestController.java 根据关键字keyword:" + keyword + "  查询申请");
		return modelAndView;
	}

	// 银行端通过申请
	@RequestMapping("pass_bankmanage")
	public ModelAndView pass_bankmanage(HttpSession session, int r_id, String bankidea) {
		// System.out.println("r_id:" + r_id);
		requestService.pass_bankmanage(r_id, bankidea);
		String bm_id = (String) session.getAttribute("bm_id");
		BankManage bankmanage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankmanage.getBm_bank();
		ArrayList<CreditRequest> request = requestService.showAllNotCompleteRequest_bankmanage(bm_bank);
		ModelAndView mav = new ModelAndView("bankmanage/loan_notcomplete_bankmanage");
		mav.addObject("all", request);
		System.out.println("CreditRequestController.java 已审批申请，结果：通过 申请id:" + r_id);
		return mav;
	}

	// 银行端否决申请
	@RequestMapping("fail_bankmanage")
	public ModelAndView fail_bankmanage(HttpSession session, int r_id, String bankidea) {
		// System.out.println("r_id:" + r_id);
		requestService.fail_bankmanage(r_id, bankidea);
		String bm_id = (String) session.getAttribute("bm_id");
		BankManage bankmanage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankmanage.getBm_bank();
		ArrayList<CreditRequest> request = requestService.showAllNotCompleteRequest_bankmanage(bm_bank);
		ModelAndView mav = new ModelAndView("bankmanage/loan_notcomplete_bankmanage");
		mav.addObject("all", request);
		System.out.println("CreditRequestController.java 已审批申请，结果：否决 申请id:" + r_id);
		return mav;
	}

	@RequestMapping(value="/download")
	public ResponseEntity<byte[]> download(String sid, HttpServletRequest request) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		String fileName=new String("审批信息.pdf".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		com.chinasofti.entity.Student param = new com.chinasofti.entity.Student();
		param.setSId(sid);
		com.chinasofti.entity.Student student = studentDao.selectOne(param);

		Creditrequest reqParam = new Creditrequest();
		reqParam.setSId(sid);
		List<Creditrequest> select = creditrequestDao.select(reqParam);
		Collections.sort(select, new Comparator<Creditrequest>() {
			@Override
			public int compare(Creditrequest o1, Creditrequest o2) {
				return o2.getRequestdate().compareTo(o1.getRequestdate());
			}
		});

		Creditrequest creditrequest = select.get(0);

		com.chinasofti.entity.Family family = new com.chinasofti.entity.Family();
		family.setSId(sid);
		List<com.chinasofti.entity.Family> fas = familyDao.select(family);


		Resource r = new ClassPathResource("audit.pdf");
		PdfReader reader = new PdfReader(r.getInputStream()); // 模版文件目录
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		PdfStamper ps = new PdfStamper(reader, baos); // 生成的输出流
		BaseFont bf = BaseFont.createFont("C:\\Windows\\Fonts\\msyh.ttc,0", BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
		AcroFields s =  ps.getAcroFields();
		fillPdf(bf, s, "fill_1", student.getSName());
		fillPdf(bf, s, "fill_2", student.getSGender());
		fillPdf(bf, s, "fill_3", DateFormatUtils.format(student.getSBirth(), "yyyy-MM-dd"));
		fillPdf(bf, s, "fill_4", student.getSAge().toString());
		fillPdf(bf, s, "fill_5", student.getSIdcard());
		fillPdf(bf, s, "fill_6", student.getSNation());
		fillPdf(bf, s, "fill_7", student.getSMajor());
		fillPdf(bf, s, "fill_8", student.getSClass());
		fillPdf(bf, s, "fill_9", student.getSId());
		fillPdf(bf, s, "fill_10", student.getSPoliticalstatus());
		fillPdf(bf, s, "fill_11", student.getSNativeplace());
		fillPdf(bf, s, "fill_12", student.getSAddress());
		fillPdf(bf, s, "fill_13", student.getSPostalcode());
		fillPdf(bf, s, "fill_14", student.getSPhone());
		fillPdf(bf, s, "fill_15", student.getSQq());
		fillPdf(bf, s, "fill_16", student.getSEmail());

		if(CollectionUtils.isNotEmpty(fas)) {
			for (int i = 0; i < fas.size(); i++) {
				com.chinasofti.entity.Family fa = fas.get(i);
				int offset = 17 + (i * 3);
				fillPdf(bf, s, "fill_" + offset, fa.getFNickname());
				fillPdf(bf, s, "fill_" + (offset + 1), fa.getFName());
				fillPdf(bf, s, "fill_" + (offset + 2), fa.getFCompany());
			}
		}


		Integer annualincome = creditrequest.getAnnualincome();
		fillPdf(bf, s, "fill_29", annualincome == null ? "": annualincome.toString());
		Integer money = creditrequest.getMoney();
		fillPdf(bf, s, "fill_30", money == null ? "" : money.toString());
		fillPdf(bf, s, "fill_31", DateFormatUtils.format(creditrequest.getStarttime(), "yyyy-MM-dd"));
		fillPdf(bf, s, "fill_32", DateFormatUtils.format(creditrequest.getDeadline(), "yyyy-MM-dd"));
		fillPdf(bf, s, "fill_33", creditrequest.getUseType());
		fillPdf(bf, s, "fill_34", creditrequest.getReason());
		fillPdf(bf, s, "fill_1_2", creditrequest.getSchoolidea());
		fillPdf(bf, s, "fill_2_2", creditrequest.getBankidea());
		ps.setFormFlattening(true);
		ps.close();
		reader.close();
		baos.flush();
		baos.close();
		return new ResponseEntity<>(baos.toByteArray(), headers, HttpStatus.CREATED);
	}

	private void fillPdf(BaseFont bf, AcroFields s, String field, String value) {
		s.setFieldProperty(field,"textfont",bf,null);
		s.setFieldProperty(field,"textsize",new Float(10),null);
		try {
			s.setField(field, value == null ? "" : value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("showBaobiao")
	public ModelAndView showBaobiao() {
		return new ModelAndView("admin/request_search_admin_baobiao");
	}
}
