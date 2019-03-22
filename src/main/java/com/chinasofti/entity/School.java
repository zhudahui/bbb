package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class School {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String schId;

    private String schName;

    private String schPhone;

    private String schAddress;

    private String schBank;

    private Integer flag;


    public String getSchId() {
        return schId;
    }

    public void setSchId(String schId) {
        this.schId = schId;
    }

    public String getSchName() {
        return schName;
    }

    public void setSchName(String schName) {
        this.schName = schName;
    }

    public String getSchPhone() {
        return schPhone;
    }

    public void setSchPhone(String schPhone) {
        this.schPhone = schPhone;
    }

    public String getSchAddress() {
        return schAddress;
    }

    public void setSchAddress(String schAddress) {
        this.schAddress = schAddress;
    }

    public String getSchBank() {
        return schBank;
    }

    public void setSchBank(String schBank) {
        this.schBank = schBank;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}
