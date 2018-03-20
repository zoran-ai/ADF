package org.adf.framework.mybatis.generate.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.adf.application.common.mybatis.vo.ColumnVO;
import org.adf.application.common.mybatis.vo.PKColumnVO;
import org.adf.framework.mybatis.dao.BaseDao;
import org.springframework.stereotype.Repository;


@Repository
@SuppressWarnings("all")
public class MyBatisDao extends BaseDao {
	
	public static final String NAMESPACE = "org.adf.framework.mybatis.generate.mapper.MyBatisMapper";
	
	/**
	 * 获取表字段信息列表
	 * @param tableSchema 数据库用户
	 * @param tableName   数据库表
	 */
	public List<ColumnVO> getColumnList(String tableSchema, String tableName) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tableSchema", tableSchema);
		map.put("tableName", tableName);
		return selectList(NAMESPACE + "." + "getColumnList", map);
	}
	
	/**
	 * 获取表主键约束字段列表
	 * @param tableSchema 数据库用户
	 * @param tableName   数据库表
	 */
	public List<PKColumnVO> getPKColumnList(String tableSchema, String tableName) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tableSchema", tableSchema);
		map.put("tableName", tableName);
		return selectList(NAMESPACE+ "." + "getPKColumnList", map);
	}
	
}
