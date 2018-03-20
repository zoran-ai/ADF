package org.adf.application.modules.security.dao;

import java.util.List;

import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.application.common.mybatis.vo.TreeNodeVO;
import org.adf.framework.mybatis.dao.BaseDao;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings("all")
public class SecurityDao extends BaseDao {

	public static final String NAMESPACE = "org.adf.application.modules.security.mapper.SecurityMapper";
	
	/**
	 * 获取手风琴菜单列表
	 * @param structCode            数据结构编码
	 * @param functionAttributeCode 功能扩展属性编码
	 * @param iconAttributeCode     图标扩展属性编码
	 * @param userId                当前用户ID
	 */
	public List<TreeNodeVO> getAccordionMenuList(String structCode,
			String functionAttributeCode, String iconAttributeCode,
			String userId) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		qp.setFunctionAttributeCode(functionAttributeCode);
		qp.setIconAttributeCode(iconAttributeCode);
		qp.setUserId(userId);
		return this.selectList(NAMESPACE + "." + "getAccordionMenuList", qp);
	}
	
	/**
	 * 获取树状菜单列表
	 * @param structCode            数据结构编码
	 * @param parentCode            父菜单编码
	 * @param functionAttributeCode 功能扩展属性编码
	 * @param iconAttributeCode     图标扩展属性编码
	 * @param userId                当前用户ID
	 */
	public List<TreeNodeVO> getTreeMenuList(String structCode,
			String parentCode, String functionAttributeCode,
			String iconAttributeCode, String userId) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		qp.setParentCode(parentCode);
		qp.setFunctionAttributeCode(functionAttributeCode);
		qp.setIconAttributeCode(iconAttributeCode);
		qp.setUserId(userId);
		return this.selectList(NAMESPACE + "." + "getTreeMenuList", qp);
	}
	
}
