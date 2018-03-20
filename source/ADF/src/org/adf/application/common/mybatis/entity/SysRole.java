package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysRole")
public class SysRole {

    private String role_id;
    private String role_name;
    private String description;

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}