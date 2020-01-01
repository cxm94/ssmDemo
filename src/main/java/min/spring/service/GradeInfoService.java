package min.spring.service;

import java.util.List;

import min.spring.dao.GradeInfoMapper;
import min.spring.vo.GradeInfo;

public interface GradeInfoService {
	
	
	//查询所有年级信息
	List<GradeInfo> findGradeInfos();
}
