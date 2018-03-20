package org.adf.application.common.mybatis.entity;

import org.apache.ibatis.type.Alias;

@Alias("SysDataStructDefine")
public class SysDataStructDefine {

    private String struct_code;
    private String struct_name;
    private String node_code_rule;
    private String rule_prefix;
    private String rule_length;
    private String description;

    public String getStruct_code() {
        return struct_code;
    }

    public void setStruct_code(String struct_code) {
        this.struct_code = struct_code;
    }

    public String getStruct_name() {
        return struct_name;
    }

    public void setStruct_name(String struct_name) {
        this.struct_name = struct_name;
    }

    public String getNode_code_rule() {
        return node_code_rule;
    }

    public void setNode_code_rule(String node_code_rule) {
        this.node_code_rule = node_code_rule;
    }

    public String getRule_prefix() {
        return rule_prefix;
    }

    public void setRule_prefix(String rule_prefix) {
        this.rule_prefix = rule_prefix;
    }

    public String getRule_length() {
        return rule_length;
    }

    public void setRule_length(String rule_length) {
        this.rule_length = rule_length;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}