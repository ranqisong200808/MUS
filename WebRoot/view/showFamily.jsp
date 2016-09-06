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
    
    <title>My JSP 'showMenus.jsp' starting page</title>
    
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
			$('#win').window('close');  // close a window 
			$('#dg').datagrid({    
			    url:'showFamilys.do?methodName=showFamilys&pageNo=1&pageSize=10', 
			    frozenColumns:[[{field:'hhh',checkbox:true}]],//多选框
			    rownumbers:true,//显示编号
			    pagination:true,//添加翻页栏
			    striped:true,//显示斑马条纹   
			    columns:[[    
			        {field:'fid',hidden:true},    
			        {field:'studentName',title:'学生名字',width:80,align:'center'},
			        {field:'relation',title:'与学生的关系',width:80,align:'center'},
			        {field:'name',title:'名字',width:80,align:'center'},
			        {field:'birthtime',title:'出生年月',width:80,align:'center'},    
			        {field:'politics',title:'政治面貌',width:80,align:'center'}, 
			        {field:'education',title:'文化程度',width:80,align:'center'}, 
			        {field:'address',title:'户籍地址',width:200,align:'center'}, 
			        {field:'newaddress',title:'现住址',width:200,align:'center'}, 
			        {field:'idtype',title:'证件类型',width:100,align:'center'}, 
			        {field:'idcardno',title:'证件号码',width:150,align:'center'}, 
			        {field:'workunit',title:'工作单位',width:150,align:'center'}, 
			        {field:'phone',title:'电话号码',width:100,align:'center'}
			    ]],
			    toolbar: '#ss'
   
			});	
			//实现翻页
			var pager = $('#dg').datagrid("getPager");
			pager.pagination({
				onSelectPage:function(pageNumber,pageSize){
					refreshData(pageNumber,pageSize);	
				}
			});	
		});
		
		//刷新表格
		function refreshData(pageNo,pageSize){
			$('#dg').datagrid("loading");
				$.post("showFamilys.do",{
					methodName:'showFamilys',
					pageNo:pageNo,
					pageSize:pageSize
				},function(data){
					$('#dg').datagrid("loadData",{
						rows:data.rows,
						total:data.total
					});
					$('#dg').datagrid("loaded");
				},"json");
		}
	</script>
  </head>
  <body>
      <table id="dg"></table>
	  <div id="ss" >
	  	  <form action="">
	  	  	 <table>
	  	  	 	  <tr>
	  	  	 	  	  <td colspan="2">
		  	  	 	  	  <label for="name">名字：</label>
		  	  	 	  	  <input type="text" name="name" class="name" id="name" placeholder="请输入学生全名或者姓氏查询" style="width: 200px" />
	  	  	 	  	  </td>
	  	  	 	  </tr>
	  	  	 	  <tr>
	  	  	 	  	  <td colspan="4">
	  	  	 	  	  	  <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-adduser'">添加</a>
		  	  	 	  	  <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-modify'">修改</a>
		  	  	 	  	  <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-delete'">删除</a>
		  	  	 	  	  <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
	  	  	 	  	  </td>
	  	  	 	  </tr>
	  	  	 </table>
	  	  </form>
      </div>
  </body>
</html>
