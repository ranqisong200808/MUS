package com.ran.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.ran.model.UserModel;
import com.ran.model.impl.UserModelMySQLImpl;
import com.ran.vo.FamilyVo;
import com.ran.vo.MenuVo;
import com.ran.vo.Page;
import com.ran.vo.PermissionVo;
import com.ran.vo.SubsidizeVo;
import com.ran.vo.UserVo;
import com.ran.controller.MainServlet;
import com.ran.entity.Menu;
import com.ran.entity.Role;
import com.ran.entity.Staff;
import com.ran.entity.Student;


public class MainServlet  extends HttpServlet {
	
	//控制层持有模型对象
	private UserModel userModel = new UserModelMySQLImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String methodName = req.getParameter("methodName");
		System.out.println(methodName);
		Class c = MainServlet.class;
		Method m = null;
		try {
			m = c.getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			m.invoke(this, req,resp);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 登录方法
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//取表单数据
		String userName = req.getParameter("userName");
		String userPass = req.getParameter("userPass");
		int rank = Integer.valueOf(req.getParameter("rank"));
		Object obj = userModel.loadUserByName(userName,rank);
		Student stu = null;
		Staff staff = null;
		if(rank==1){
			stu=(Student)obj;
		}else{
			staff = (Staff)obj;
		}
		//利用上面的查询判断，并给出不同提示
		if(null != staff||null != stu){
			//账号正确
			System.out.println("账号正确");
			if((rank==1?stu.getLoginPass():staff.getLoginPass()).equals(userPass)){
				//密码正确,保存数据到整个项目
				System.out.println("密码正确");
				List<Menu> menuList = userModel.loadMenusBySid(staff.getSid(),rank);
				req.getSession().setAttribute("loginUser", staff);
				req.getSession().setAttribute("menuList", menuList);
				req.getRequestDispatcher("view/welcome.jsp").forward(req, resp);
			}else{
				//密码错了,给出提示，跳转页面到登录页面
				System.out.println("密码错误");
				req.setAttribute("error", "密码错误！");
				req.getRequestDispatcher("view/login.jsp").forward(req, resp);
			}
		}else{
			//账号不存在
			System.out.println("账号不存在");
			req.setAttribute("error", "账号不存在");
			req.getRequestDispatcher("view/login.jsp").forward(req, resp);
		}
	}
	
	/**
	 * 加载角色列表
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showRoles(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Role> roleList = userModel.showRoles();
		String json = JSONArray.fromObject(roleList).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		resp.getWriter().flush();
	}
	
	/**
	 * 加载角色菜单--修改权限时调用
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void loadAllMenus(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String rid = req.getParameter("rid");
		List<PermissionVo>  menuList = userModel.loadAllMenus(Integer.valueOf(rid));
		String json = JSONArray.fromObject(menuList).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		resp.getWriter().flush();
	}
	
	/**
	 * 确认修改权限alterMenu
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void alterPermission(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String rid = req.getParameter("rid");
		String s = req.getParameter("rows");
		String[] mids = s.split(",");
		userModel.alterPermission(Integer.valueOf(rid), mids);
		req.getRequestDispatcher("view/showRole.jsp").forward(req, resp);
		
	}
	
	/**
	 * 加载角色用户--修改用户时调用
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void loadAllUsers(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String rid = req.getParameter("rid");
		List<UserVo>  userList = userModel.loadAllUsers(Integer.valueOf(rid));
		String json = JSONArray.fromObject(userList).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		resp.getWriter().flush();
	}
	
	/**
	 * 确认修改角色用户
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void affirmUser(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String rid = req.getParameter("rid");
		String s = req.getParameter("rows");
		String[] mids = s.split(",");
		userModel.alterUser(Integer.valueOf(rid), mids);
		req.getRequestDispatcher("view/showRole.jsp").forward(req, resp);
	}
	
	
	/**
	 * 修改密码----职工
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void amendpass(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int rank = 2 ;
		//获得当前账号对象
		Staff staff =(Staff)req.getSession().getAttribute("loginUser");
		String oldPass = req.getParameter("oldPass");
		String newPass = req.getParameter("newPass");
		int i = userModel.amendpass(staff.getSnumber(),oldPass,newPass,rank);
		if(i==1){
			//修改成功
			req.setAttribute("msg", "修改成功！");
			req.getRequestDispatcher("view/amendPass.jsp").forward(req, resp);
			return;
		}
		req.setAttribute("msg", "原密码错误！");
		req.getRequestDispatcher("view/amendPass.jsp").forward(req, resp);
	}
	
	/**
	 * 展示菜单列表showStudents
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showMenus(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pageNo = Integer.valueOf(req.getParameter("pageNo"));
		int pageSize = Integer.valueOf(req.getParameter("pageSize"));
		Page<MenuVo> page = userModel.loadAllMenuVO(pageNo,pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getDataList());
		map.put("total", page.getTotal());
		
		String json = JSONObject.fromObject(map).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		resp.getWriter().flush();
	}
	/**
	 * 跳转到添加菜单或者修改菜单时加载1、2级菜单
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void load12Menu(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Menu> list = userModel.load12Menus();
		list.add(0,new Menu(-1,"请选择父级菜单"));
		String json = JSONArray.fromObject(list).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		resp.getWriter().flush();
	}
	/**
	 * 添加菜单
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void addMenu(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String name = req.getParameter("name");
		String url = req.getParameter("url");
		String isshow = req.getParameter("isshow");
		String parentid = req.getParameter("parentid");
		userModel.addMenu(name, url, Integer.valueOf(isshow), Integer.valueOf(parentid));
		req.setAttribute("msg", "操作成功！");
		req.getRequestDispatcher("view/showMenus.jsp").forward(req, resp);
	}
	
	/**
	 * 修改菜单
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void alterMenu(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String mid = req.getParameter("mid");
		String name = req.getParameter("name");
		String url = req.getParameter("url");
		String isshow = req.getParameter("isshow");
		String parentid = req.getParameter("parentid");
		userModel.alterMenu(Integer.valueOf(mid),name, url, Integer.valueOf(isshow), Integer.valueOf(parentid));
		req.setAttribute("msg", "操作成功！");
		req.getRequestDispatcher("view/showMenus.jsp").forward(req, resp);
	}
	
	/**
	 * 删除菜单
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteMenu(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	String s = req.getParameter("rows");
	String[] mids = s.split(",");
	userModel.deleteMenu(mids);
	req.setAttribute("msg", "修改成功!");
	req.getRequestDispatcher("view/showMenus.jsp").forward(req, resp);
	}
	
	/**
	 * 展示学生基本信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showStudents(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取组合条件信息
		String sname = req.getParameter("sname");
		String snumber = req.getParameter("snumber");
		String major = req.getParameter("major");
		String indate = req.getParameter("indate");
		String sex = req.getParameter("sex");
		String college = req.getParameter("college");
		
		int pageNo = Integer.valueOf(req.getParameter("pageNo"));
		int pageSize = Integer.valueOf(req.getParameter("pageSize"));
		Page<Student> page = userModel.loadAllStudentVo(pageNo,pageSize,sname,snumber,major,indate,sex,college);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getDataList());
		map.put("total", page.getTotal());
		
		String json = JSONObject.fromObject(map).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		resp.getWriter().flush();
	}
	
	/**
	 * 展示学生家庭信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showFamilys(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int pageNo = Integer.valueOf(req.getParameter("pageNo"));
		int pageSize = Integer.valueOf(req.getParameter("pageSize"));
		Page<FamilyVo> page = userModel.loadAllFamilyVo(pageNo,pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getDataList());
		map.put("total", page.getTotal());
		
		String json = JSONObject.fromObject(map).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		resp.getWriter().flush();
	}
	
	/**
	 * 展示学生受资助信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showSubsidize(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pageNo = Integer.valueOf(req.getParameter("pageNo"));
		int pageSize = Integer.valueOf(req.getParameter("pageSize"));
		Page<SubsidizeVo> page = userModel.loadAllSubsidizeVo(pageNo,pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", page.getDataList());
		map.put("total", page.getTotal());
		
		String json = JSONObject.fromObject(map).toString();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(json);
		resp.getWriter().flush();
	}
	
	
	/**
	 * 退出
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getSession().invalidate();
		resp.sendRedirect("view/login.jsp");
	}

}
