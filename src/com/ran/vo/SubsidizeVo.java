package com.ran.vo;

import java.io.Serializable;
import java.util.Date;

public class SubsidizeVo implements Serializable{
	//    
	private int sid;
	
	private String studentName;//
	
	private String subtype;//资助类型
	
	private double submoney;//资助金额
	
	private String sponsor;//资助者
	
	private String subTime;//资助时间
	
	private String notes;//备注

	public SubsidizeVo() {}

	public SubsidizeVo(int sid, String studentName, String subtype,
			double submoney, String sponsor, String subTime, String notes) {
		this.sid = sid;
		this.studentName = studentName;
		this.subtype = subtype;
		this.submoney = submoney;
		this.sponsor = sponsor;
		this.subTime = subTime;
		this.notes = notes;
	}

	public String getSubTime() {
		return subTime;
	}

	public void setSubTime(String subTime) {
		this.subTime = subTime;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getSubtype() {
		return subtype;
	}

	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}

	public double getSubmoney() {
		return submoney;
	}

	public void setSubmoney(double submoney) {
		this.submoney = submoney;
	}

	public String getSponsor() {
		return sponsor;
	}

	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

}
