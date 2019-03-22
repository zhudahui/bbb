package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Score {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    private String sId;

    private String cId;

    private Integer grade;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSId() {
        return sId;
    }

    public void setSId(String sId) {
        this.sId = sId;
    }

    public String getCId() {
        return cId;
    }

    public void setCId(String cId) {
        this.cId = cId;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }
}
