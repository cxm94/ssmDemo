package min.spring.service;

import java.util.List;

import min.spring.vo.SchoolInfo;
import min.spring.vo.TeacherInfo;

public interface TeacherInfoService {
	//根据学校查询老师信息
	public List<TeacherInfo> findBySchoolCode(String schoolInfo);
}
