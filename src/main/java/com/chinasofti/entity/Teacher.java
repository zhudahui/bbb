package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Teacher {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String tId;

    private String tName;

    private String tSchool;

    private String tPhone;


    public String getTId() {
        return tId;
    }

    public void setTId(String tId) {
        this.tId = tId;
    }

    public String getTName() {
        return tName;
    }

    public void setTName(String tName) {
        this.tName = tName;
    }

    public String getTSchool() {
        return tSchool;
    }

    public void setTSchool(String tSchool) {
        this.tSchool = tSchool;
    }

    public String getTPhone() {
        return tPhone;
    }

    public void setTPhone(String tPhone) {
        this.tPhone = tPhone;
    }
}
