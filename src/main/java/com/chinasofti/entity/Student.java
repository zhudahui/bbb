package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import java.util.Date;
import javax.persistence.Id;

public class Student {
    @Id
    @GeneratedValue(generator = "JDBC")
    private String sId;

    private String sPwd;

    private String sName;

    private String sGender;

    private String sSchool;

    private String sMajor;

    private String sClass;

    private Integer sAge;

    private Date sBirth;

    private String sPoliticalstatus;

    private String sNativeplace;

    private String sAddress;

    private String sPhone;

    private String sEmail;

    private String sPhoto;

    private String sIdcard;

    private Integer sLoginflag;

    private Integer sCreditflag;

    private String sNation;

    private String sPostalcode;

    private String sQq;


    public String getSId() {
        return sId;
    }

    public void setSId(String sId) {
        this.sId = sId;
    }

    public String getSPwd() {
        return sPwd;
    }

    public void setSPwd(String sPwd) {
        this.sPwd = sPwd;
    }

    public String getSName() {
        return sName;
    }

    public void setSName(String sName) {
        this.sName = sName;
    }

    public String getSGender() {
        return sGender;
    }

    public void setSGender(String sGender) {
        this.sGender = sGender;
    }

    public String getSSchool() {
        return sSchool;
    }

    public void setSSchool(String sSchool) {
        this.sSchool = sSchool;
    }

    public String getSMajor() {
        return sMajor;
    }

    public void setSMajor(String sMajor) {
        this.sMajor = sMajor;
    }

    public String getSClass() {
        return sClass;
    }

    public void setSClass(String sClass) {
        this.sClass = sClass;
    }

    public Integer getSAge() {
        return sAge;
    }

    public void setSAge(Integer sAge) {
        this.sAge = sAge;
    }

    public Date getSBirth() {
        return sBirth;
    }

    public void setSBirth(Date sBirth) {
        this.sBirth = sBirth;
    }

    public String getSPoliticalstatus() {
        return sPoliticalstatus;
    }

    public void setSPoliticalstatus(String sPoliticalstatus) {
        this.sPoliticalstatus = sPoliticalstatus;
    }

    public String getSNativeplace() {
        return sNativeplace;
    }

    public void setSNativeplace(String sNativeplace) {
        this.sNativeplace = sNativeplace;
    }

    public String getSAddress() {
        return sAddress;
    }

    public void setSAddress(String sAddress) {
        this.sAddress = sAddress;
    }

    public String getSPhone() {
        return sPhone;
    }

    public void setSPhone(String sPhone) {
        this.sPhone = sPhone;
    }

    public String getSEmail() {
        return sEmail;
    }

    public void setSEmail(String sEmail) {
        this.sEmail = sEmail;
    }

    public String getSPhoto() {
        return sPhoto;
    }

    public void setSPhoto(String sPhoto) {
        this.sPhoto = sPhoto;
    }

    public String getSIdcard() {
        return sIdcard;
    }

    public void setSIdcard(String sIdcard) {
        this.sIdcard = sIdcard;
    }

    public Integer getSLoginflag() {
        return sLoginflag;
    }

    public void setSLoginflag(Integer sLoginflag) {
        this.sLoginflag = sLoginflag;
    }

    public Integer getSCreditflag() {
        return sCreditflag;
    }

    public void setSCreditflag(Integer sCreditflag) {
        this.sCreditflag = sCreditflag;
    }

    public String getSNation() {
        return sNation;
    }

    public void setSNation(String sNation) {
        this.sNation = sNation;
    }

    public String getSPostalcode() {
        return sPostalcode;
    }

    public void setSPostalcode(String sPostalcode) {
        this.sPostalcode = sPostalcode;
    }

    public String getSQq() {
        return sQq;
    }

    public void setSQq(String sQq) {
        this.sQq = sQq;
    }
}
