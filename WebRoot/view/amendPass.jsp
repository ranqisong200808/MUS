<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'amendPass.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
	<script type="text/javascript" src="view/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		$(function(){
			$.extend($.fn.validatebox.defaults.rules, {    
			    equals: {    
			        validator: function(value,param){    
			            return value == $(param[0]).val();    
			        },    
			        message: '两次输入不一致！'   
			    }    
			});
		});
	</script>
	<style type="text/css">
		 .table_top{
		      margin: auto;
		  	  width: 300px;
		  	  margin-top:30px;
		  }
		.table_top{
			
		}
		.name{
		      display: block;
		      height:25px;
		      width: 150px;
		  }
		  .amend{
		  	  margin-top: 20px;
		 	  margin: auto;
		      display: block;
		      text-align: center;
		  }
		  .amend:hover{
		      cursor: pointer;
		   }
	</style>

  </head>
  
  <body>
       <form action="<%= basePath %>amendpass.do?methodName=amendpass" method="post" >
          <table border="0" bgcolor="" cellpadding="0" cellspacing="0" class="table_top">
  	          <tr>
  	              <td>请输入旧密码：</td>
  	              <td>
  	              	  <input id="vv" name="oldPass" class="easyui-validatebox" data-options="required:true" /> 
  	              </td>
  		      </tr>
  		      <tr>
  	              <td>请输入新密码：</td>
  	              <td>
  	              	  <input id="pwd" name="newPass" type="password" class="easyui-validatebox" data-options="required:true" />
  	              </td>
  		      </tr>
  		      <tr>
  	              <td>确认输入新密码：</td>
  	              <td>
  	              	  <input id="rpwd" name="rnewPass" type="password" class="easyui-validatebox" required="required" validType="equals['#pwd']" />
  	              </td>
  		      </tr>
  		      <tr>
  	              <td colspan="2" style="text-align: center;">
  	             	   <input type="submit" value="确认修改" class="amend"/>
  	              </td>
  		      </tr>
  		      <tr>
  	              <td><span style="color: red;font-size: 11px;" >${msg}</span></td>
  		      </tr>
          </table>
      </form>
  </body>
</html>
