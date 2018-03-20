package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysDataDictType")
public class SysDataDictType {

    private String type_code;
    private String type_name;
    private String description;

    public String getType_code() {
        return type_code;
    }

    public void setType_code(String type_code) {
        this.type_code = type_code;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}