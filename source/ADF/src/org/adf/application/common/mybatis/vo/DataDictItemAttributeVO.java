package org.adf.application.common.mybatis.vo;

import org.apache.ibatis.type.Alias;

@Alias("DataDictItemAttributeVO")
public class DataDictItemAttributeVO {

	private String type_code;
	private String item_code;
	private String attribute_code;
	private String attribute_value;

	private String attribute_name;
	private String attribute_text;

	private String element_type;
	private String ddt_code;
	private String lov_code;
	private String ds_code;

	public String getType_code() {
		return type_code;
	}

	public void setType_code(String type_code) {
		this.type_code = type_code;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getAttribute_code() {
		return attribute_code;
	}

	public void setAttribute_code(String attribute_code) {
		this.attribute_code = attribute_code;
	}

	public String getAttribute_value() {
		return attribute_value;
	}

	public void setAttribute_value(String attribute_value) {
		this.attribute_value = attribute_value;
	}

	public String getAttribute_name() {
		return attribute_name;
	}

	public void setAttribute_name(String attribute_name) {
		this.attribute_name = attribute_name;
	}

	public String getAttribute_text() {
		return attribute_text;
	}

	public void setAttribute_text(String attribute_text) {
		this.attribute_text = attribute_text;
	}

	public String getElement_type() {
		return element_type;
	}

	public void setElement_type(String element_type) {
		this.element_type = element_type;
	}

	public String getDdt_code() {
		return ddt_code;
	}

	public void setDdt_code(String ddt_code) {
		this.ddt_code = ddt_code;
	}

	public String getLov_code() {
		return lov_code;
	}

	public void setLov_code(String lov_code) {
		this.lov_code = lov_code;
	}

	public String getDs_code() {
		return ds_code;
	}

	public void setDs_code(String ds_code) {
		this.ds_code = ds_code;
	}

}