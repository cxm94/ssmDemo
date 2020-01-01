package min.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import min.spring.dao.ClassInfoMapper;
import min.spring.service.ClassInfoService;
import min.spring.vo.ClassInfo;
@Service
public class ClassInfoServiceImpl implements ClassInfoService{
	@Autowired
	private ClassInfoMapper classInfoMapper;
	
	
	public void setClassInfoMapper(ClassInfoMapper classInfoMapper) {
		this.classInfoMapper = classInfoMapper;
	}


	@Override
	public List<ClassInfo> findClassInfos() {
		List<ClassInfo> classInfos = classInfoMapper.findClassInfos();
		return classInfos;
	}

}
