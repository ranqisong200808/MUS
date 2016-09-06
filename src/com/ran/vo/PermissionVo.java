package com.ran.vo;

import java.io.Serializable;

/**
 * 修改菜单实体类
 * @author Administrator
 *
 */
public class PermissionVo implements Serializable{
	
	//菜单id
	private int mid;
	
	//菜单名字
	private String name;
	
	//父级菜单id
	private int parentid;
	
	//是否拥有该菜单
	private String isown;
	

	public PermissionVo() {}

	public PermissionVo(int mid, String name, int parentid, String isown) {
		this.mid = mid;
		this.name = name;
		this.parentid = parentid;
		this.isown = isown;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

	public String getIsown() {
		return isown;
	}

	public void setIsown(String isown) {
		this.isown = isown;
	}
	

}
