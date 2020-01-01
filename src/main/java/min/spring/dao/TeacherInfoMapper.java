package min.spring.dao;

import java.util.List;

import min.spring.vo.SchoolInfo;
import min.spring.vo.TeacherInfo;

public interface TeacherInfoMapper {
    int deleteByPrimaryKey(String teacherCode);

    int insert(TeacherInfo record);

    int insertSelective(TeacherInfo record);

    TeacherInfo selectByPrimaryKey(String teacherCode);

    int updateByPrimaryKeySelective(TeacherInfo record);

    int updateByPrimaryKey(TeacherInfo record);
    
    //根据学校查询老师信息
  	List<TeacherInfo> findBySchoolCode(String schoolInfo);
}