<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath",basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'welcome.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
	<script type="text/javascript" src="view/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		function addtabs(title,url){
			$("#tables").tabs('add',{
				title    : title,
				selected : true,
				closable : true,
				content  : "<iframe height='100%' width='100%' frameborder='0' scrolling='auto' src='"+url+"'></iframe>"
			});
		}
		function logout() {
			var url = "logout.do?methodName=logout";
			$('#logout').attr("href",url);
		}
	</script>
	<style type="text/css">
		.logo{
			float:left;
		}
		.dh{
			float: right;
			margin-top: 20px;
			color: #FFFFFF;
			text-align: center;
		}
		.dao{
			margin-right: 20px;
			margin-top: 20px;
		}
		.out{
			display: block;
			margin-top: 60px;
		}
	</style>

  </head>
  
  <body class="easyui-layout" >
  	  <div id="cc" class="easyui-layout" style="width:100%;height:100%;">   
      <div data-options="region:'north',split:true"  style="height:140px;background-image: url('view/img/logobg.jpg');">
      	  <div class="logo"><img src="view/img/898950160902133248.jpg"/></div>
      	  <div class="dh">
      	  	  <span class="dao">重庆师范大学学工管理系统&gt;&gt;${loginUser.sname}</span>
      	  	  <span class="out">
	      	  	  <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-back'">后退</a>
	      	  	  <a id="logout" href="javascript:void(0);" onclick="logout();" class="easyui-linkbutton" data-options="iconCls:'icon-no'">注销</a>
	      	  </span>
      	  </div>
      </div>   
      <div data-options="region:'west',title:'系统菜单',iconCls:'icon-reload',split:true" style="width:250px;font-size:25px">
      	  <div id="aa" class="easyui-accordion" data-options="fit:true"> 
      	  	  <c:forEach items="${menuList}" var="m2">  
      	  	  	  <c:if test="${m2.level==2}">
				      <div title="${m2.name}" data-options="iconCls:'icon-submit',collapsible:true" >   
				          <ul id="tt" class="easyui-tree">
					          <c:forEach items="${menuList}" var="m3">
					          	  <c:if test="${m3.parentid==m2.mid}">
								      <li>   
								          <span><a href="javascript:void(0);"  onclick="addtabs('${m3.name }','${basePath}${m3.url}');">${m3.name}</a></span>   
								          <ul>   
								              <c:forEach items="${menuList}" var="m4">
					          	  			  <c:if test="${m4.parentid==m3.mid}">
									              <li>   
									                  <span><a href="javascript:void(0);"  onclick="addtabs('${m4.name }','${basePath}${m4.url}');">${m4.name}</a></span>   
									              </li>
									          </c:if>
						      				  </c:forEach>      
								          </ul>   
								      </li>   
							      </c:if>
						      </c:forEach>
				      	  </ul>
				      </div> 
				  </c:if>	      
		      </c:forEach>
		  </div> 
      </div>   
      <div data-options="region:'center'" style="padding:5px;background:#eee;">
      	  <div id="tables" class="easyui-tabs" data-options="fit:true">   
		      <div title="欢迎" >   
		         <h1 style="color: blue;text-align: center" >欢迎你</h1>   
		      </div>   
		  </div>
      </div>   
</div>  
  </body>
</html>









