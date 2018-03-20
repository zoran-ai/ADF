package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysLovDefine")
public class SysLovDefine {

    private String lov_code;
    private String lov_name;
    private String view_name;
    private String description;

    public String getLov_code() {
        return lov_code;
    }

    public void setLov_code(String lov_code) {
        this.lov_code = lov_code;
    }

    public String getLov_name() {
        return lov_name;
    }

    public void setLov_name(String lov_name) {
        this.lov_name = lov_name;
    }

    public String getView_name() {
        return view_name;
    }

    public void setView_name(String view_name) {
        this.view_name = view_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}