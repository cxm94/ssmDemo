package min.spring;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import min.spring.bean.PageLimit;
import min.spring.dao.StudentInfoMapper;

public class MybaitsTest {
	
	@Test
	public void configTest() throws FileNotFoundException {
		InputStream inputStream = new FileInputStream("E:/studyworkspace/ssmDemo/src/main/java/min/spring/resources/mybatis-config.xml");
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sessionFactory.openSession();
		StudentInfoMapper mapper = sqlSession.getMapper(StudentInfoMapper.class);
		System.out.println(mapper);
//		ApplicationContext context = new ClassPathXmlApplicationContext();
//		context.getBean(PageLimit.class);
	}
}
