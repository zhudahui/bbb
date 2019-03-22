package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Admin {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String aId;

    private String aPwd;


    public String getAId() {
        return aId;
    }

    public void setAId(String aId) {
        this.aId = aId;
    }

    public String getAPwd() {
        return aPwd;
    }

    public void setAPwd(String aPwd) {
        this.aPwd = aPwd;
    }
}
