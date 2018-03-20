package org.adf.application.modules.system.dao;

import java.util.List;

import org.adf.application.common.mybatis.entity.SysLovColumn;
import org.adf.application.common.mybatis.entity.SysLovDefine;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.framework.mybatis.dao.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("all")
public class ListOfValueDao extends BaseDao {

	public static final String NAMESPACE = "org.adf.application.modules.system.mapper.ListOfValueMapper";
	
	/**
	 * 获取值列表定义列表
	 */
	public List<SysLovDefine> getLovDefineList() throws Exception {
		return selectList(NAMESPACE + "." + "getLovDefineList");
	}
	
	/**
	 * 获取值列表视图列表
	 */
	public List<String> getLovViewList(String schema) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setSchema(schema);
		return selectList(NAMESPACE + "." + "getLovViewList", qp);
	}
	
	/**
	 * 获取视图字段列表
	 */
	public List<SysLovColumn> getViewColumnList(String schema, String viewName) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setSchema(schema);
		qp.setViewName(viewName);
		return selectList(NAMESPACE + "." + "getViewColumnList", qp);
	}
	
	/**
	 * 获取值列表字段列表
	 */
	public List<SysLovColumn> getLovColumnList(String schema, String viewName, String lovCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setSchema(schema);
		qp.setViewName(viewName);
		qp.setLovCode(lovCode);
		return selectList(NAMESPACE + "." + "getLovColumnList", qp);
	}
	
	/**
	 * 删除当前值列表的字段列表
	 */
	public int removeLovColumnList(String lovCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setLovCode(lovCode);
		return delete(NAMESPACE + "." + "removeLovColumnList", lovCode);
	}
	
}
