package min.spring.dao;

import java.util.List;

import min.spring.vo.SchoolInfo;

public interface SchoolInfoMapper {
    int deleteByPrimaryKey(String schoolCode);

    int insert(SchoolInfo record);

    int insertSelective(SchoolInfo record);

    SchoolInfo selectByPrimaryKey(String schoolCode);

    int updateByPrimaryKeySelective(SchoolInfo record);

    int updateByPrimaryKey(SchoolInfo record);
    //查询所有学校信息
    List<SchoolInfo> findSchoolInfos();
}