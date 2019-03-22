package com.chinasofti.entity;

import javax.persistence.GeneratedValue;
import java.util.Date;
import javax.persistence.Id;

public class Notice {
    @Id
    @GeneratedValue(generator = "JDBC")
    private Integer nId;

    private String nTitle;

    private String nBody;

    private String nAuthor;

    private Date nDate;

    private String nType;

    private Integer flag;


    public Integer getNId() {
        return nId;
    }

    public void setNId(Integer nId) {
        this.nId = nId;
    }

    public String getNTitle() {
        return nTitle;
    }

    public void setNTitle(String nTitle) {
        this.nTitle = nTitle;
    }

    public String getNBody() {
        return nBody;
    }

    public void setNBody(String nBody) {
        this.nBody = nBody;
    }

    public String getNAuthor() {
        return nAuthor;
    }

    public void setNAuthor(String nAuthor) {
        this.nAuthor = nAuthor;
    }

    public Date getNDate() {
        return nDate;
    }

    public void setNDate(Date nDate) {
        this.nDate = nDate;
    }

    public String getNType() {
        return nType;
    }

    public void setNType(String nType) {
        this.nType = nType;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", nTitle=" + nTitle + ", nBody=" + nBody + ", nAuthor=" + nAuthor + ", nDate="
				+ nDate + ", nType=" + nType + ", flag=" + flag + "]";
	}
    
    
}
