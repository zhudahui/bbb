package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Auditrule {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    private String ruleType;

    private String targetObj;

    private String propName;

    private String propType;

    private String exceptValue;

    private String operType;

    private String operator;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRuleType() {
        return ruleType;
    }

    public void setRuleType(String ruleType) {
        this.ruleType = ruleType;
    }

    public String getTargetObj() {
        return targetObj;
    }

    public void setTargetObj(String targetObj) {
        this.targetObj = targetObj;
    }

    public String getPropName() {
        return propName;
    }

    public void setPropName(String propName) {
        this.propName = propName;
    }

    public String getPropType() {
        return propType;
    }

    public void setPropType(String propType) {
        this.propType = propType;
    }

    public String getExceptValue() {
        return exceptValue;
    }

    public void setExceptValue(String exceptValue) {
        this.exceptValue = exceptValue;
    }

    public String getOperType() {
        return operType;
    }

    public void setOperType(String operType) {
        this.operType = operType;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}
