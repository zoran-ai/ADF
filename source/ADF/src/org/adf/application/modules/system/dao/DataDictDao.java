package org.adf.application.modules.system.dao;

import java.util.List;

import org.adf.application.common.mybatis.entity.SysDataDictItem;
import org.adf.application.common.mybatis.entity.SysDataDictType;
import org.adf.application.common.mybatis.vo.DataDictTypeAttributeVO;
import org.adf.application.common.mybatis.vo.DataDictItemAttributeVO;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.framework.mybatis.dao.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("all")
public class DataDictDao extends BaseDao {

	public static final String NAMESPACE = "org.adf.application.modules.system.mapper.DataDictMapper";
	
	/**
	 * 获取数据字典类型列表
	 */
	public List<SysDataDictType> getDataDictTypeList() throws Exception {
        return selectList(NAMESPACE + "." + "getDataDictTypeList");
    }
	
	/**
	 * 获取数据字典项列表
	 */
	public List<SysDataDictItem> getDataDictItemList(String typeCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setCode(typeCode);
        return selectList(NAMESPACE + "." + "getDataDictItemList", qp);
    }
	
	/**
	 * 获取数据字典类型属性列表
	 */
	public List<DataDictTypeAttributeVO> getDataDictTypeAttributeList(String typeCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setCode(typeCode);
        return selectList(NAMESPACE + "." + "getDataDictTypeAttributeList", qp);
    }
	
	/**
	 * 获取数据字典类型属性信息
	 */
	public DataDictTypeAttributeVO getDataDictTypeAttributeInfo(String typeCode, String attributeCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setTypeCode(typeCode);
		qp.setAttributeCode(attributeCode);
        return selectOne(NAMESPACE + "." + "getDataDictTypeAttributeInfo", qp);
    }
	
	/**
	 * 获取数据字典项属性列表
	 */
	public List<DataDictItemAttributeVO> getDataDictItemAttributeList(
			String typeCode, String itemCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setTypeCode(typeCode);
		qp.setItemCode(itemCode);
        return selectList(NAMESPACE + "." + "getDataDictItemAttributeList", qp);
    }
	
}
