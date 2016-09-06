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
			    url:'showMenus.do?methodName=showMenus&pageNo=1&pageSize=10', 
			    frozenColumns:[[{field:'hhh',checkbox:true}]],//多选框
			    rownumbers:true,//显示编号
			    pagination:true,//添加翻页栏
			    striped:true,//显示斑马条纹   
			    columns:[[    
			        {field:'mid',hidden:true},    
			        {field:'name',title:'菜单名称',width:200,align:'center'},
			        {field:'url',title:'菜单URL',width:400},
			        {field:'isshow',title:'是否展示',width:200,align:'center'},
			        {field:'level',title:'菜单级别',width:200,align:'center'},    
			        {field:'parentName',title:'父级菜单',width:100,align:'center'}, 
			        {field:'parentid',hidden:true}
			    ]],
			    toolbar: [{
			    	text:'添加',
					iconCls: 'icon-add',
					handler: function(){
						var url = "${basePath}addMenu.do?methodName=addMenu";
						$('#ok_url').attr("action",url);//修改表单提交地址
						$('#name').attr("placeholder","");//修改默认显示
						$('#url').attr("placeholder","");//修改默认显示
						parent("#parentid",'-1');
						$('#win').window('open'); 
						}
				},'-',{
					text:'修改',
					iconCls: 'icon-modify',
					handler: function(){
						var row = $('#dg').datagrid("getSelected");//获得选中行$("#myId").attr("href","www.xxx.com"); $("#realname").val("黑色头发");//赋值  
						var url = "${basePath}alterMenu.do?methodName=alterMenu&mid="+row.mid;
						$('#ok_url').attr("action",url);//修改表单提交地址
						$("#name").val(row.name);
						$("#url").val(row.url);
						//$('#name').attr("placeholder",row.name);//修改默认显示
						//$('#url').attr("placeholder",row.url);//修改默认显示
						if(row.isshow==1){//修改默认显示
							$('#isshow1').attr("checked","checked");
						}else{
							$('#isshow2').attr("checked","checked");
						}
						//处理数据，如果修改时没有输入则将修改为原有的值
						
						parent("#parentid",row.parentid);
						$('#win').window('open');
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-delete',
					handler: function(){
						var rows = $('#dg').datagrid("getSelections");//获得所有选中项，组成数组
						var s = "";
						for(var i=0;i<rows.length;i++){//循环将数组拼接成以逗号隔开的字符串
						     arrvalue=rows[i];//数组的索引是从0开始的
						     s += arrvalue.mid+",";
						}
						var sr = s.substring(0, s.length-1);
						$.ajax({
						   type: "POST",
						   url: "deleteMenu.do?methodName=deleteMenu",
						   traditional:true,
						   data:{ rows:sr},
						   dataType: "json",
						});
						refreshData(1,10);//还有bug
					}
				}]
   
			});	
			//实现翻页
			var pager = $('#dg').datagrid("getPager");
			pager.pagination({
				onSelectPage:function(pageNumber,pageSize){
					refreshData(pageNumber,pageSize);	
				}
			});	
		});
		function parent(id,index){
			//添加菜单时加载父级菜单
			$(id).combobox({
				url:'load12Menu.do?methodName=load12Menu',
				textField:'name',
				valueField:'mid',
				value:index
			});
		}
		//刷新表格
		function refreshData(pageNo,pageSize){
			$('#dg').datagrid("loading");
				$.post("showMenus.do",{
					methodName:'showMenus',
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
	  <div id="win" class="easyui-window" title="My Window" style="width:400px;height:300px;top:50px"   
        data-options="iconCls:'icon-add',modal:true,collapsible:false,minimizable:false,maximizable:false,resizable:false">   
		  <form action="" method="post"  id="ok_url">
	          <table border="0" bgcolor="" cellpadding="0" cellspacing="0" class="table_top">
	  	          <tr>
	  	              <td> <label for="name">菜单名称：</label></td>
	  	              <td>
	  	              	  <input type="text" name="name" class="name" id="name" />
	  	              </td>
	  		      </tr>
	  		      <tr>
	  	              <td><label for="url">菜单URL：</label></td>
	  	              <td><input type="text" name="url" class="url" id="url" /></td>
	  		      </tr>
	  		      <tr>
	  	              <td><label for="isshow">是否展示：</label></td>
	  	              <td>
	  	              	<input type="radio" name="isshow" value="1"  id="isshow1"/>展示
						<input type="radio" name="isshow" value="0" id="isshow2" />不展示
					  </td>
	  		      </tr>
	  		      <tr>
	  	              <td><label for="parentid">父级菜单：</label></td>
	  	              <td>
	  	              	  <select name="parentid" id="parentid" class="easyui-combobox" style="width: 150px" ></select>
	  	              </td>
	  		      </tr>
	  		      <tr>
	  	              <td colspan="2">
	  	              	  <input type="submit" value="提交" class=""/>
	  	              </td>
	  		      </tr>
	          </table>
	      </form>
	  </div>
  </body>
</html>
