package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysRoleMenuRelation")
public class SysRoleMenuRelation {

    private String role_id;
    private String menu_code;

    public String getRole_id() {
        return role_id;
    }

    public void setRole_id(String role_id) {
        this.role_id = role_id;
    }

    public String getMenu_code() {
        return menu_code;
    }

    public void setMenu_code(String menu_code) {
        this.menu_code = menu_code;
    }

}