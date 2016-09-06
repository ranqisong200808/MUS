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
			    url:'showStudents.do?methodName=showStudents&pageNo=1&pageSize=10', 
			    frozenColumns:[[{field:'hhh',checkbox:true}]],//多选框
			    rownumbers:true,//显示编号
			    pagination:true,//添加翻页栏
			    striped:true,//显示斑马条纹        
			    columns:[[    
			        {field:'sid',hidden:true},
			        {field:'snumber',title:'学号',width:100,align:'center'},    
			        {field:'sname',title:'姓名',width:100,align:'center'},
			        {field:'sex',title:'性别',width:100,align:'center',formatter: function(value,row,index){
						if (row.sex==1){
							return "男";
						} else {
							return "女";
						}
					}},
			        {field:'age',title:'年龄',width:100,align:'center'},
			        {field:'isenroll',title:'录取情况',width:100,align:'center',formatter: function(value,row,index){
						if (row.isenroll==1){
							return "录取";
						} else {
							return "未录取";
						}
					}},
			        {field:'isreport',title:'入学报到情况',width:100,align:'center',formatter: function(value,row,index){
						if (row.isreport==1){
							return "已报到";
						} else {
							return "未报到";
						}
					}},
			        {field:'indate',title:'入学时间',width:100,align:'center'},    
			        {field:'ingrade',title:'入学成绩',width:100,align:'center'}, 
			        {field:'college',title:'学院',width:100,align:'center'}, 
			        {field:'major',title:'专业',width:100,align:'center'}, 
			        {field:'sclass',title:'班级',width:100,align:'center'}, 
			        {field:'phone',title:'电话',width:100,align:'center'}, 
			        {field:'qq',title:'QQ',width:100,align:'center'}
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
			$.post("showStudents.do",{
				methodName:'showStudents',
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
		//组合查询
		function seek(){
			$('#dg').datagrid("loading");
			$.post("showStudents.do",{
				methodName:'showStudents',
				pageNo:1,
				pageSize:10,
				sname:$("#sname").val(),
				snumber:$("#snumber").val(),
				major:$("#major").val(),
				indate:$("#indate").val(),
				sex:$("input[name='sex']:checked").val(),
				college:$("#college").combo("getValue")
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
	  	  <form id="sf" action="<%= basePath%>groupSeek.do?methodName=groupSeek">
	  	  	 <table>
	  	  	 	  <tr>
	  	  	 	  	  <td colspan="2">
		  	  	 	  	  <label for="name">名字：</label>
		  	  	 	  	  <input type="text" name="sname"  id="sname" placeholder="请输入全名或者姓氏查询" />
	  	  	 	  	  </td>
	  	              <td colspan="2">
		  	              <label for="name">学号：</label>
		  	              <input type="text" name="snumber"  id="snumber" placeholder="请输入学号查询" />
	  	              </td>
	  	              <td colspan="2">
		  	              <label for="name">专业：</label>
		  	              <input type="text" name="major" id="major" placeholder="请输入所学专业查询" />
	  	              </td>
	  	              <td colspan="2">
		  	              <label for="name">入学年份：</label>
		  	              <input type="text" name="indate" id="indate" placeholder="请输入4位年份查询"/>
	  	              </td>
	  	              <td colspan="2">
		  	              <label for="parentid">性别：</label>
		  	              <input type="radio" name="sex" class="sex" value="1"  id="sex"/>男
						  <input type="radio" name="sex" class="sex" value="2" id="sex2" />女
	  	              </td>
	  	              <td colspan="2">
		  	              <label for="parentid">院系：</label>
		  	              <select name="college" id="college" class="easyui-combobox" style="width: 150px" >
		  	              	  <option value="1">123</option>
		  	              	  <option value="2">abc</option>
		  	              </select>
	  	              </td>
	  	  	 	  </tr>
	  	  	 	  <tr>
	  	  	 	  	  <td colspan="4">
	  	  	 	  	  	  <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-adduser'">添加</a>
		  	  	 	  	  <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-modify'">修改</a>
		  	  	 	  	  <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-delete'">删除</a>
		  	  	 	  	  <a id="btn" href="javascript:void(0);"  onclick="seek();" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
	  	  	 	  	  </td>
	  	  	 	  </tr>
	  	  	 </table>
	  	  </form>
      </div>
  </body>
</html>
