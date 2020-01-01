package min.spring.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import min.spring.dao.StudentInfoMapper;
import min.spring.service.StudentInfoService;
import min.spring.vo.StudentInfo;


@Transactional
public class StudentInfoServiceImpl implements StudentInfoService {
	
	@Autowired
	private StudentInfoMapper studentInfoMapper;
	
	/**
	 * 	根据条件查询学生信息
	 */
	@Override
	public List<StudentInfo> findStudentInfosByPage(Map<String, Object> map) {
		List<StudentInfo> list = studentInfoMapper.findStudentInfosByPage(map);
		return list;
	}

	public void setStudentInfoMapper(StudentInfoMapper studentInfoMapper) {
		this.studentInfoMapper = studentInfoMapper;
	}
	
	/**
	 * 根据学校查询学生编号，并自动生成
	 */
	@Override
	public String findStudentCodeBySchool(String schoolCode) {
		StudentInfo studentInfo = studentInfoMapper.findStudentCodeBySchool(schoolCode);
		String[] studentCode = studentInfo.getStudentCode().split("_");
		int code = Integer.parseInt(studentCode[1]);
		StringBuffer codeBuffer = new StringBuffer();
		codeBuffer.append(schoolCode);
		codeBuffer.append("_");
		codeBuffer.append((code+1));
		System.out.println(codeBuffer.toString());
		return codeBuffer.toString();
	}

	@Override
	public int insert(StudentInfo studentInfo) {
		int result = studentInfoMapper.insert(studentInfo);
		return result;
	}

	@Override
	public int deleteByPrimaryKey(String studentCode) {
		return studentInfoMapper.deleteByPrimaryKey(studentCode);
	}

}
