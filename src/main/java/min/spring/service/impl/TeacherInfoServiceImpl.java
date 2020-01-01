package min.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import min.spring.dao.TeacherInfoMapper;
import min.spring.service.TeacherInfoService;
import min.spring.vo.SchoolInfo;
import min.spring.vo.TeacherInfo;

@Service
public class TeacherInfoServiceImpl implements TeacherInfoService {
	
	@Autowired
	private TeacherInfoMapper teacherInfoMapper;
	
	
	public void setTeacherInfoMapper(TeacherInfoMapper teacherInfoMapper) {
		this.teacherInfoMapper = teacherInfoMapper;
	}


	@Override
	public List<TeacherInfo> findBySchoolCode(String schoolInfo) {
		List<TeacherInfo> teacherInfos = teacherInfoMapper.findBySchoolCode(schoolInfo);
		return teacherInfos;
	}

}
