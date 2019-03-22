package com.chinasofti.vo;

public class CreditRequest {
	private int r_id;
	private String s_id;
	private String b_id;
	private int money;
	private String starttime;
	private String deadline;
	private int annualincome;
	private String reason;
	private String use_type;
	public String getUse_type() {
		return use_type;
	}
	public void setUse_type(String use_type) {
		this.use_type = use_type;
	}
	private int flag;
	private String requestdate;
	private String schoolidea;
	private String bankidea;
	
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getB_id() {
		return b_id;
	}
	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	public int getAnnualincome() {
		return annualincome;
	}
	public void setAnnualincome(int annualincome) {
		this.annualincome = annualincome;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getRequestdate() {
		return requestdate;
	}
	public void setRequestdate(String requestdate) {
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
		return "CreditRequest [r_id=" + r_id + ", s_id=" + s_id + ", b_id=" + b_id + ", money=" + money + ", starttime="
				+ starttime + ", deadline=" + deadline + ", annualincome=" + annualincome + ", reason=" + reason
				+ ", flag=" + flag + ", requestdate=" + requestdate + ", schoolidea=" + schoolidea
				+ ", bankidea=" + bankidea + "]";
	}
	
	
}
