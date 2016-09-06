package com.ran.entity;

import java.io.Serializable;

public class Menu implements Serializable{
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
	
	//菜单属于哪个主菜单
	private int parentid;

	
	
	public Menu() {}
	
	

	public Menu(int mid, String name) {
		this.mid = mid;
		this.name = name;
	}



	public Menu(int mid, String name, String url, int isshow, int level,
			int parentid) {
		this.mid = mid;
		this.name = name;
		this.url = url;
		this.isshow = isshow;
		this.level = level;
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

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	
	
}
