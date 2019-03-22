package com.chinasofti.controller;

import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.read.context.AnalysisContext;
import com.alibaba.excel.read.event.AnalysisEventListener;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.chinasofti.constant.EnumAuditRuleType;
import com.chinasofti.entity.Creditrequest;
import com.chinasofti.entity.Family;
import com.chinasofti.entity.School;
import com.chinasofti.mapping.CreditrequestDao;
import com.chinasofti.mapping.FamilyDao;
import com.chinasofti.mapping.SchoolDao;
import com.chinasofti.mapping.StudentDao;
import com.chinasofti.service.AuditService;
import com.chinasofti.service.BankManageService;
import com.chinasofti.service.StudentService;
import com.chinasofti.vo.BankManage;
import com.chinasofti.vo.CreditRequestParam;
import com.chinasofti.vo.Student;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("student")
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private BankManageService bankManageService;

	@Autowired
	private StudentDao studentDao;

	@Autowired
	private SchoolDao schoolDao;

	@Autowired
	private CreditrequestDao creditrequestDao;

	@Autowired
	private FamilyDao familyDao;

	@Autowired
	private AuditService auditService;

	// 登录
	@RequestMapping("login")
	public ModelAndView login(String s_id, String s_pwd, HttpSession session) throws IOException {
		int flag = studentService.login(s_id, s_pwd);// 0不可登录，1可登录，2用户名或密码错误
		System.out.println(s_id + "," + s_pwd + "," + flag);
		if (flag == 0) {
			ModelAndView modelAndView = new ModelAndView("login");// 返回登录页面
			modelAndView.addObject("message", "登录失败！请重新登录");
			return modelAndView;
		} else if (flag == 1) {
			ModelAndView modelAndView = new ModelAndView("redirect:/student/home_student");
			String s_name = studentService.getName(s_id);
			session.setAttribute("s_name", s_name);
			session.setAttribute("s_id", s_id);
			System.out.println("StudentController.java 登录--" + session.getAttribute("s_name"));
			return modelAndView;
		}
		return null;
	}

	@RequestMapping("home_student")
	public ModelAndView home_student() {
		return new ModelAndView("student/home_student");
	}



	// 管理员端
	// 显示所有学生用户
	@RequestMapping("showAllStudent")
	public ModelAndView showList(HttpSession session) {
		ArrayList<Student> student = studentService.showAllStudent();
		ModelAndView mav = new ModelAndView("admin/user_student_admin");
		mav.addObject("all", student);
		System.out.println("StudentController.java 显示所有学生用户");
		return mav;
	}

	// 显示学生用户详细资料
	@RequestMapping("showStudentDetail_admin")
	public ModelAndView showStudentDetail_admin(HttpSession session, String s_id) {
		Student student = studentService.showStudentById(s_id);
		ModelAndView mav = new ModelAndView("admin/user_student_check_admin");
		mav.addObject("student", student);
		List<School> schools = schoolDao.selectAll();
		mav.addObject("all", schools);
		System.out.println("StudentController.java 显示" + s_id + "的个人资料");
		return mav;
	}

	// 根据关键字keyword查询学生用户-管理员
	@RequestMapping("search_admin")
	@ResponseBody
	public ModelAndView search_admin(String keyword) {
		ArrayList<Student> student = studentService.findStudentByKeyWord(keyword);
		ModelAndView modelAndView = new ModelAndView("admin/user_student_admin");
		modelAndView.addObject("all", student);
		System.out.println("StudentController.java 根据关键字keyword:" + keyword + "  查询用户");
		return modelAndView;
	}
	
	// 管理员删除用户
	@RequestMapping("delete_admin")
	public ModelAndView delete_admin(HttpSession session, String s_id) {
		studentService.delete_admin(s_id);
		ArrayList<Student> student = studentService.showAllStudent();
		ModelAndView mav = new ModelAndView("admin/user_student_admin");
		mav.addObject("all", student);
		System.out.println("StudentController.java 删除学生用户 s_id:"+s_id);
		return mav;
	}

	// 学生端
	// 显示个人资料
	@RequestMapping("showStudent_student")
	public ModelAndView showStudent_student(HttpSession session, String s_id) {
		Student student = studentService.showStudentById(s_id);
		ModelAndView mav = new ModelAndView("student/personal_basic_student");
		mav.addObject("student", student);
		System.out.println("StudentController.java 显示" + s_id + "的个人资料");
		return mav;
	}

	// 学校端
	// 显示本校的所有学生
	@RequestMapping("showAllStudent_schoolmanage")
	public ModelAndView showAllStudent_schoolmanage(HttpSession session, String sm_id) {
		ArrayList<Student> student = studentService.showAllStudent_schoolmanage(sm_id);
		ModelAndView mav = new ModelAndView("schoolmanage/personal_studentbasic_schoolmanage");
		mav.addObject("all", student);
		System.out.println("StudentController.java 显示所有学生用户");
		return mav;
	}

	// 显示学生详细资料
	@RequestMapping("showStudentDetail_schoolmanage")
	public ModelAndView showStudentDetail_schoolmanage(HttpSession session, String s_id) {
		Student student = studentService.showStudentById(s_id);
		ModelAndView mav = new ModelAndView("schoolmanage/personal_studentbasic_check_schoolmanage");
		mav.addObject("student", student);
		System.out.println("StudentController.java 显示" + s_id + "的个人资料");
		return mav;
	}

	// 银行端
	// 显示在本银行申请过贷款的所有学生用户
	@RequestMapping("showAllStudent_bankmanage")
	public ModelAndView showAllStudent_bankmanage(HttpSession session, String bm_id) {
		BankManage bankManage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankManage.getBm_bank();
		ArrayList<Student> student = studentService.showAllStudent_bankmanage(bm_bank);
		ModelAndView mav = new ModelAndView("bankmanage/personal_studentbasic_bankmanage");
		mav.addObject("all", student);
		System.out.println("StudentController.java 显示所有学生用户");
		return mav;
	}

	// 显示学生详细资料
	@RequestMapping("showStudentDetail_bankmanage")
	public ModelAndView showStudentDetail_bankmanage(HttpSession session, String s_id) {
		Student student = studentService.showStudentById(s_id);
		ModelAndView mav = new ModelAndView("bankmanage/personal_studentbasic_check_bankmanage");
		mav.addObject("student", student);
		System.out.println("StudentController.java 显示" + s_id + "的个人资料");
		return mav;
	}

	// 根据关键字keyword查询在本银行申请过贷款的所有学生用户-银行
	@RequestMapping("search_bankmanage")
	@ResponseBody
	public ModelAndView search_bankmanage(HttpSession session, String keyword) {
		String bm_id =  (String)session.getAttribute("bm_id");
		BankManage bankManage = bankManageService.showBankManageById(bm_id);
		String bm_bank = bankManage.getBm_bank();
		ArrayList<Student> student = studentService.findStudentByKeyWord_bankmanage(keyword,bm_bank);
		ModelAndView modelAndView = new ModelAndView("bankmanage/personal_studentbasic_bankmanage");
		modelAndView.addObject("all", student);
		System.out.println("StudentController.java 根据关键字keyword:" + keyword + "  查询用户");
		return modelAndView;
	}

	// 根据关键字keyword查询在本银行申请过贷款的所有学生用户-银行
	@RequestMapping("modifyProfile")
	public ModelAndView modifyProfile(HttpServletRequest request, HttpSession session) {
		String s_address = ServletRequestUtils.getStringParameter(request, "s_address", "");
		String s_phone = ServletRequestUtils.getStringParameter(request, "s_phone", "");
		String s_qq = ServletRequestUtils.getStringParameter(request, "s_qq", "");
		String s_email = ServletRequestUtils.getStringParameter(request, "s_email", "");
		String s_id = (String)session.getAttribute("s_id");
		studentService.modifyStudent(s_id, s_address, s_phone, s_qq, s_email);
		ModelAndView modelAndView = new ModelAndView("redirect:/student/showStudent_student?s_id=" + s_id);
		return modelAndView;
	}

	@RequestMapping("addStudent")
	public ModelAndView addStudent(com.chinasofti.entity.Student student) {
		// Map<String, String[]> parameterMap = request.getParameterMap();
		// System.out.println(parameterMap);
		studentDao.insert(student);
		ModelAndView modelAndView = new ModelAndView("redirect:/student/showAllStudent");
		return modelAndView;
	}

	@RequestMapping("modifyStudent")
	public ModelAndView modifyStudent(com.chinasofti.entity.Student student) {
		// Map<String, String[]> parameterMap = request.getParameterMap();
		// System.out.println(parameterMap);
		studentDao.updateByPrimaryKeySelective(student);
		ModelAndView modelAndView = new ModelAndView("redirect:/student/showAllStudent");
		return modelAndView;
	}

	@RequestMapping("student_credit_request")
	public ModelAndView student_credit_request(HttpSession session) {
		// Map<String, String[]> parameterMap = request.getParameterMap();
		// System.out.println(parameterMap);
		com.chinasofti.entity.Student st = studentDao.selectByPrimaryKey(session.getAttribute("s_id"));

		ModelAndView modelAndView = new ModelAndView("student/student_credit_request");
		modelAndView.addObject("s",st);
		return modelAndView;
	}

	@RequestMapping("addRequestInfos")
	public ModelAndView addRequestInfos(CreditRequestParam param){
		System.out.println("管理员开始添加申请信息");
		ModelAndView modelAndView = new ModelAndView("redirect:/creditrequest/showAllRequest_student?s_id=" + param.getS().getSId());
		Creditrequest c = param.getC();
		c.setBId("102100020331");
		c.setSId(param.getS().getSId());
		java.util.Date now = new java.util.Date();
		c.setRequestdate(now);
		c.setFlag(1);
		creditrequestDao.insertUseGeneratedKeys(c);

		Family f = new Family();
		f.setSId(param.getS().getSId());
		familyDao.delete(f);

		if(param.getF1().getFNickname() != null && param.getF1().getFNickname() != ""){
			param.getF1().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF1());
		}
		if(param.getF2().getFNickname() != null && param.getF2().getFNickname() != ""){
			param.getF2().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF2());
		}
		if(param.getF3().getFNickname() != null && param.getF3().getFNickname() != ""){
			param.getF3().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF3());
		}
		if(param.getF4().getFNickname() != null && param.getF4().getFNickname() != ""){
			param.getF4().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF4());
		}
		if(param.getF5().getFNickname() != null && param.getF5().getFNickname() != ""){
			param.getF5().setSId(param.getS().getSId());
			familyDao.insertUseGeneratedKeys(param.getF5());
		}

		List<Family> families = new ArrayList<>();
		families.add(param.getF1());
		families.add(param.getF2());
		families.add(param.getF3());
		families.add(param.getF4());
		auditService.autoAudit(EnumAuditRuleType.school, c, param.getS(), families, null, null);
		return modelAndView;
	}

    @RequestMapping(value="/upload",method={RequestMethod.POST,RequestMethod.GET})
    public ModelAndView updateItems(MultipartFile file) throws Exception {
		String originalFilename = file.getOriginalFilename();
		System.out.println(originalFilename);
		InputStream is = file.getInputStream();
        try {
            ExcelReader reader = new ExcelReader(is, ExcelTypeEnum.XLSX, null,
                    new AnalysisEventListener<List<String>>() {
                        @Override
                        public void invoke(List<String> object, AnalysisContext context) {
                        	if(context.getCurrentRowNum() == 0) {
								return;
							}
							com.chinasofti.entity.Student s = new com.chinasofti.entity.Student();
							s.setSId(object.get(0));
							s.setSPwd(object.get(1));
							s.setSName(object.get(2));
							s.setSGender(object.get(3));
							s.setSMajor(object.get(4));
							s.setSClass(object.get(5));
							s.setSAge(Integer.parseInt(object.get(6)));
							s.setSSchool("10003");
							s.setSLoginflag(1);
							s.setSCreditflag(3);
							Date birth = new Date();
							try {
								birth = DateUtils.parseDate(object.get(7), "yyyy-MM-dd", "yyyy/MM/dd");
							} catch (ParseException e) {
								e.printStackTrace();
							}
							s.setSBirth(birth);
							s.setSPoliticalstatus(object.get(8));
							s.setSNation(object.get(9));
							s.setSNativeplace(object.get(10));
							s.setSAddress(object.get(11));
							s.setSPhone(object.get(12));
							s.setSEmail(object.get(13));
							s.setSIdcard(object.get(14));
							s.setSPostalcode(object.get(15));
							s.setSQq(object.get(16));

							studentDao.insert(s);
                        }
                        @Override
                        public void doAfterAllAnalysed(AnalysisContext context) {

                        }
                    });

            reader.read();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(is);
        }
        return new ModelAndView("redirect:/student/showAllStudent");
    }

	@RequestMapping(value="/download")
	public ResponseEntity<byte[]> download() throws IOException {
		Resource resource = new ClassPathResource("student.xlsx");
		InputStream is = resource.getInputStream();
		HttpHeaders headers = new HttpHeaders();
		String fileName=new String("学生列表.xlsx".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		return new ResponseEntity<>(IOUtils.toByteArray(is), headers, HttpStatus.CREATED);
	}
}
