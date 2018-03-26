$(function() {
	initDataGrid();
});

function initDataGrid() {
	var columns = [ [ {
		field : "person_name",
		title : "工头",
		width : 150,
		align : 'center',
		sortable : true
	},
		{
			field : "project_name",
			title : "项目名称",
			width : 150,
			align : 'center',
			sortable : true
		},
		{
			field : "project_targetdate",
			title : "开始时间",
			width : 150,
			align : 'center',
			sortable : true
		},
		{
			field : "project_duedate",
			title : "结束时间",
			width : 150,
			align : 'center',
			sortable : true
		},
		{
			field : "project_person",
			title : "项目所需人数",
			width : 150,
			align : 'center',
			sortable : true
		},
		{
			field : "person_head",
			title : "状态",
			width : 150,
			align : 'center',
			sortable : true,
			formatter : function(person_head, row, index) {
				if (person_head == null || person_head == "") {
					return "已退出";
				} else {
					return "未退出";
				}
			}
		}
	] ];


	var param = {};
	param.person_id = person_id;
	$("#dg").datagrid({
		title : "我的队伍:",
		singleSelect : true,
		pagination : true,
		queryParams : param,
		url : "queryMyOrders.do",
		columns : columns,
		toolbar : [ {
			iconCls : "icon-cancel",
			text : "退出此队伍",
			width : 150,
			handler : initAddDialog
		},
			{
				iconCls : "icon-cancel",
				text : "退出",
				width : 150,
				handler : initExit
			} ]
	});
}


function initAddDialog() {
	var row = $("#dg").datagrid("getSelected");
	if (!row) {
		$.messager.alert("提示", "请选择您要退出的队伍", "info");
		return;
	}

	var param = {};
	param.person_id = person_id;
	$.ajax({
		url : "updateMyTeam.do",
		type : "post",
		data : param,
		success : function(data) {
			var obj = $.parseJSON(data);
			if (obj.result) {
				$.messager.alert("消息", "您已退出" + row.person_name + "的队伍", "info", function() {
					$("#dg").datagrid("reload");

					$.ajax({
						url : "updateInvite1.do",
						type : "post",
						data : param,
						success : function(data) {
							var obj = $.parseJSON(data);
						}
					});
				});
			} else {
				$.messager.alert("消息", "退出失败", "info");
			}
		}
	});
}

function initExit() {
	window.location.href = "jsp/cyh/worker.jsp";
}