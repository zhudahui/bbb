package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Course {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String cId;

    private String cName;

    private String cSchool;

    private String cTeacher;

    private Integer cPeriod;

    private Integer flag;


    public String getCId() {
        return cId;
    }

    public void setCId(String cId) {
        this.cId = cId;
    }

    public String getCName() {
        return cName;
    }

    public void setCName(String cName) {
        this.cName = cName;
    }

    public String getCSchool() {
        return cSchool;
    }

    public void setCSchool(String cSchool) {
        this.cSchool = cSchool;
    }

    public String getCTeacher() {
        return cTeacher;
    }

    public void setCTeacher(String cTeacher) {
        this.cTeacher = cTeacher;
    }

    public Integer getCPeriod() {
        return cPeriod;
    }

    public void setCPeriod(Integer cPeriod) {
        this.cPeriod = cPeriod;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }
}
