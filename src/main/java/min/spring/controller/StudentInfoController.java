package min.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import min.spring.bean.PageLimit;
import min.spring.service.ClassInfoService;
import min.spring.service.GradeInfoService;
import min.spring.service.SchoolInfoService;
import min.spring.service.StudentInfoService;
import min.spring.service.TeacherInfoService;
import min.spring.vo.ClassInfo;
import min.spring.vo.GradeInfo;
import min.spring.vo.SchoolInfo;
import min.spring.vo.StudentInfo;
import min.spring.vo.TeacherInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("student")
public class StudentInfoController {
	@Autowired
	private StudentInfoService studentInfoService;
	@Autowired
	private SchoolInfoService schoolInfoService ;
	@Autowired
	private TeacherInfoService teacherInfoService;
	@Autowired
	private GradeInfoService gradeInfoService;
	@Autowired
	private ClassInfoService classInfoService;
	
	/**
	 * 根据查询条件查询学生信息并分页
	 * @param studentInfo
	 * @param pageLimit
	 * @param request
	 * @return
	 */
	@RequestMapping("/findStudentInfoBy")
	public String findStudentInfoBy(StudentInfo studentInfo,PageLimit pageLimit,HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("studentInfo", studentInfo);
		map.put("pageLimit", pageLimit);
		List<StudentInfo> list = studentInfoService.findStudentInfosByPage(map);
		
		request.setAttribute("studentInfos", list);
		request.setAttribute("pageLimit", pageLimit);
		request.setAttribute("studentCode", studentInfo.getStudentCode());
		request.setAttribute("studentName", studentInfo.getStudentName());
		return "/info/studentInfo";
	}
	
	/**
	 * 新增学生页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/addView")
	public String addStudentInfo(HttpServletRequest request) {
		List<SchoolInfo> schoolInfos = schoolInfoService.findSchoolInfos();
		List<GradeInfo> gradeInfos = gradeInfoService.findGradeInfos();
		List<ClassInfo> classInfos = classInfoService.findClassInfos();
		List<TeacherInfo> teacherInfos = teacherInfoService.findBySchoolCode(schoolInfos.get(0).getSchoolCode());
		String studentCode = studentInfoService.findStudentCodeBySchool(schoolInfos.get(0).getSchoolCode());
		request.setAttribute("schoolInfos", schoolInfos);
		request.setAttribute("gradeInfos", gradeInfos);
		request.setAttribute("classInfos", classInfos);
		request.setAttribute("teacherInfos", teacherInfos);
		request.setAttribute("studentCode", studentCode);
		
		
		return "/info/addStudentInfo";
	}
	
	/**
	 * 根据学校查询老师
	 * @param schoolCode
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/findTeacherBySchool")
	@ResponseBody
	public List<Object> findTeacherBySchool(String schoolCode,HttpServletRequest request,HttpServletResponse response) {
		System.out.println(schoolCode);
		List<TeacherInfo> teacherInfos = teacherInfoService.findBySchoolCode(schoolCode);
		String studentCode = studentInfoService.findStudentCodeBySchool(schoolCode);
		List<Object> list = new ArrayList<Object>();
		list.add(studentCode);
		list.add(teacherInfos);
		return list;
	}
	/**
	 * 添加学生
	 * @param studentInfo
	 * @return
	 */
	@RequestMapping("/addStudentInfo")
	public String addStudentInfo(StudentInfo studentInfo) {
		int result = studentInfoService.insert(studentInfo);
		if (result != 0) {
			return "redirect:/student/findStudentInfoBy";
		}
		return "/info/error";
	}
	
	/**
	 *     修改学生页面
	 * @param studentCode
	 * @return
	 */
	@RequestMapping("/updateView")
	public String updateView(String studentCode) {
		System.out.println(studentCode);
		return null;
	}
	
	@RequestMapping("/deleteStudentInfo")
	public String deleteStudentInfo(String studentCode) {
		int result = studentInfoService.deleteByPrimaryKey(studentCode);
		if (result != 0) {
			return "redirect:/student/findStudentInfoBy";
//			return "forward:/student/findStudentInfoBy";
		}
		return "/info/error";
	}
}
