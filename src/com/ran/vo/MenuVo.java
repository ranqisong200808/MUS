package com.ran.vo;

import java.io.Serializable;

public class MenuVo implements Serializable{
	//菜单表id
	private int mid;
	
	//菜单表名字
	private String name;
	
	//地址
	private String url;
	
	//是否在欢迎界面显示，1显示 0不显示
	private int isshow;
	
	//菜单等级
	private int level;
	
	//菜单属于哪个主菜单的名字
	private String parentName;
	
	//菜单属于哪个主菜单的id
	private int parentid;

	public String toString(){
		return "{\"mid\":"+mid+",\"name\":"+name+",\"url\":"+url+",\"isshow\":"+isshow+",\"level\":"+level+",\"parentName\":"+parentName+",\"parentid\":"+parentid+"}";
	}
	
	public MenuVo() {}


	public MenuVo(int mid, String name, String url, int isshow, int level,
			String parentName, int parentid) {
		this.mid = mid;
		this.name = name;
		this.url = url;
		this.isshow = isshow;
		this.level = level;
		this.parentName = parentName;
		this.parentid = parentid;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getIsshow() {
		return isshow;
	}

	public void setIsshow(int isshow) {
		this.isshow = isshow;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	
	
}
