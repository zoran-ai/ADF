package org.adf.framework.mybatis.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * BaseDAO，所有的DAO需要继承此类
 */
@Repository
@SuppressWarnings("all")
public class BaseDao {
	
	@Resource
	private SqlSessionTemplate session;

	public int insert(String statement, Object parameter) throws Exception {
		return session.insert(statement, parameter);
	}

	public int update(String statement, Object parameter) throws Exception {
		return session.update(statement, parameter);
	}

	public int delete(String statement, Object parameter) throws Exception {
		return session.delete(statement, parameter);
	}

	public <T> T selectOne(String statement, Object parameter) throws Exception {
		return session.selectOne(statement, parameter);
	}
	
	public <E> List<E> selectList(String statement)
			throws Exception {
		return session.selectList(statement);
	}
	
	public <E> List<E> selectList(String statement, Object parameter)
			throws Exception {
		MappedStatement ms = session.getConfiguration().getMappedStatement(statement);
		BoundSql bs = ms.getBoundSql(parameter);
		
		return session.selectList(statement, parameter);
	}

	public <E> List<E> selectList(String statement, Object parameter,
			int offset, int limit) throws Exception {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList(statement, parameter, rowBounds);
	}

	public <K, V> Map<K, V> selectMap(String statement, Object parameter,
			String mapKey) throws Exception {
		return session.selectMap(statement, parameter, mapKey);
	}

	public <K, V> Map<K, V> selectMap(String statement, Object parameter,
			String mapKey, int offset, int limit) throws Exception {
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectMap(statement, parameter, mapKey, rowBounds);
	}

}
