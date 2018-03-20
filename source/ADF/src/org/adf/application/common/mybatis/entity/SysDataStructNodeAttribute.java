package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysDataStructNodeAttribute")
public class SysDataStructNodeAttribute {

    private String struct_code;
    private String node_code;
    private String attribute_code;
    private String attribute_value;

    public String getStruct_code() {
        return struct_code;
    }

    public void setStruct_code(String struct_code) {
        this.struct_code = struct_code;
    }

    public String getNode_code() {
        return node_code;
    }

    public void setNode_code(String node_code) {
        this.node_code = node_code;
    }

    public String getAttribute_code() {
        return attribute_code;
    }

    public void setAttribute_code(String attribute_code) {
        this.attribute_code = attribute_code;
    }

    public String getAttribute_value() {
        return attribute_value;
    }

    public void setAttribute_value(String attribute_value) {
        this.attribute_value = attribute_value;
    }

}