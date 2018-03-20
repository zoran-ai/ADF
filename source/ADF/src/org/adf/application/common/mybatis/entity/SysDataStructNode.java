package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysDataStructNode")
public class SysDataStructNode {

    private String node_code;
    private String parent_node_code;
    private String struct_code;
    private String node_name;
    private String display_order;
    private String enabled_flag;
    private String description;

    public String getNode_code() {
        return node_code;
    }

    public void setNode_code(String node_code) {
        this.node_code = node_code;
    }

    public String getParent_node_code() {
        return parent_node_code;
    }

    public void setParent_node_code(String parent_node_code) {
        this.parent_node_code = parent_node_code;
    }

    public String getStruct_code() {
        return struct_code;
    }

    public void setStruct_code(String struct_code) {
        this.struct_code = struct_code;
    }

    public String getNode_name() {
        return node_name;
    }

    public void setNode_name(String node_name) {
        this.node_name = node_name;
    }

    public String getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(String display_order) {
        this.display_order = display_order;
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