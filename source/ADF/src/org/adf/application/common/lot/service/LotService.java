package org.adf.application.common.lot.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.lot.dao.LotDao;
import org.adf.application.common.mybatis.dao.SysDataStructDefineDao;
import org.adf.application.common.mybatis.entity.SysDataStructDefine;
import org.adf.application.common.mybatis.vo.TreeNodeVO;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.util.tree.TreeNode;
import org.adf.framework.util.tree.TreeNodeData;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class LotService {

	@Resource
	private LotDao lotDao;
	
	@Resource
	private SysDataStructDefineDao dsdDao;
	
	/**
	 * 获取树列表
	 */
	public TreeNode getTreeList(String structCode) throws Exception {
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
		
		return topNode;
	}
	
	/**
	 * 递归生成子树
	 */
	private void generateSubTree(String structCode, TreeNode parentNode) throws Exception {
		List<TreeNodeVO> subTreeList = lotDao.getTreeList(structCode, parentNode.getData().getNode_code());
		
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
	 * 获取树列表节点显示文本
	 * @param structCode 数据结构编码
	 * @param nodeCode   节点编码
	 */
	public String getTreeDisplayText(String structCode, String nodeCode) throws Exception {
		return lotDao.getTreeDisplayText(structCode, nodeCode);
	}
	
}
