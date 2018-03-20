package org.adf.application.common.mybatis.vo;

import org.apache.ibatis.type.Alias;

@Alias("FlexFieldColumnVO")
public class FlexFieldColumnVO {

	private String column_name;
	private String flex_code;
	private String column_title;
	private String element_type;
	private String ddt_code;
	private String lov_code;
	private String ds_code;
	private String description;

	private String element_type_name;
	private String ddt_text;
	private String ds_text;
	private String lov_text;

	public String getColumn_name() {
		return column_name;
	}

	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}

	public String getFlex_code() {
		return flex_code;
	}

	public void setFlex_code(String flex_code) {
		this.flex_code = flex_code;
	}

	public String getColumn_title() {
		return column_title;
	}

	public void setColumn_title(String column_title) {
		this.column_title = column_title;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getElement_type_name() {
		return element_type_name;
	}

	public void setElement_type_name(String element_type_name) {
		this.element_type_name = element_type_name;
	}

	public String getDdt_text() {
		return ddt_text;
	}

	public void setDdt_text(String ddt_text) {
		this.ddt_text = ddt_text;
	}

	public String getDs_text() {
		return ds_text;
	}

	public void setDs_text(String ds_text) {
		this.ds_text = ds_text;
	}

	public String getLov_text() {
		return lov_text;
	}

	public void setLov_text(String lov_text) {
		this.lov_text = lov_text;
	}

}