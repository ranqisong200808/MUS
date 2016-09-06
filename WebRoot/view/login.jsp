<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录-学工系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="view/css/xgxt_login.css" />

  </head>
  
  <body>
      <div id="header">
			<div class="header_title">
				<span class="title_con">学工系统</span>
			</div>
		</div>
		<div id="content">
			<center>
				<div class="con">
					<div class="con_title">
						<span class="con_title_sp">欢迎登录学工系统</span>
					</div>
					<form action="login.do?methodName=login" method="post" class="form">
						<div class="con_panel">
							<div class="con_input">
								<span>用户名：</span>
								<input type="text" placeholder="学号/工号" name="userName" >
							</div>
							<div class="con_input">
								<span>密 码 ： </span> 
								<input type="password" placeholder="密码" name="userPass"/>
							</div>
							<div class="con_select">
								<input type="radio" name="rank" value="1" checked/>学生
								<input type="radio" name="rank" value="2" />教师
								<input type="radio" name="rank" value="3" />管理员
							</div>
							<input type="submit" value="登录" class="submit-btn" /><br>
							<span>${error}</span>
						</div>
					</form>
				</div>
			</center>
		</div>
  </body>
</html>
