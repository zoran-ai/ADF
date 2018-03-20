package org.adf.application.common.lot.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import org.adf.application.common.mybatis.entity.SysLovColumn;
import org.adf.application.common.mybatis.vo.QueryParameter;
import org.adf.application.common.mybatis.vo.TreeNodeVO;
import org.adf.framework.mybatis.dao.BaseDao;

@Repository
@SuppressWarnings("all")
public class LotDao extends BaseDao {

    public static final String NAMESPACE = "org.adf.application.common.lot.mapper.LotMapper";

    /**
	 * 获取树列表
	 * @param structCode 数据结构编码
	 * @param parentCode 父节点编码
	 */
	public List<TreeNodeVO> getTreeList(String structCode, String parentCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		qp.setParentCode(parentCode);
		return this.selectList(NAMESPACE + "." + "getTreeList", qp);
	}
	
	/**
	 * 获取树列表节点显示文本
	 * @param structCode 数据结构编码
	 * @param nodeCode   节点编码
	 */
	public String getTreeDisplayText(String structCode, String nodeCode) throws Exception {
		QueryParameter qp = new QueryParameter();
		qp.setStructCode(structCode);
		qp.setNodeCode(nodeCode);
		return this.selectOne(NAMESPACE + "." + "getTreeDisplayText", qp);
	}

}