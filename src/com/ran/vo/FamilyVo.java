package com.ran.vo;

import java.io.Serializable;

public class FamilyVo implements Serializable{
	
	private int fid;
	
	private String studentName;//学生名字
	
	private String relation;//与学生的关系 
	
	private String name;
	
	private String birthtime;//出生年月
	
	private String politics;//政治面貌
	
	private String education;//文化程度
	
	private String address;//户口薄地址
	
	private String newaddress;//现住址
	
	private String idtype;//证件类型
	
	private String idcardno;//证件号码
	
	private String workunit;//工作单位
	
	private String phone;//电话

	public FamilyVo() {}

	public FamilyVo(int fid, String studentName, String relation, String name,
			String birthtime, String politics, String education,
			String address, String newaddress, String idtype, String idcardno,
			String workunit, String phone) {
		this.fid = fid;
		this.studentName = studentName;
		this.relation = relation;
		this.name = name;
		this.birthtime = birthtime;
		this.politics = politics;
		this.education = education;
		this.address = address;
		this.newaddress = newaddress;
		this.idtype = idtype;
		this.idcardno = idcardno;
		this.workunit = workunit;
		this.phone = phone;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthtime() {
		return birthtime;
	}

	public void setBirthtime(String birthtime) {
		this.birthtime = birthtime;
	}

	public String getPolitics() {
		return politics;
	}

	public void setPolitics(String politics) {
		this.politics = politics;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNewaddress() {
		return newaddress;
	}

	public void setNewaddress(String newaddress) {
		this.newaddress = newaddress;
	}

	public String getIdtype() {
		return idtype;
	}

	public void setIdtype(String idtype) {
		this.idtype = idtype;
	}

	public String getIdcardno() {
		return idcardno;
	}

	public void setIdcardno(String idcardno) {
		this.idcardno = idcardno;
	}

	public String getWorkunit() {
		return workunit;
	}

	public void setWorkunit(String workunit) {
		this.workunit = workunit;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
