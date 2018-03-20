package org.adf.framework.util.tree;

/**
 * 树节点状态
 * @author AI
 * @since 2016-11-19
 */
public class TreeNodeState {

	private String selected = "false"; // 是否被选中
	private String checked = "false"; // 是否被选中-复选框
	private String expanded = "false"; // 是否展开
	private String disabled = "false"; // 是否可用

	public String getSelected() {
		return selected;
	}

	public void setSelected(String selected) {
		this.selected = selected;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getExpanded() {
		return expanded;
	}

	public void setExpanded(String expanded) {
		this.expanded = expanded;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

}
