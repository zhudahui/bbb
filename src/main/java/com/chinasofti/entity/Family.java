package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Family {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer id;

    private Integer fId;

    private String sId;

    private String fNickname;

    private String fName;

    private String fCompany;

    private String fPhone;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFId() {
        return fId;
    }

    public void setFId(Integer fId) {
        this.fId = fId;
    }

    public String getSId() {
        return sId;
    }

    public void setSId(String sId) {
        this.sId = sId;
    }

    public String getFNickname() {
        return fNickname;
    }

    public void setFNickname(String fNickname) {
        this.fNickname = fNickname;
    }

    public String getFName() {
        return fName;
    }

    public void setFName(String fName) {
        this.fName = fName;
    }

    public String getFCompany() {
        return fCompany;
    }

    public void setFCompany(String fCompany) {
        this.fCompany = fCompany;
    }

    public String getFPhone() {
        return fPhone;
    }

    public void setFPhone(String fPhone) {
        this.fPhone = fPhone;
    }

	@Override
	public String toString() {
		return "Family [id=" + id + ", fId=" + fId + ", sId=" + sId + ", fNickname=" + fNickname + ", fName=" + fName
				+ ", fCompany=" + fCompany + ", fPhone=" + fPhone + "]";
	}
    
}
