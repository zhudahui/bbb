package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Schoolmanage {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String smId;

    private String smPwd;

    private String smName;

    private String smSchool;

    private String smPhone;

    private Integer flag;

    private String smQq;


    public String getSmId() {
        return smId;
    }

    public void setSmId(String smId) {
        this.smId = smId;
    }

    public String getSmPwd() {
        return smPwd;
    }

    public void setSmPwd(String smPwd) {
        this.smPwd = smPwd;
    }

    public String getSmName() {
        return smName;
    }

    public void setSmName(String smName) {
        this.smName = smName;
    }

    public String getSmSchool() {
        return smSchool;
    }

    public void setSmSchool(String smSchool) {
        this.smSchool = smSchool;
    }

    public String getSmPhone() {
        return smPhone;
    }

    public void setSmPhone(String smPhone) {
        this.smPhone = smPhone;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public String getSmQq() {
        return smQq;
    }

    public void setSmQq(String smQq) {
        this.smQq = smQq;
    }
}
