package min.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import min.spring.dao.GradeInfoMapper;
import min.spring.service.GradeInfoService;
import min.spring.vo.GradeInfo;

@Service
public class GradeInfoServiceImpl implements GradeInfoService {
	
	@Autowired
	private GradeInfoMapper gradeInfoMapper;
	
	
	public void setGradeInfoMapper(GradeInfoMapper gradeInfoMapper) {
		this.gradeInfoMapper = gradeInfoMapper;
	}


	@Override
	public List<GradeInfo> findGradeInfos() {
		List<GradeInfo> gradeInfos = gradeInfoMapper.findGradeInfos();
		return gradeInfos;
	}

}
