package min.spring.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;


import min.spring.bean.PageLimit;
/**
 * mybatis拦截器
 * 拦截StatementHandler类中的prepare方法
 *	
 *3个方法的执行顺序 setProperties-->plugin-->intercept
 */
@Intercepts(@Signature(type=StatementHandler.class,method="prepare",args= {Connection.class}))
public class PageInterceptor implements Interceptor {

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		StatementHandler StatementHandler = (StatementHandler) invocation.getTarget();
		//mybatis封装好的反射
		MetaObject metaObject = MetaObject.forObject(StatementHandler, SystemMetaObject.DEFAULT_OBJECT_FACTORY, SystemMetaObject.DEFAULT_OBJECT_WRAPPER_FACTORY);
		MappedStatement mappedStatement = (MappedStatement)metaObject.getValue("delegate.mappedStatement");
		//配置文件中sql的id
		String id = mappedStatement.getId();
		if (id.matches(".+ByPage$")) {
			BoundSql boundSql  = StatementHandler.getBoundSql();
			//原始的sql
			String sql = boundSql.getSql();
			//查询总条数的sql,需要自己直接这条sql
			String countSql = "select count(1) from ("+sql+") a";
			Connection conn = (Connection)invocation.getArgs()[0];
			PreparedStatement statement =  conn.prepareStatement(countSql);
			//获取参数
//			ParameterHandler parameterHandler = (ParameterHandler)metaObject.getValue("delegate.parameterHandler");
			ParameterHandler parameterHandler = StatementHandler.getParameterHandler();
			//传入参数
			parameterHandler.setParameters(statement);
			ResultSet rs =  statement.executeQuery();
			
			Map<String, Object> map = (Map<String, Object>)boundSql.getParameterObject();
			PageLimit pageLimit = (PageLimit) map.get("pageLimit");
			if (rs.next()) {
				pageLimit.setTotalNumber(rs.getInt(1));
			}
			//改造后的sql
			String pageSql = sql + " limit " +pageLimit.getDbIndex()+","+pageLimit.getDbNumber();
			//使用metaObject.setValue将不可以修改的值修改
			metaObject.setValue("delegate.boundSql.sql", pageSql);
		}
		return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		//过滤需要代理的对象，返回的是原对象不会改变，返回代理对象就会去调用intercept方法
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		// TODO Auto-generated method stub
		String name = properties.get("test").toString();
		System.out.println(name);

	}

}
