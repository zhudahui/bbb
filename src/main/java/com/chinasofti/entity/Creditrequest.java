package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import java.util.Date;
import javax.persistence.Id;

public class Creditrequest {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer rId;

    private String sId;

    private String bId;

    private Integer money;

    private Date starttime;

    private Date deadline;

    private Integer annualincome;

    private String reason;

    private String useType;

    private Integer flag;

    private Date requestdate;

    private String schoolidea;

    private String bankidea;


    public Integer getRId() {
        return rId;
    }

    public void setRId(Integer rId) {
        this.rId = rId;
    }

    public String getSId() {
        return sId;
    }

    public void setSId(String sId) {
        this.sId = sId;
    }

    public String getBId() {
        return bId;
    }

    public void setBId(String bId) {
        this.bId = bId;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Integer getAnnualincome() {
        return annualincome;
    }

    public void setAnnualincome(Integer annualincome) {
        this.annualincome = annualincome;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getUseType() {
        return useType;
    }

    public void setUseType(String useType) {
        this.useType = useType;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Date getRequestdate() {
        return requestdate;
    }

    public void setRequestdate(Date requestdate) {
        this.requestdate = requestdate;
    }

    public String getSchoolidea() {
        return schoolidea;
    }

    public void setSchoolidea(String schoolidea) {
        this.schoolidea = schoolidea;
    }

    public String getBankidea() {
        return bankidea;
    }

    public void setBankidea(String bankidea) {
        this.bankidea = bankidea;
    }

	@Override
	public String toString() {
		return "Creditrequest [rId=" + rId + ", sId=" + sId + ", bId=" + bId + ", money=" + money + ", starttime="
				+ starttime + ", deadline=" + deadline + ", annualincome=" + annualincome + ", reason=" + reason
				+ ", useType=" + useType + ", flag=" + flag + ", requestdate=" + requestdate + ", schoolidea="
				+ schoolidea + ", bankidea=" + bankidea + "]";
	}
}
