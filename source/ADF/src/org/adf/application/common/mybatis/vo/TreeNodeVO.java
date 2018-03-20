package org.adf.application.common.mybatis.vo;

import org.adf.framework.util.tree.TreeNodeData;
import org.adf.framework.util.tree.TreeNodeState;
import org.apache.ibatis.type.Alias;

/**
 * 树节点
 * @author AI
 * @since 2016-11-19
 */
@Alias("TreeNodeVO")
public class TreeNodeVO {

	/*标准树节点属性*/
	private String node_code; // 节点编码
	private String parent_node_code; // 父节点编码
	private String node_name; // 节点名称
	private String node_icon; // 节点图标
	private String node_url; // 节点URL
	private String is_leaf_node; // 是否是叶子节点
	private String is_selected; // 节点是否被选中
	private String is_checked; // 节点是否被选中-复选框
	private String is_expanded; // 节点是否展开
	private String is_disabled; // 节点是否可用

	/*扩展树节点属性*/
	private String function_code; // 功能编码

	public String getNode_code() {
		return node_code;
	}

	public void setNode_code(String node_code) {
		this.node_code = node_code;
	}

	public String getParent_node_code() {
		return parent_node_code;
	}

	public void setParent_node_code(String parent_node_code) {
		this.parent_node_code = parent_node_code;
	}

	public String getNode_name() {
		return node_name;
	}

	public void setNode_name(String node_name) {
		this.node_name = node_name;
	}

	public String getNode_icon() {
		return node_icon;
	}

	public void setNode_icon(String node_icon) {
		this.node_icon = node_icon;
	}

	public String getNode_url() {
		return node_url;
	}

	public void setNode_url(String node_url) {
		this.node_url = node_url;
	}

	public String getIs_leaf_node() {
		return is_leaf_node;
	}

	public void setIs_leaf_node(String is_leaf_node) {
		this.is_leaf_node = is_leaf_node;
	}

	public String getIs_selected() {
		return is_selected;
	}

	public void setIs_selected(String is_selected) {
		this.is_selected = is_selected;
	}

	public String getIs_checked() {
		return is_checked;
	}

	public void setIs_checked(String is_checked) {
		this.is_checked = is_checked;
	}

	public String getIs_expanded() {
		return is_expanded;
	}

	public void setIs_expanded(String is_expanded) {
		this.is_expanded = is_expanded;
	}

	public String getIs_disabled() {
		return is_disabled;
	}

	public void setIs_disabled(String is_disabled) {
		this.is_disabled = is_disabled;
	}

	public String getFunction_code() {
		return function_code;
	}

	public void setFunction_code(String function_code) {
		this.function_code = function_code;
	}
	
	/**
	 * 获取树节点数据对象
	 */
	public TreeNodeData getTreeNodeData() throws Exception {
		TreeNodeData tnd = new TreeNodeData();
		tnd.setNode_code(this.getNode_code());
		tnd.setParent_node_code(this.getParent_node_code());
		tnd.setNode_name(this.getNode_name());
		tnd.setNode_icon(this.getNode_icon() == null ? "" : this.getNode_icon());
		tnd.setNode_url(this.getNode_url() == null ? "" : this.getNode_url());
		tnd.setIs_leaf_node(this.getIs_leaf_node() == null ? "" : this.getIs_leaf_node());
		tnd.setIs_selected(this.getIs_selected() == null ? "" : this.getIs_selected());
		tnd.setIs_checked(this.getIs_checked() == null ? "" : this.getIs_checked());
		tnd.setIs_expanded(this.getIs_expanded() == null ? "" : this.getIs_expanded());
		tnd.setIs_disabled(this.getIs_disabled() == null ? "" : this.getIs_disabled());
		tnd.setFunction_code(this.getFunction_code() == null ? "" : this.getFunction_code());
		return tnd;
	}
	
	/**
	 * 获取树节点状态对象
	 */
	public TreeNodeState getTreeNodeState() throws Exception {
		TreeNodeState tns = new TreeNodeState();
		tns.setSelected(this.getIs_selected() == null ? "false" : this.getIs_selected());
		tns.setChecked(this.getIs_checked() == null ? "false" : this.getIs_checked());
		tns.setExpanded(this.getIs_expanded() == null ? "false" : this.getIs_expanded());
		tns.setDisabled(this.getIs_disabled() == null ? "false" : this.getIs_disabled());
		return tns;
	}

}
