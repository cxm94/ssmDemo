package min.spring.service;

import java.util.List;

import min.spring.vo.SchoolInfo;

public interface SchoolInfoService {
	//查询所有学校信息
	List<SchoolInfo> findSchoolInfos();
}
