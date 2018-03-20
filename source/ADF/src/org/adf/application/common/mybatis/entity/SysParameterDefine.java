package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysParameterDefine")
public class SysParameterDefine {

    private String parameter_code;
    private String parameter_name;
    private String parameter_type;
    private String element_type;
    private String ddt_code;
    private String lov_code;
    private String ds_code;
    private String display_order;
    private String description;

    public String getParameter_code() {
        return parameter_code;
    }

    public void setParameter_code(String parameter_code) {
        this.parameter_code = parameter_code;
    }

    public String getParameter_name() {
        return parameter_name;
    }

    public void setParameter_name(String parameter_name) {
        this.parameter_name = parameter_name;
    }

    public String getParameter_type() {
        return parameter_type;
    }

    public void setParameter_type(String parameter_type) {
        this.parameter_type = parameter_type;
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

    public String getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(String display_order) {
        this.display_order = display_order;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}