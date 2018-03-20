package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysFlexFieldColumn")
public class SysFlexFieldColumn {

    private String column_name;
    private String flex_code;
    private String column_title;
    private String element_type;
    private String ddt_code;
    private String lov_code;
    private String ds_code;
    private String description;

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

}