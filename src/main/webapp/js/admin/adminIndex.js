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
		title: "用户信息（所有）:",
		singleSelect : true,
		pagination : true,
		url : "getAllPerson.do",
		 fitColumns:true,//宽度自适应
		columns : columns,
		toolbar : [{
			iconCls : "icon-reload",
			text : "所有",
			handler : queryForAll
		},{
			iconCls : "icon-search",
			text : "雇主",
			handler : queryForFammer
		},{
			iconCls : "icon-search",
			text : "工头",
			handler : queryForHead
		},{
			iconCls : "icon-search",
			text : "工人",
			handler : queryForWorker
		},{
			iconCls : "icon-ok",
			text : "已审核",
			handler : queryForFlag2
		},{
			iconCls : "icon-no",
			text : "待审核",
			handler : queryForFlag
		},{
			iconCls : "icon-edit",
			text : "重置密码",
			handler : updatePwd
		},{
			iconCls : "icon-back",
			text : "退出登录",
			handler : backToIndex
		}]		
	});
}

function queryForAll(){
	window.location.href="jsp/adminIndex.jsp";
	
}

function queryForFammer(){
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
	                {field : "person_address", title : "用户地址"}]];
	     $("#dg").datagrid({
	    title: "用户信息（雇主）:",
		singleSelect : true,
		pagination : true,
		url : "queryForFarmer.do",
		columns : columns,
	 });
}

function queryForHead(){
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
	                {field : "person_address", title : "用户地址"}]];
	    $("#dg").datagrid({
	    title: "用户信息（工头）:",
		singleSelect : true,
		pagination : true,
		url : "queryForHead.do",
		columns : columns,
	});
}

function queryForWorker(){
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
		title: "用户信息（工人）:",
		singleSelect : true,
		pagination : true,
		url : "queryForWorker.do",
		columns : columns,
	});
}

function queryForFlag2(){
	var columns = [[{field : "person_id", title : "用户ID"},
	                {field : "name1", title : "用户姓名"},
	                {field : "person_account", title : "用户账号"},
	                {field : "person_pwd", title : "用户密码"},
	                {field : "role_name", title : "用户角色"},
	                {field : "person_flag", title : "用户状态",
	                	formatter: function(person_flag,row,index){
	                		return "已审核";
	        			}
	                },
	                {field : "person_address", title : "用户地址"},
				     {field : "name2", title : "所属工头"}]];
	$("#dg").datagrid({
		title: "用户信息（已审核）:",
		singleSelect : true,
		pagination : true,
		url : "queryForFlag2.do",
		columns : columns,
	});
}

function updatePwd(){
	var row = $("#dg").datagrid("getSelected");	
	if(!row)
	{
		$.messager.alert("提示", "请选择需要重置密码项", "info");
		return;
	}
	$.messager.confirm("提示", "确认重置密码吗?", function(r) {
		if(r) {
			var postData = {};
			postData.person_id = row.person_id;
			$.ajax({
				url : "updatePwd.do",
				type :"post",
				data : postData,
				success : function(data) {
					var obj = $.parseJSON(data);
					if(obj.result) {
						$.messager.alert("消息", "密码重置成功", "info", function() {
							$("#dg").datagrid("reload");
						});
					} else {
						$.messager.alert("消息", "密码重置失败", "info");
					}
				}
			});
		}
	});
}

function queryForFlag(){
	window.location.href="jsp/admin/adminTip.jsp";
}

function backToIndex(){
	window.location.href="/ssmdemo/index.jsp";
}

