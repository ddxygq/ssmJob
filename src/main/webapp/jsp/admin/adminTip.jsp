<%@ page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户登录页</title>

    	<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/icon.css">
		<script src="jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
    	
    	<script>
    	$(function() {
	initDataGrid();	
});

function initDataGrid() {
	var columns = [[{field : "person_id", title : "用户ID"},
	                {field : "name1", title : "用户姓名"},
	                {field : "person_account", title : "用户账号"},
	                {field : "person_pwd", title : "用户密码"},
	                {field : "role_name", title : "用户角色"},
	                {field : "person_flag", title : "用户状态",
	                	formatter: function(person_flag,row,index){
	        				if (person_flag==1){
	        					return "待审核";
	        				} else if(person_flag==2) {
	        					return "已审核";
	        				}else{
	        					return "审核失败";
	        				}
	        			}
	                },
	                {field : "person_address", title : "用户地址"},
				     {field : "name2", title : "所属工头"}]];
	  
	$("#dg").datagrid({
		title: "用户审核:",
		singleSelect : true,
		pagination : true,
		url : "queryForFlag.do",
		columns : columns,
		 fitColumns:true,//宽度自适应
		toolbar : [{
			iconCls : "icon-back",
			text : "返回",
			handler : backAdmin
		},{
			iconCls : "icon-tip",
			text : "审核",
			handler : updateFlag
		}]	
		
	});
}
function updateFlag(){
	var row = $("#dg").datagrid("getSelected");	
	if(!row)
	{
		$.messager.alert("提示", "请选择需要审核用户项", "info");
		return;
	}
	$.messager.confirm("提示", "该用户审核是否通过?", function(r) {
			if(r) {
			var postData = {};
			postData.person_id = row.person_id;
			$.ajax({
				url : "updateFlag.do",
				type :"post",
				data : postData,
				success : function(data) {
					var obj = $.parseJSON(data);
					if(obj.result) {
						$.messager.alert("消息", "审核成功", "info", function() {
							$("#dg").datagrid("reload");
						});
					} else {
						$.messager.alert("消息", "审核失败", "info");
					}
				}
			});
		}
	});
}
function backAdmin(){
	window.location.href="jsp/adminIndex.jsp";

}
    	
    	</script>
	</head>
	
	<body>
		<table id="dg"></table>
	</body>
</html>