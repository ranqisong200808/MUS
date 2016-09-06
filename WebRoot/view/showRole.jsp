<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showRole.jsp' starting page</title>
    
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
			$('#win').window('close');
			$('#dg').datagrid({    
			    url:'showRoles.do?methodName=showRoles',  
			    frozenColumns:[[{field:'hhh',checkbox:true}]],
			    singleSelect:true,
			    rownumbers:true,
			    striped:true,  
			    columns:[[    
			        {field:'rid',hidden:true},    
			        {field:'name',title:'角色名称',width:888}    
			    ]],
			    toolbar: [{
			    	text:'修改权限',
					iconCls: 'icon-modify',
					handler: function(){
						var row = $('#dg').datagrid("getSelected");
						$("#name").append(row.name);
						$('#dg2').datagrid({    
						    url:'loadAllMenus.do?methodName=loadAllMenus&rid='+row.rid,  
						    striped:true,  
						    columns:[[    
						        {field:'mid',hidden:true},    
						        {field:'isown',title:'是否拥有此权限',width:100,formatter:function(value,row,index){
						        	return "<input type='checkbox' name='mids' value='"+row.mid+"' " + (value==1?"checked":"") + "/>";
						        }},
								{field:'name',title:'菜单名字',width:300}   
						    ]],
						});
						/*$.post("loadAllMenus.do",{
							methodName:'loadAllMenus',
							rid:row.rid
						},function(data){
							var str = "";
							for (var i=0;i<data.length;i++){
								str += "<tr><td>";
								str += "<input type='checkbox' name='mids' value='"+data[i].mid+"' " + (null!=data[i].isown?"checked":"") + "/>";
								str += "</td><td>";
								str += data[i].name;
								str += "</td></tr>";
								$("#dg2").append(str);
								str = "";
							}
						},"json");*/
						var url ="alterPermission.do?methodName=alterPermission&rid="+row.rid;
						$('#btn').attr("onclick","ok('"+url+"');");
						$('#win').window('open');
					}
				},'-',{
					text:'修改用户',
					iconCls: 'icon-user',
					handler: function(){
						var row = $('#dg').datagrid("getSelected");
						$("#name").append(row.name);
						$('#dg2').datagrid({    
						    url:'loadAllUsers.do?methodName=loadAllUsers&rid='+row.rid,  
						    striped:true,  
						    columns:[[    
						        {field:'sid',hidden:true},    
						        {field:'bb',field:'isown',title:'是否拥有此账号',width:100,formatter:function(value,row,index){
						        	return "<input type='checkbox' name='mids' value='"+row.mid+"' " + (value==1?"checked":"") + "/>";
						        }},
						        {field:'snumber',title:'账号/工号',width:200},
								{field:'sname',title:'用户名字',width:200}   
						    ]],
						});
						var url ="alterUser.do?methodName=alterUser&rid="+row.rid;
						$('#btn').attr("onclick","ok('"+url+"');");
						$('#win').window('open');
					}
				},'-',{
					text:'刷新',
					iconCls: 'icon-reload',
					handler: function(){
						$('#dg').datagrid('reload'); 
					}
				}]   
			});
		});
		
		//确认修改
		function ok(url){
			var rows = $('#dg2').datagrid("getSelections");
			var s = "";
			for(var i=0;i<rows.length;i++){
			     arrvalue=rows[i];//数组的索引是从0开始的
			     s += arrvalue.mid+",";
			}
			var sr = s.substring(0, s.length-1);
			$.ajax({
			   type: "POST",
			   url: url,
			   traditional:true,
			   data:{ rows:sr},
			   dataType: "json",
			});
			$('#win').window('close');
			$('#dg').datagrid('reload');
			$("#msg").append("操作成功");
		}
	</script>
  </head>
  
  <body>
      <table id="dg"> </table> 
      <div id="win" class="easyui-window" title='<span id="name"></span>&gt;&gt;管理' style="width:500px;height:550px;top:5px"   
          data-options="iconCls:'icon-user',modal:true,collapsible:false,minimizable:false,maximizable:false"> 
          <table id="dg2">
          	  <tr>
	      	  	  <td>是否拥有此权限</td>
	      	  	  <td>菜单名称</td>
	      	  </tr>
          </table>
	  	  <a id="btn" href="javascript:void(0);" onclick="" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">确认修改</a>  
	  </div>
	  <span id="msg" style="color: red;"></span>
  </body>
</html>
