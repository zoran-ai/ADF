package org.adf.application.modules.system.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.mybatis.dao.SysDataStructAttributeDao;
import org.adf.application.common.mybatis.dao.SysDataStructDefineDao;
import org.adf.application.common.mybatis.dao.SysDataStructNodeAttributeDao;
import org.adf.application.common.mybatis.dao.SysDataStructNodeDao;
import org.adf.application.common.mybatis.entity.SysDataDictItemAttribute;
import org.adf.application.common.mybatis.entity.SysDataStructAttribute;
import org.adf.application.common.mybatis.entity.SysDataStructDefine;
import org.adf.application.common.mybatis.entity.SysDataStructNode;
import org.adf.application.common.mybatis.entity.SysDataStructNodeAttribute;
import org.adf.application.common.mybatis.vo.DataStructAttributeVO;
import org.adf.application.common.mybatis.vo.DataStructDefineVO;
import org.adf.application.common.mybatis.vo.DataStructNodeAttributeVO;
import org.adf.application.common.mybatis.vo.TreeNodeVO;
import org.adf.application.modules.system.dao.DataStructDao;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.util.tree.TreeNode;
import org.adf.framework.util.tree.TreeNodeData;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class DataStructService {

	@Resource
	private DataStructDao dataStructDao;
	
	@Resource
	private SysDataStructDefineDao dsdDao;
	
	@Resource
	private SysDataStructAttributeDao dsaDao;
	
	@Resource
	private SysDataStructNodeDao dsnDao;
	
	@Resource
	private SysDataStructNodeAttributeDao dsnaDao;
	
	/**
	 * 获取数据结构定义列表
	 */
	public List<DataStructDefineVO> getDataStructDefineList() throws Exception {
		return dataStructDao.getDataStructDefineList();
	}
	
	/**
	 * 获取数据结构定义信息
	 * @param structCode 数据结构编码
	 */
	public SysDataStructDefine getDataStructDefineInfo(String structCode) throws Exception {
		SysDataStructDefine dsd = new SysDataStructDefine();
		dsd.setStruct_code(structCode);
		return dsdDao.selectSysDataStructDefineByPk(dsd);
	}
	
	/**
	 * 新建数据结构定义
	 */
	public void addDataStructDefine(SysDataStructDefine dsd) throws Exception {
		dsdDao.insertSysDataStructDefine(dsd);
	}
	
	/**
	 * 编辑数据结构定义
	 */
	public void editDataStructDefine(SysDataStructDefine dsd) throws Exception {
		dsdDao.updateSysDataStructDefine(dsd);
	}
	
	/**
	 * 获取数据结构属性列表
	 * @param structCode 数据结构编码
	 */
	public List<DataStructAttributeVO> getDataStructAttributeList(String structCode) throws Exception {
		return dataStructDao.getDataStructAttributeList(structCode);
	}
	
	/**
	 * 获取数据结构属性信息
	 * @param structCode    数据结构编码
	 * @param attributeCode 数据结构属性编码
	 */
	public DataStructAttributeVO getDataStructAttributeInfo(String structCode, String attributeCode) throws Exception {
		return dataStructDao.getDataStructAttributeInfo(structCode, attributeCode);
	}
	
	/**
	 * 新建数据结构属性
	 */
	public void addDataStructAttribute(SysDataStructAttribute dsa) throws Exception {
		dsaDao.insertSysDataStructAttribute(dsa);
	}
	
	/**
	 * 编辑数据结构属性
	 */
	public void editDataStructAttribute(SysDataStructAttribute dsa) throws Exception {
		dsaDao.updateSysDataStructAttribute(dsa);
	}
	
	/**
	 * 获取数据结构节点树
	 */
	public String getDataStructNodeTree(String structCode) throws Exception  {
		SysDataStructDefine dsdQuery = new SysDataStructDefine();
		dsdQuery.setStruct_code(structCode);
		SysDataStructDefine dsd = dsdDao.selectSysDataStructDefineByPk(dsdQuery);
		
		String rootNodeCode = "";
		
		if ("auto".equals(dsd.getNode_code_rule())) {
			rootNodeCode = dsd.getRule_prefix();
		} else if ("manual".equals(dsd.getNode_code_rule())) {
			rootNodeCode = "ROOT";
		}
		
		TreeNodeData tnd = new TreeNodeData();
		tnd.setNode_code(rootNodeCode);
		tnd.setNode_name(dsd.getStruct_name());
		tnd.setParent_node_code("-1");
		
		TreeNode rootNode = new TreeNode();
		rootNode.setText(dsd.getStruct_name());
		rootNode.setData(tnd);
		
		this.generateSubTree(structCode, rootNode);
		
		TreeNode topNode = new TreeNode();
		topNode.setText(dsd.getStruct_name());
		List<TreeNode> tnList = new ArrayList<TreeNode>();
		tnList.add(rootNode);
		topNode.setNodes(tnList);
		
		String json = JsonUtil.getJSONFromObject(topNode);
		
		json = json.replaceAll("\"nodes\":\\[\\],", "");
		
		return json;
	}
	
	/**
	 * 递归生成子树
	 */
	private void generateSubTree(String structCode, TreeNode parentNode) throws Exception {
		List<TreeNodeVO> subTreeList = dataStructDao.getDataStructNodeTree(structCode, parentNode.getData().getNode_code());
		
		List<TreeNode> subNodeList = new ArrayList<TreeNode>();
		
		for (TreeNodeVO nodeVO : subTreeList) {
			TreeNode subNode = new TreeNode();
			subNode.setText(nodeVO.getNode_name());
			subNode.setData(nodeVO.getTreeNodeData());
			
			generateSubTree(structCode, subNode);
			
			subNodeList.add(subNode);
		}
		
		if (subNodeList != null && subNodeList.size() > 0) {
			parentNode.setNodes(subNodeList);
		}
	}
	
	/**
	 * 获取数据结构节点信息
	 * @param structCode 数据结构编码
	 * @param nodeCode   节点编码
	 */
	public SysDataStructNode getDataStructNodeInfo(String structCode, String nodeCode) throws Exception {
		SysDataStructNode dsn = new SysDataStructNode();
		dsn.setStruct_code(structCode);
		dsn.setNode_code(nodeCode);
		return dsnDao.selectSysDataStructNodeByPk(dsn);
	}
	
	/**
	 * 新建数据结构节点
	 */
	public void addDataStructNode(SysDataStructNode dsn) throws Exception {
		String structCode = dsn.getStruct_code();
		
		SysDataStructDefine dsdQuery = new SysDataStructDefine();
		dsdQuery.setStruct_code(structCode);
		SysDataStructDefine dsd = dsdDao.selectSysDataStructDefineByPk(dsdQuery);
		
		String nodeCode = "";
		if ("auto".equals(dsd.getNode_code_rule())) {
			nodeCode = dsn.getParent_node_code() + dataStructDao.getDataStructNodeCode(structCode, dsn.getParent_node_code(), dsd.getRule_length());
		} else if ("manual".equals(dsd.getNode_code_rule())) {
			nodeCode = dsn.getNode_code();
		}
		
		dsn.setNode_code(nodeCode);
		
		dsnDao.insertSysDataStructNode(dsn);
	}
	
	/**
	 * 编辑数据结构节点
	 */
	public void editDataStructNode(SysDataStructNode dsn) throws Exception {
		dsnDao.updateSysDataStructNode(dsn);
	}
	
	/**
	 * 获取数据结构节点属性列表
	 */
	public List<DataStructNodeAttributeVO> getDataStructNodeAttributeList(
			String structCode, String nodeCode) throws Exception {
		return dataStructDao.getDataStructNodeAttributeList(structCode, nodeCode);
	}
	
	/**
	 * 保存数据结构节点属性
	 */
	public void saveDataStructNodeAttributes(List<DataStructNodeAttributeVO> dsnaVOList) throws Exception {
		for (DataStructNodeAttributeVO dsnaVO : dsnaVOList) {
			SysDataStructNodeAttribute dsnaQuery = new SysDataStructNodeAttribute();
			dsnaQuery.setStruct_code(dsnaVO.getStruct_code());
			dsnaQuery.setNode_code(dsnaVO.getNode_code());
			dsnaQuery.setAttribute_code(dsnaVO.getAttribute_code());
			
			SysDataStructNodeAttribute dsnaEntity = dsnaDao.selectSysDataStructNodeAttributeByPk(dsnaQuery);
			
			SysDataStructNodeAttribute dsna = new SysDataStructNodeAttribute();
			dsna.setStruct_code(dsnaVO.getStruct_code());
			dsna.setNode_code(dsnaVO.getNode_code());
			dsna.setAttribute_code(dsnaVO.getAttribute_code());
			dsna.setAttribute_value(dsnaVO.getAttribute_value() == null ? "" : dsnaVO.getAttribute_value());
			
			if (dsnaEntity != null) {
				dsnaDao.updateSysDataStructNodeAttribute(dsna);
			} else {
				dsnaDao.insertSysDataStructNodeAttribute(dsna);
			}
		}
	}
	
}
