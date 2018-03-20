package org.adf.application.modules.security.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.adf.application.common.enumeration.EnumAttributeCode;
import org.adf.application.common.enumeration.EnumDataStructCode;
import org.adf.application.common.mybatis.vo.TreeNodeVO;
import org.adf.application.modules.security.dao.SecurityDao;
import org.adf.framework.util.Constants;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.util.tree.TreeNode;
import org.adf.framework.util.tree.TreeNodeData;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("all")
public class SecurityService {

	@Resource
	private SecurityDao securityDao;
	
	/**
	 * 获取菜单树
	 * @param userId 当前用户ID
	 */
	public String getMenuTree(String userId) throws Exception {
		List<TreeNode> rootNodeList = new ArrayList<TreeNode>();
		
		// 获取手风琴菜单列表
		List<TreeNodeVO> accordionMenuList = securityDao.getAccordionMenuList(
				EnumDataStructCode.MENU.toString(), EnumAttributeCode.FUNCTION.toString(),
				EnumAttributeCode.ICON.toString(), userId);
		
		for (TreeNodeVO accordionMenuVO : accordionMenuList) {
			TreeNode node = new TreeNode();
			node.setText(accordionMenuVO.getNode_name());
			node.setData(accordionMenuVO.getTreeNodeData());
			
			this.generateSubMenuTree(node, userId);
			
			rootNodeList.add(node);
		}
		
		String json = JsonUtil.getJSONFromObjectList(rootNodeList);
		
		json = json.replaceAll("\"nodes\":\\[\\],", "");
		
		return json;
	}
	
	/**
	 * 生成子菜单树
	 */
	private void generateSubMenuTree(TreeNode parentNode, String userId) throws Exception {
		List<TreeNodeVO> subMenuList = securityDao.getTreeMenuList(
				EnumDataStructCode.MENU.toString(), parentNode.getData()
						.getNode_code(), EnumAttributeCode.FUNCTION.toString(),
				EnumAttributeCode.ICON.toString(), userId);
		
		List<TreeNode> subNodeList = new ArrayList<TreeNode>();
		
		for (TreeNodeVO menuVO : subMenuList) {
			TreeNode subNode = new TreeNode();
			subNode.setText(menuVO.getNode_name());
			subNode.setData(menuVO.getTreeNodeData());
			
			generateSubMenuTree(subNode, userId);
			
			subNodeList.add(subNode);
		}
		
		if (subNodeList != null && subNodeList.size() > 0) {
			parentNode.setNodes(subNodeList);
		}
	}
	
}
