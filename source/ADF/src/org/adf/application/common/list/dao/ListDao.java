package org.adf.application.common.list.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.adf.application.common.mybatis.entity.SysDataDictItem;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.framework.mybatis.dao.BaseDao;

@Repository
@SuppressWarnings("all")
public class ListDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.list.mapper.ListMapper";

    /**
	 * 根据一个数据字典类型获取数据字典项列表
	 */
	public List<SysDataDictItem> getSingleDataDictItemList(String typeCode,
			String enabledFlag) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setCode(typeCode);
		qp.setEnabled_flag(enabledFlag);
		return selectList(NAMESPACE + "." + "getSingleDataDictItemList", qp);
	}
	
	/**
	 * 根据多个数据字典类型获取数据字典项列表
	 */
	public List<SysDataDictItem> getMultiDataDictItemList(String typeCodes,
			String enabledFlag) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setCode(typeCodes);
		qp.setEnabled_flag(enabledFlag);
		return selectList(NAMESPACE + "." + "getMultiDataDictItemList", qp);
	}

}