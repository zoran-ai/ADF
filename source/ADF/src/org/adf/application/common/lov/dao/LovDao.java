package org.adf.application.common.lov.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import org.adf.application.common.mybatis.entity.SysLovColumn;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.framework.mybatis.dao.BaseDao;

@Repository
@SuppressWarnings("all")
public class LovDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.lov.mapper.LovMapper";

	/**
	 * 获取值列表字段列表
	 */
	public List<SysLovColumn> getLovColumnList(String schema, String lovCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setSchema(schema);
		qp.setLovCode(lovCode);
		return selectList(NAMESPACE + "." + "getLovColumnList", qp);
	}
	
	/**
	 * 获取值列表视图SQL
	 */
	public String getLovViewSQL(String schema, String lovCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setSchema(schema);
		qp.setLovCode(lovCode);
		return selectOne(NAMESPACE + "." + "getLovViewSQL", qp);
	}
	
	/**
	 * 获取值列表数据列表
	 */
	public List<Map<String, Object>> getLovDataList(String sql) throws Exception {
		return this.selectList(NAMESPACE + "." + "getLovDataList", sql);
	}

}