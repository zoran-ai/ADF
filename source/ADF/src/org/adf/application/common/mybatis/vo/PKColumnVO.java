package org.adf.application.common.mybatis.vo;

import org.apache.ibatis.type.Alias;

@Alias("PKColumnVO")
public class PKColumnVO {

	private String constraint_schema;
	private String constraint_name;
	private String constraint_type;
	private String table_name;
	private String column_name;
	private String ordinal_position;

	public String getConstraint_schema() {
		return constraint_schema;
	}

	public void setConstraint_schema(String constraint_schema) {
		this.constraint_schema = constraint_schema;
	}

	public String getConstraint_name() {
		return constraint_name;
	}

	public void setConstraint_name(String constraint_name) {
		this.constraint_name = constraint_name;
	}

	public String getConstraint_type() {
		return constraint_type;
	}

	public void setConstraint_type(String constraint_type) {
		this.constraint_type = constraint_type;
	}

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	public String getColumn_name() {
		return column_name;
	}

	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}

	public String getOrdinal_position() {
		return ordinal_position;
	}

	public void setOrdinal_position(String ordinal_position) {
		this.ordinal_position = ordinal_position;
	}

}
