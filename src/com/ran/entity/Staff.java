package com.ran.entity;

import java.io.Serializable;

/**
 * 教职工用户实体类
 * @author j
 *
 */
public class Staff implements Serializable{

	private int sid;
	
	private String snumber;//账号、工号
	
	private String loginPass;//密码
	
	private String sname;//姓名
	
	private int sex;//性别
	
	private int age;//年龄
	
	private String phone;//电话
	
	
	
	private String jobName;
	
	private String sectionName;

	
	public Staff() {}


	public Staff(int sid, String snumber, String loginPass, String sname,
			int sex, int age, String phone, String jobName, String sectionName) {
		this.sid = sid;
		this.snumber = snumber;
		this.loginPass = loginPass;
		this.sname = sname;
		this.sex = sex;
		this.age = age;
		this.phone = phone;
		this.jobName = jobName;
		this.sectionName = sectionName;
	}


	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLoginPass() {
		return loginPass;
	}

	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	
	
}
