package org.adf.framework.util.tree;

import java.util.List;

/**
 * 树节点
 * @author AI
 * @since 2016-11-19
 */
public class TreeNode {

	private String text;

	private List<TreeNode> nodes;

	private TreeNodeData data;

	private TreeNodeState state;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<TreeNode> getNodes() {
		return nodes;
	}

	public void setNodes(List<TreeNode> nodes) {
		this.nodes = nodes;
	}

	public TreeNodeData getData() {
		return data;
	}

	public void setData(TreeNodeData data) {
		this.data = data;
	}

	public TreeNodeState getState() {
		return state;
	}

	public void setState(TreeNodeState state) {
		this.state = state;
	}

}
