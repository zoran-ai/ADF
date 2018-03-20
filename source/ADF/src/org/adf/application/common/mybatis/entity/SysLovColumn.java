package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysLovColumn")
public class SysLovColumn {

    private String lov_code;
    private String column_name;
    private String column_title;
    private String display_flag;
    private String return_value_flag;
    private String return_text_flag;

    public String getLov_code() {
        return lov_code;
    }

    public void setLov_code(String lov_code) {
        this.lov_code = lov_code;
    }

    public String getColumn_name() {
        return column_name;
    }

    public void setColumn_name(String column_name) {
        this.column_name = column_name;
    }

    public String getColumn_title() {
        return column_title;
    }

    public void setColumn_title(String column_title) {
        this.column_title = column_title;
    }

    public String getDisplay_flag() {
        return display_flag;
    }

    public void setDisplay_flag(String display_flag) {
        this.display_flag = display_flag;
    }

    public String getReturn_value_flag() {
        return return_value_flag;
    }

    public void setReturn_value_flag(String return_value_flag) {
        this.return_value_flag = return_value_flag;
    }

    public String getReturn_text_flag() {
        return return_text_flag;
    }

    public void setReturn_text_flag(String return_text_flag) {
        this.return_text_flag = return_text_flag;
    }

}