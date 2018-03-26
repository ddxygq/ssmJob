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
    	
    	<script src="/ssmdemo/js/admin/adminIndex.js">
    	$(function() {
    	$("#selectPerson_account").click(function()
				{ 	var columns = [[{field : "person_id", title : "用户ID"},
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
					var person_account = $("#person_account").val()	
					
					var param={};
					param.person_account=person_account;
					$("#dg").datagrid({
						title: "查询结果:",
						singleSelect : true,
						pagination : true,
						queryParams:param,
						url : "queryForLike.do",
						columns : columns,		
						});

				});	
    	});
    	
    	</script>
	</head>
	<style>
#div2{
	border:5px solid #D1D1D1;
	border-radius:15px;
	width:90%;
	margin-top:10px;
	margin-left:auto;
	margin-right:auto;
	
}

#div3{
	border:5px solid #D1D1D1;
	border-radius:15px;
	width:90%;
	height:80%;
	margin-top:20px;
	margin-left:auto;
	margin-right:auto;
	padding-top:10px;
	
}
#menu{
	 border: 1px solid #D1D1D1; 
	 background:#C0C0C0;
	 border-radius:10px; 
	width:15%;
	height:80%;
	margin-left:20px;
	margin-right:20px;
	padding-top:10px;
	float:left;
	
}
#table{
	border:5px solid #D1D1D1;
	border-radius:15px;
	width:80%;
	height:98%;
	float:left;
	
}

#dg{
	width:80%;
	height:80%;
	margin-left:auto;
	margin-right:auto;
}
#h1{
	margin-left:20px;
}
</style>

<body>
	<div id="div1">
		<div id="div2">
			<h1 id="h1" style="color:#989898">用户登录信息页</h1>
		</div>

		<div id="div3">

			用户账号：<input type="txt" id="person_account"> <input
				type="button" id="selectPerson_account" value="查询">
			<table id="dg"></table>

		</div>
	</div>
</body>
</html>