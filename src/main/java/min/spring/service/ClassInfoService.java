package min.spring.service;

import java.util.List;

import min.spring.vo.ClassInfo;

public interface ClassInfoService {
	//查询所有班级信息
	List<ClassInfo> findClassInfos();
}
