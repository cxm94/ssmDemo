package min.spring.dao;

import java.util.List;

import min.spring.vo.ClassInfo;

public interface ClassInfoMapper {
    int deleteByPrimaryKey(Integer classId);

    int insert(ClassInfo record);

    int insertSelective(ClassInfo record);

    ClassInfo selectByPrimaryKey(Integer classId);

    int updateByPrimaryKeySelective(ClassInfo record);

    int updateByPrimaryKey(ClassInfo record);
    
    //查询所有班级信息
  	List<ClassInfo> findClassInfos();
}