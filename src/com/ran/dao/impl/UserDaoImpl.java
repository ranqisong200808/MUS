package com.ran.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.ran.dao.UserDao;
import com.ran.entity.Menu;
import com.ran.entity.Role;
import com.ran.entity.Staff;
import com.ran.entity.Student;
import com.ran.util.DBUtil;
import com.ran.vo.FamilyVo;
import com.ran.vo.MenuVo;
import com.ran.vo.Page;
import com.ran.vo.PermissionVo;
import com.ran.vo.SubsidizeVo;
import com.ran.vo.UserVo;

/**
 * 数据层接口的实现类
 * @author j
 *
 */
public class UserDaoImpl implements UserDao{
	
	
	/**
	 * 通过用户名加载一个用户对象（登录）
	 * @param userName 用户输入的帐号
	 * @return 返回null表示用户的帐号不存在 
	 */
	public Object loadUserByName(String userName,int rank){
		Object user = null;
		String sql = "";
		if(rank == 1){
			sql = "select * from student where snumber=?";
			List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{userName});
			//定义时间格式，
	        SimpleDateFormat formater = new SimpleDateFormat();  
	        formater.applyPattern("yyyy/MM/dd");  
			if(null != list && list.size() > 0){
				Object[] ob = list.get(0);
				String time = formater.format(ob[8]);//将date时间格式装换成定义格式的字符串时间
				user = new Student((Integer)ob[0], userName, String.valueOf(ob[2]), String.valueOf(ob[3]), (Integer)ob[4], (Integer)ob[5], (Integer)ob[6], (Integer)ob[7], time, (Double)ob[9], String.valueOf(ob[10]), String.valueOf(ob[11]), String.valueOf(ob[12]), String.valueOf(ob[13]), String.valueOf(ob[14]));
			}
		}else{
			sql = "select * from staff where snumber=?";
			List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{userName});
			if(null != list && list.size() > 0){
				Object[] ob = list.get(0);
				user = new Staff((Integer)ob[0], String.valueOf(ob[1]), String.valueOf(ob[2]), userName, (Integer)ob[4], (Integer)ob[5], String.valueOf(ob[6]), String.valueOf(ob[7]), String.valueOf(ob[8]));
			}
		}
		return user;
	}
	
	/**
	 * 通过用户id加载用户用有的菜单列表--登录后欢迎界面左边的目录
	 * @param sid
	 * @return
	 */
	public List<Menu> loadMenusBySid(int sid,int rank){
		if(rank==1){
			
		}//-------------未完成  学生登录
		String sql = "select m.* from staffrole sr,rolemenu rm,menu m where sr.role_id=rm.role_id and rm.menu_id=m.menu_id and m.isshow=1 and sr.staff_id=?";
		List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{sid});
		List<Menu> menuList = new ArrayList<Menu>();
		Menu m = null;
		if(null != list&&list.size()>0){
			for(Object[] ob : list){
				m = new Menu((Integer)ob[0], String.valueOf(ob[1]), String.valueOf(ob[2]), (Integer)ob[3], (Integer)ob[4], (Integer)ob[5]);
				menuList.add(m);
			}
		}
		return menuList;
	}
	
	/**
	 * 加载角色--点击角色管理展示
	 * @return
	 */
	public List<Role> showRoles(){
		String sql = "select * from role order by role_id";
		List<Object[]>  list = DBUtil.executeDQL(sql, null);
		List<Role> roleList = new ArrayList<Role>();
		Role r = null;
		if(null != list&&list.size()>0){
			for(Object[] ob : list){
				r = new Role((Integer)ob[0], (String)ob[1]);
				roleList.add(r);
			}
		}
		return roleList;
	}
	
	/**
	 * 查询所菜单和当前用户已经拥有的菜单-点击修改权限展示
	 * @return 
	 */
	public List<PermissionVo> loadAllMenus(int rid){
		String sql = "select m.menu_id,m.name,m.parentid,(select 1 from rolemenu rm where rm.menu_id=m.menu_id and rm.role_id=?) from menu m";
		List<Object[]>  list = DBUtil.executeDQL(sql, new Object[]{rid});
		List<PermissionVo> menuList = new ArrayList<PermissionVo>();
		PermissionVo per = null;
		for(Object[] ob : list){
			per = new PermissionVo((Integer)ob[0], String.valueOf(ob[1]), (Integer)ob[2], String.valueOf(ob[3]));
			menuList.add(per);
		}
		return menuList;
	}
	
	
	/**
	 * 查询所职工用户和当前角色的用户-点击修改用户展示
	 * @return 
	 */
	public List<UserVo> loadAllUsers(int rid){
		String sql = "select s.staff_id,s.snumber,s.sname,(select 1 from staffrole sr where sr.staff_id=s.staff_id and sr.role_id=?) from staff s";
		List<Object[]>  list = DBUtil.executeDQL(sql, new Object[]{rid});
		List<UserVo> userList = new ArrayList<UserVo>();
		UserVo user = null;
		for(Object[] ob : list){
			user = new UserVo((Integer)ob[0], String.valueOf(ob[1]), String.valueOf(ob[2]), String.valueOf(ob[3]));
			userList.add(user);
		}
		return userList;
	}

	
	/**
	 * 修改密码
	 * @param userName 账号
	 * @param newPass 新密码
	 * @param rank 确定是学生为1 ，职工为不等于1的整数
	 * @return 返回1修改成功，否则旧密码不正确
	 */
	public int amendpass(String userName,String oldPass,String newPass,int rank){
		int i = 1;//默认成功
		List<Object[]>  list = null;
		String sql = "select * from staff where snumber=?";//定义查询职工--sql语句
		if(rank==1)sql = "select * from stedent where snumber=?";//如果是学生语句重新赋值查询语句
		list = DBUtil.executeDQL(sql, new Object[]{userName});
		if(oldPass.equals(list.get(0)[2])){
			sql = "update staff set loginPass=? where snumber=?";//sql语句重新赋值--职工修改密码
			if(rank==1)sql = "update stedent set loginPass=? where snumber=?";//如果是学生语句重新赋值修改语句
			DBUtil.executeDML(sql, new Object[]{newPass,userName});
		}else{
			//旧密码错误
			i = 2;
		}
		return i;
	}
	/**
	 * 展示菜单--点击权限管理
	 * @param uid
	 * @return
	 */
	public Page<MenuVo> loadAllMenuVO(int pageNo,int pageSize){
		String sql = "select m.menu_id,m.name,m.url,m.isshow,m.level,(select m2.name from menu m2 where m.parentid=m2.menu_id),m.parentid from menu m limit ?,?";
		List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{(pageNo-1)*pageSize,pageSize});
		List<MenuVo> menuVoList = new ArrayList<MenuVo>();
		MenuVo m = null;
		if(null != list&&list.size()>0){
			for(Object[] ob : list){
				m = new MenuVo((Integer)ob[0], String.valueOf(ob[1]), String.valueOf(ob[2]), (Integer)ob[3], (Integer)ob[4], (String)ob[5],(Integer)ob[6]);
				menuVoList.add(m);
			}
		}
		sql = "select count(*) from menu";
		list = DBUtil.executeDQL(sql, null);
		long total = (Long)list.get(0)[0];
		return new Page<MenuVo>(pageNo, pageSize, menuVoList, total);
	}
	
	/**
	 * 确认修改权限
	 * @param rid
	 * @param mids
	 */
	public void alterPermission(int rid,String[] mids){
		//删除之前已有的菜单列表关联
		String sql = "delete from rolemenu where role_id=?";
		DBUtil.executeDML(sql, new Object[]{rid});
		//重新添加新的菜单列表关联
		sql = "insert into rolemenu(role_id,menu_id) values(?,?)";
		if(mids != null&&mids.length>0){
			for(String ss:mids){
				DBUtil.executeDML(sql, new Object[]{rid,ss});
			}
		}
	}
	
	/**
	 * 确认修改角色拥有的用户
	 * @param rid
	 * @param mids
	 */
	public void alterUser(int rid,String[] mids){
		//删除之前已有的菜单列表关联
		String sql = "delete from rolemenu where role_id=?";
		DBUtil.executeDML(sql, new Object[]{rid});
		//重新添加新的菜单列表关联
		sql = "insert into rolemenu(role_id,menu_id) values(?,?)";
		if(mids != null&&mids.length>0){
			for(String ss:mids){
				DBUtil.executeDML(sql, new Object[]{rid,ss});
			}
		}
	}
	
	/**
	 * 查询数据，跳转到添加菜单的界面
	 * @param uid
	 * @return
	 */
	public List<Menu> load12Menus(){
		String sql = "select m.* from menu m where m.level in (1,2)";
		List<Object[]> list = DBUtil.executeDQL(sql, null);
		List<Menu> menuList = new ArrayList<Menu>();
		Menu m = null;
		if(null != list&&list.size()>0){
			for(Object[] ob : list){
				m = new Menu((Integer)ob[0], String.valueOf(ob[1]), String.valueOf(ob[2]), (Integer)ob[3], (Integer)ob[4], (Integer)ob[5]);
				menuList.add(m);
			}
		}
		return menuList;
	}
	
	/**
	 * 添加菜单
	 * @param name
	 * @param url
	 * @param isshow
	 * @param level
	 * @param parentid
	 */
	public void addMenu(String name,String url,int isshow,int parentid){
		//查询父级菜单等级
		String sql = "select m.level from menu m where m.menu_id=?";
		List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{parentid});
		Object[] o = list.get(0);
		//根据父级菜单等级确定添加的菜单等级
		int level = (Integer)o[0]+1;
		sql = "insert into menu(name,url,isshow,level,parentid) values(?,?,?,?,?)";
		DBUtil.executeDML(sql, new Object[]{name,url,isshow,level,parentid});
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
		//查询父级菜单等级
		String sql = "select m.level from menu m where m.menu_id=?";
		List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{parentid});
		Object[] o = list.get(0);
		//根据父级菜单等级确定添加的菜单等级
		int level = (Integer)o[0]+1;
		sql = "update menu set name=?,url=?,isshow=?,level=?,parentid=? where menu_id=?";
		DBUtil.executeDML(sql, new Object[]{name,url,isshow,level,parentid,mid});
	}
	
	/**
	 * 删除菜单
	 * @param mids
	 */
	public void deleteMenu(String[] mids){
		String sql = "delete from menu where menu_id=?";
		if(mids != null&&mids.length>0){
			for(String ss:mids){
				System.out.println(ss);
				DBUtil.executeDML(sql, new Object[]{ss});
			}
		}
	}
	
	/**
	 * 展示学生--点击学生基本信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<Student> loadAllStudentVo(int pageNo,int pageSize,String sname,String snumber,String major,String indate,String sex,String college){//ToChar("yyyy-mm-dd",sysdate)
		String sql = "select s.student_id,s.snumber,s.loginPass,s.sname,s.sex,s.age,s.isenroll,s.isreport,s.indate,s.ingrade,(select c.cname from college c where c.cid=s.cid),s.major,s.sclass,s.phone,s.qq from student s limit ?,?";
		List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{(pageNo-1)*pageSize,pageSize});
		List<Student> studentList = new ArrayList<Student>();
		Student m = null;
		//定义时间格式，
        SimpleDateFormat formater = new SimpleDateFormat();  
        formater.applyPattern("yyyy/MM/dd");  
        
		if(null != list&&list.size()>0){
			for(Object[] ob : list){
				String time = formater.format(ob[5]);//将date时间格式装换成定义格式的字符串时间
				m = new Student((Integer)ob[0], String.valueOf(ob[1]), String.valueOf(ob[2]), String.valueOf(ob[3]), (Integer)ob[4], (Integer)ob[5], (Integer)ob[6], (Integer)ob[7], time, (Double)ob[9], String.valueOf(ob[10]), String.valueOf(ob[11]), String.valueOf(ob[12]), String.valueOf(ob[13]), String.valueOf(ob[14]));
				studentList.add(m);
			}
		}
		sql = "select count(*) from student";
		list = DBUtil.executeDQL(sql, null);
		long total = (Long)list.get(0)[0];
		return new Page<Student>(pageNo, pageSize, studentList, total);
	}
	
	
	/**
	 * 展示学生家庭信息--点击学生家庭信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<FamilyVo> loadAllFamilyVo(int pageNo,int pageSize){
		String sql = "select f.fid,(select s.sname from student s where f.student_id=s.student_id)" +
				",f.relation,f.fname,f.birthtime,f.politics,f.education,f.address,f.newaddress" +
				",f.idtype,f.idcardno,f.workunit,f.phone from family f limit ?,?";
		List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{(pageNo-1)*pageSize,pageSize});
		List<FamilyVo> familyVoList = new ArrayList<FamilyVo>();
		FamilyVo m = null;
		//定义时间格式，
        SimpleDateFormat formater = new SimpleDateFormat();  
        formater.applyPattern("yyyy/MM/dd");  
        
		if(null != list&&list.size()>0){
			for(Object[] ob : list){
				String time = formater.format(ob[4]);//将date时间格式装换成定义格式的字符串时间
				m = new FamilyVo((Integer)ob[0], String.valueOf(ob[1]), String.valueOf(ob[2]), String.valueOf(ob[3]), time, String.valueOf(ob[5]), String.valueOf(ob[6]), String.valueOf(ob[7]), String.valueOf(ob[8]), String.valueOf(ob[9]), String.valueOf(ob[10]), String.valueOf(ob[11]), String.valueOf(ob[12]));
				familyVoList.add(m);
			}
		}
		sql = "select count(*) from family";
		list = DBUtil.executeDQL(sql, null);
		long total = (Long)list.get(0)[0];
		return new Page<FamilyVo>(pageNo, pageSize, familyVoList, total);
	}
	
	/**
	 * 展示学生受资助信息--点击学生资助信息
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page<SubsidizeVo> loadAllSubsidizeVo(int pageNo,int pageSize){
		String sql = "select sub.sid,(select st.sname from student st where sub.student_id=st.student_id),sub.subtype,sub.submoney,sub.sponsor,sub.subTime,sub.notes from subsidize sub limit ?,?";
		List<Object[]> list = DBUtil.executeDQL(sql, new Object[]{(pageNo-1)*pageSize,pageSize});
		List<SubsidizeVo> subList = new ArrayList<SubsidizeVo>();
		SubsidizeVo s = null;
		//定义时间格式，
        SimpleDateFormat formater = new SimpleDateFormat();  
        formater.applyPattern("yyyy/MM/dd");  
        
		if(null != list&&list.size()>0){
			for(Object[] ob : list){
				String time = formater.format(ob[5]);//将date时间格式装换成定义格式的字符串时间
				s = new SubsidizeVo((Integer)ob[0], String.valueOf(ob[1]), String.valueOf(ob[2]), (Double)ob[3], String.valueOf(ob[4]), time, String.valueOf(ob[6]));
				subList.add(s);
			}
		}
		sql = "select count(*) from subsidize";
		list = DBUtil.executeDQL(sql, null);
		long total = (Long)list.get(0)[0];
		return new Page<SubsidizeVo>(pageNo, pageSize, subList, total);
	}
	
	
}
