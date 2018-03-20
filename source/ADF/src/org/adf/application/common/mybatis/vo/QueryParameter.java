package org.adf.application.common.mybatis.vo;

import org.apache.ibatis.type.Alias;

@Alias("QueryParameter")
public class QueryParameter {

	private String id; // ID
	private String parentId; // 父ID
	private String code; // 编码
	private String parentCode; // 父编码
	private String name; // 名称
	private String type; // 类型
	private String length; // 长度

	private String userId; // 用户ID

	private String typeCode; // 类型编码
	private String itemCode; // 项编码
	private String attributeCode; // 属性编码
	private String structCode; // 结构编码
	private String nodeCode; // 节点编码
	private String functionAttributeCode; // 功能属性编码
	private String iconAttributeCode; // 图标属性编码
	private String lovCode; // 值列表编码
	private String parameterCode; // 参数编码
	private String functionCode; // 操作编码
	private String flexCode; // 弹性域编码

	private String enabled_flag; // 可用标识

	private String viewName; // 视图名称
	private String tableName; // 表名称
	private String columnName; // 字段名称

	private String schema; // 模式

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getAttributeCode() {
		return attributeCode;
	}

	public void setAttributeCode(String attributeCode) {
		this.attributeCode = attributeCode;
	}

	public String getStructCode() {
		return structCode;
	}

	public void setStructCode(String structCode) {
		this.structCode = structCode;
	}

	public String getNodeCode() {
		return nodeCode;
	}

	public void setNodeCode(String nodeCode) {
		this.nodeCode = nodeCode;
	}

	public String getFunctionAttributeCode() {
		return functionAttributeCode;
	}

	public void setFunctionAttributeCode(String functionAttributeCode) {
		this.functionAttributeCode = functionAttributeCode;
	}

	public String getIconAttributeCode() {
		return iconAttributeCode;
	}

	public void setIconAttributeCode(String iconAttributeCode) {
		this.iconAttributeCode = iconAttributeCode;
	}

	public String getLovCode() {
		return lovCode;
	}

	public void setLovCode(String lovCode) {
		this.lovCode = lovCode;
	}

	public String getParameterCode() {
		return parameterCode;
	}

	public void setParameterCode(String parameterCode) {
		this.parameterCode = parameterCode;
	}

	public String getFunctionCode() {
		return functionCode;
	}

	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}

	public String getFlexCode() {
		return flexCode;
	}

	public void setFlexCode(String flexCode) {
		this.flexCode = flexCode;
	}

	public String getEnabled_flag() {
		return enabled_flag;
	}

	public void setEnabled_flag(String enabled_flag) {
		this.enabled_flag = enabled_flag;
	}

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getSchema() {
		return schema;
	}

	public void setSchema(String schema) {
		this.schema = schema;
	}

}
