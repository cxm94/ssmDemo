package min.spring.dao;

import java.util.List;
import java.util.Map;

import min.spring.vo.StudentInfo;

public interface StudentInfoMapper {
    int deleteByPrimaryKey(String studentCode);

    int insert(StudentInfo record);

    int insertSelective(StudentInfo record);

    StudentInfo selectByPrimaryKey(String studentCode);

    int updateByPrimaryKeySelective(StudentInfo record);

    int updateByPrimaryKey(StudentInfo record);
    
    //根据查询条件查询学生信息并分页
    List<StudentInfo> findStudentInfosByPage(Map<String, Object> map);
    
    //根据学校查出最大的学生编号
  	StudentInfo findStudentCodeBySchool(String schoolCode); 
}