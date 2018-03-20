package org.adf.application.modules.system.dao;

import java.util.List;

import org.adf.application.common.mybatis.entity.SysDataDictItem;
import org.adf.application.common.mybatis.entity.SysDataDictType;
import org.adf.application.common.mybatis.vo.DataDictTypeAttributeVO;
import org.adf.application.common.mybatis.vo.DataDictItemAttributeVO;
import org.adf.application.common.mybatis.vo.DataStructAttributeVO;
import org.adf.application.common.mybatis.vo.DataStructDefineVO;
import org.adf.application.common.mybatis.vo.DataStructNodeAttributeVO;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.application.common.mybatis.vo.TreeNodeVO;
import org.adf.framework.mybatis.dao.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("all")
public class DataStructDao extends BaseDao {

	public static final String NAMESPACE = "org.adf.application.modules.system.mapper.DataStructMapper";
	
	/**
	 * 获取数据结构定义列表
	 */
	public List<DataStructDefineVO> getDataStructDefineList() throws Exception {
		return selectList(NAMESPACE + "." + "getDataStructDefineList");
	}
	
	/**
	 * 获取数据结构属性列表
	 * @param structCode 数据结构编码
	 */
	public List<DataStructAttributeVO> getDataStructAttributeList(String structCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		return selectList(NAMESPACE + "." + "getDataStructAttributeList", qp);
	}
	
	/**
	 * 获取数据结构属性信息
	 * @param structCode    数据结构编码
	 * @param attributeCode 数据结构属性编码
	 */
	public DataStructAttributeVO getDataStructAttributeInfo(String structCode, String attributeCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		qp.setAttributeCode(attributeCode);
		return selectOne(NAMESPACE + "." + "getDataStructAttributeInfo", qp);
	}
	
	/**
	 * 获取树状菜单列表
	 * @param structCode 数据结构编码
	 * @param parentCode 父节点编码
	 */
	public List<TreeNodeVO> getDataStructNodeTree(String structCode, String parentCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		qp.setParentCode(parentCode);
		return this.selectList(NAMESPACE + "." + "getDataStructNodeTree", qp);
	}
	
	/**
	 * 获取数据结构节点编码
	 * @param structCode 数据结构编码
	 * @param parentCode 父节点编码
	 * @param nodeLength 节点长度
	 */
	public String getDataStructNodeCode(String structCode, String parentCode, String nodeLength) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		qp.setParentCode(parentCode);
		qp.setLength(nodeLength);
		return this.selectOne(NAMESPACE + "." + "getDataStructNodeCode", qp);
	}
	
	/**
	 * 获取数据结构节点属性列表
	 */
	public List<DataStructNodeAttributeVO> getDataStructNodeAttributeList(
			String structCode, String nodeCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		qp.setNodeCode(nodeCode);
        return selectList(NAMESPACE + "." + "getDataStructNodeAttributeList", qp);
    }
	
}
