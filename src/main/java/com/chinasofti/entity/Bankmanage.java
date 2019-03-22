package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Bankmanage {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String bmId;

    private String bmPwd;

    private String bmName;

    private String bmPhone;

    private String bmBank;

    private Integer flag;

    private String bmQq;




    public String getBmId() {
        return bmId;
    }

    public void setBmId(String bmId) {
        this.bmId = bmId;
    }

    public String getBmPwd() {
        return bmPwd;
    }

    public void setBmPwd(String bmPwd) {
        this.bmPwd = bmPwd;
    }

    public String getBmName() {
        return bmName;
    }

    public void setBmName(String bmName) {
        this.bmName = bmName;
    }

    public String getBmPhone() {
        return bmPhone;
    }

    public void setBmPhone(String bmPhone) {
        this.bmPhone = bmPhone;
    }

    public String getBmBank() {
        return bmBank;
    }

    public void setBmBank(String bmBank) {
        this.bmBank = bmBank;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getBmQq() {
        return bmQq;
    }

    public void setBmQq(String bmQq) {
        this.bmQq = bmQq;
    }
}
