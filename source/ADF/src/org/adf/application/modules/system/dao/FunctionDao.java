package org.adf.application.modules.system.dao;

import java.util.List;

import org.adf.application.common.mybatis.entity.SysFunction;
import org.adf.application.common.mybatis.entity.SysOperation;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.framework.mybatis.dao.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("all")
public class FunctionDao extends BaseDao {

	public static final String NAMESPACE = "org.adf.application.modules.system.mapper.FunctionMapper";
	
	/**
	 * 获取功能列表
	 */
	public List<SysFunction> getFunctionList() throws Exception {
		return selectList(NAMESPACE + "." + "getFunctionList");
	}
	
	/**
	 * 获取操作列表
	 */
	public List<SysOperation> getOperationList(String functionCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setFunctionCode(functionCode);
		return selectList(NAMESPACE + "." + "getOperationList", qp);
	}
	
}
