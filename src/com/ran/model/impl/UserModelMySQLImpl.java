package com.ran.model.impl;

import java.util.List;

import com.ran.model.UserModel;
import com.ran.vo.FamilyVo;
import com.ran.vo.MenuVo;
import com.ran.vo.Page;
import com.ran.vo.PermissionVo;
import com.ran.vo.SubsidizeVo;
import com.ran.vo.UserVo;
import com.ran.dao.UserDao;
import com.ran.dao.impl.UserDaoImpl;
import com.ran.entity.Menu;
import com.ran.entity.Role;
import com.ran.entity.Staff;
import com.ran.entity.Student;

/**
 * 模型层接口的实现类
 * @author j
 *
 */
public class UserModelMySQLImpl implements UserModel{
	
	//模型层持有一个DAO层对象
	private UserDao userDao = new UserDaoImpl();
	
	
	/**
	 * 通过用户名加载一个用户对象（登录）
	 * @param userName 用户输入的帐号
	 * @return 返回null表示用户的帐号不存在 
	 */
	public Object loadUserByName(String userName,int rank){
		return userDao.loadUserByName(userName, rank);
	}
	/**
	 * 通过用户id加载用户用有的菜单列表---登录后欢迎界面左边的目录
	 * @param sid
	 * @return
	 */
	public List<Menu> loadMenusBySid(int sid,int rank){
		return userDao.loadMenusBySid(sid, rank);
	}
	
	/**
	 * 加载角色--点击角色管理展示
	 * @return
	 */
	public List<Role> showRoles(){
		return userDao.showRoles();
	}
	
	/**
	 * 查询所菜单和当前用户已经拥有的菜单-点击修改权限展示
	 * @return 
	 */
	public List<PermissionVo> loadAllMenus(int rid){
		return userDao.loadAllMenus(rid);
	}
	
	/**
	 * 确认修改权限
	 * @param rid
	 * @param mids
	 */
	public void alterPermission(int rid,String[] mids){
		userDao.alterPermission(rid,mids);
	}
	/**
	 * 确认修改角色拥有的用户
	 * @param rid
	 * @param mids
	 */
	public void alterUser(int rid,String[] mids){
		userDao.alterUser(rid,mids);
	}
	
	/**
	 * 查询所职工用户和当前角色的用户-点击修改用户展示
	 * @return 
	 */
	public List<UserVo> loadAllUsers(int rid){
		return userDao.loadAllUsers(rid);
	}
	
	/**
	 * 修改密码
	 * @param userName 账号
	 * @param newPass 新密码
	 * @param rank 确定是学生为1 ，职工为不等于1的整数
	 * @return 返回1修改成功，否则旧密码不正确
	 */
	public int amendpass(String userName,String oldPass,String newPass,int rank){
		return userDao.amendpass(userName,oldPass,newPass,rank);
	}
	/**
	 * 展示菜单--点击权限管理
	 * @return
	 */
	public Page<MenuVo> loadAllMenuVO(int pageNo,int pageSize){
		return userDao.loadAllMenuVO(pageNo,pageSize);
	}
	
	/**
	 * 查询数据跳转到添加菜单的界面
	 * @param uid
	 * @return
	 */
	public List<Menu> load12Menus(){
		return userDao.load12Menus();
	}
	
	/**
	 * 开始添加菜单
	 */
	public void addMenu(String name,String url,int isshow,int parentid){
		userDao.addMenu(name, url, isshow, parentid);
	}
	
	/**
	 * 修改菜单
	 * @param mid
	 * @param name
	 * @param url
	 * @param isshow
	 * @param parentid
	 */
	public void alterMenu(int mid,String name,String url,int isshow,int parentid){
		userDao.alterMenu(mid,name, url, isshow, parentid);
	}
	
	/**
	 * 删除菜单
	 * @param mids
	 */
	public void deleteMenu(String[] mids){
		userDao.deleteMenu(mids);
	}
	/**
	 * 展示学生--点击学生基本信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<Student> loadAllStudentVo(int pageNo,int pageSize,String sname,String snumber,String major,String indate,String sex,String college){
		return userDao.loadAllStudentVo(pageNo,pageSize,sname,snumber,major,indate,sex,college);
	}
	
	/**
	 * 展示学生家庭信息--点击学生家庭信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<FamilyVo> loadAllFamilyVo(int pageNo,int pageSize){
		return userDao.loadAllFamilyVo(pageNo,pageSize);
	}
	
	/**
	 * 展示学生受资助信息--点击学生资助信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<SubsidizeVo> loadAllSubsidizeVo(int pageNo,int pageSize){
		return userDao.loadAllSubsidizeVo(pageNo,pageSize);
	}

}
