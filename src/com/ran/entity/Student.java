package com.ran.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 学生用户实体类
 * @author j
 *
 */
public class Student implements Serializable{
	
	private int sid;
	
	private String snumber;//学号、也是账号
	
	private String loginPass;//密码
	
	private String sname;//名字
	
	private int sex;//性别
	
	private int age;//年龄
	
	private int isenroll;//录取情况1被录取，2未录取
	
	private int isreport;//报到情况1以及报到，2未报到
	
	private String indate;//入学时间
	
	private double ingrade;//入学成绩
	
	private String college;//学院
	
	private String major;//专业
	
	private String sclass;//班级
	
	private String phone;//电话
	
	private String qq;//QQ

	public Student() {}

	public Student(int sid, String snumber, String loginPass, String sname,
			int sex, int age, int isenroll, int isreport, String indate,
			double ingrade, String college, String major, String sclass,
			String phone, String qq) {
		this.sid = sid;
		this.snumber = snumber;
		this.loginPass = loginPass;
		this.sname = sname;
		this.sex = sex;
		this.age = age;
		this.isenroll = isenroll;
		this.isreport = isreport;
		this.indate = indate;
		this.ingrade = ingrade;
		this.college = college;
		this.major = major;
		this.sclass = sclass;
		this.phone = phone;
		this.qq = qq;
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

	public String getLoginPass() {
		return loginPass;
	}

	public void setLoginPass(String loginPass) {
		this.loginPass = loginPass;
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

	public int getIsenroll() {
		return isenroll;
	}

	public void setIsenroll(int isenroll) {
		this.isenroll = isenroll;
	}

	public int getIsreport() {
		return isreport;
	}

	public void setIsreport(int isreport) {
		this.isreport = isreport;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public double getIngrade() {
		return ingrade;
	}

	public void setIngrade(double ingrade) {
		this.ingrade = ingrade;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

}
