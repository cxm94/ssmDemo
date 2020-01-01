package min.spring.dao;

import java.util.List;

import min.spring.vo.GradeInfo;

public interface GradeInfoMapper {
    int deleteByPrimaryKey(Integer gradeId);

    int insert(GradeInfo record);

    int insertSelective(GradeInfo record);

    GradeInfo selectByPrimaryKey(Integer gradeId);

    int updateByPrimaryKeySelective(GradeInfo record);

    int updateByPrimaryKey(GradeInfo record);
  //查询所有年级信息
  	List<GradeInfo> findGradeInfos();
}