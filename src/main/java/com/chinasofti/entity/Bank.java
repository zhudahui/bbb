package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Bank {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String bId;

    private String bName;

    private String bAddress;

    private String bPhone;

    private String bSchool;

    private Integer flag;


    public String getBId() {
        return bId;
    }

    public void setBId(String bId) {
        this.bId = bId;
    }

    public String getBName() {
        return bName;
    }

    public void setBName(String bName) {
        this.bName = bName;
    }

    public String getBAddress() {
        return bAddress;
    }

    public void setBAddress(String bAddress) {
        this.bAddress = bAddress;
    }

    public String getBPhone() {
        return bPhone;
    }

    public void setBPhone(String bPhone) {
        this.bPhone = bPhone;
    }

    public String getBSchool() {
        return bSchool;
    }

    public void setBSchool(String bSchool) {
        this.bSchool = bSchool;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}
