package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysFlexFieldDefine")
public class SysFlexFieldDefine {

    private String flex_code;
    private String flex_name;
    private String table_name;
    private String enabled_flag;
    private String description;

    public String getFlex_code() {
        return flex_code;
    }

    public void setFlex_code(String flex_code) {
        this.flex_code = flex_code;
    }

    public String getFlex_name() {
        return flex_name;
    }

    public void setFlex_name(String flex_name) {
        this.flex_name = flex_name;
    }

    public String getTable_name() {
        return table_name;
    }

    public void setTable_name(String table_name) {
        this.table_name = table_name;
    }

    public String getEnabled_flag() {
        return enabled_flag;
    }

    public void setEnabled_flag(String enabled_flag) {
        this.enabled_flag = enabled_flag;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}