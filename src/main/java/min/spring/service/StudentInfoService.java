package min.spring.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import min.spring.vo.StudentInfo;

public interface StudentInfoService {
	//根据查询条件查询学生信息并分页
	List<StudentInfo> findStudentInfosByPage(Map<String, Object> map);
	
	//根据学校查出最大的学生编号
	String findStudentCodeBySchool(String schoolCode); 
	
	 int insert(StudentInfo studentInfo);
	 
	 int deleteByPrimaryKey(String studentCode);
}
