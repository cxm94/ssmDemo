package min.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import min.spring.dao.SchoolInfoMapper;
import min.spring.service.SchoolInfoService;
import min.spring.vo.SchoolInfo;
@Service
public class SchoolInfoServiceImpl implements SchoolInfoService{
	@Autowired
	private SchoolInfoMapper schoolInfoMapper;
	
	public void setSchoolInfoMapper(SchoolInfoMapper schoolInfoMapper) {
		this.schoolInfoMapper = schoolInfoMapper;
	}

	@Override
	public List<SchoolInfo> findSchoolInfos() {
		List<SchoolInfo> schoolInfos = schoolInfoMapper.findSchoolInfos();
		return schoolInfos;
	}

}
