package com.ran.vo;

import java.io.Serializable;

/**
 * 修改用户--用户实体类
 * @author Administrator
 *
 */
public class UserVo implements Serializable{
	
	//
	private int sid;
	
	//工号，也是登录账号
	private String snumber;
	
	//用户名字
	private String sname;
	
	//是否拥有该用户
	private String isown;

	public UserVo() {}

	public UserVo(int sid, String snumber, String sname, String isown) {
		this.sid = sid;
		this.snumber = snumber;
		this.sname = sname;
		this.isown = isown;
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

	public String getIsown() {
		return isown;
	}

	public void setIsown(String isown) {
		this.isown = isown;
	}
	
	

}
