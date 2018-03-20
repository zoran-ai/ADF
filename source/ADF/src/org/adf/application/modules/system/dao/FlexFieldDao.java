package org.adf.application.modules.system.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.adf.application.common.mybatis.entity.SysFlexFieldDefine;
import org.adf.application.common.mybatis.vo.ColumnVO;
import org.adf.application.common.mybatis.vo.FlexFieldColumnVO;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.framework.mybatis.dao.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("all")
public class FlexFieldDao extends BaseDao {

	public static final String NAMESPACE = "org.adf.application.modules.system.mapper.FlexFieldMapper";
	
	/**
	 * 获取弹性域定义列表
	 */
	public List<SysFlexFieldDefine> getFlexFieldDefineList() throws Exception {
		return selectList(NAMESPACE + "." + "getFlexFieldDefineList");
	}
	
	/**
	 * 获取弹性域字段列表
	 * @param flexCode 弹性域编码
	 */
	public List<FlexFieldColumnVO> getFlexFieldColumnList(String flexCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setFlexCode(flexCode);
		return selectList(NAMESPACE + "." + "getFlexFieldColumnList", qp);
	}
	
	/**
	 * 获取弹性域字段信息
	 * @param flexCode 弹性域编码
	 */
	public FlexFieldColumnVO getFlexFieldColumnInfo(String flexCode, String columnName) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setFlexCode(flexCode);
		qp.setColumnName(columnName);
		return selectOne(NAMESPACE + "." + "getFlexFieldColumnList", qp);
	}
	
	/**
	 * 获取表列表
	 */
	public List<String> getTableList(String schema) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setSchema(schema);
		return selectList(NAMESPACE + "." + "getTableList", qp);
	}
	
	/**
	 * 获取表字段信息列表
	 * @param schema    数据库用户
	 * @param tableName 数据库表
	 */
	public List<String> getAttributeColumnList(String schema, String tableName) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setSchema(schema);
		qp.setTableName(tableName);
		return selectList(NAMESPACE + "." + "getAttributeColumnList", qp);
	}
	
}
