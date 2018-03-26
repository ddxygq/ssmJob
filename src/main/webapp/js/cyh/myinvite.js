$(function() {
	initDataGrid();
});

function initDataGrid() {
	var columns = [ [ {
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
			field : "person_name",
			title : "邀请人",
			width : 150,
			align : 'center',
			sortable : true
		},
		{
			field : "project_person",
			title : "所需人数",
			width : 150,
			align : 'center',
			sortable : true
		},
		{
			field : "invite_order",
			title : "订单编号",
			hidden : "true",
			width : 150,
			align : 'center',
			sortable : true
		},
		{
			field : "invite_flag",
			title : "邀请状态",
			width : 150,
			align : 'center',
			sortable : true,
			formatter : function(invite_flag, row, index) {
				if (invite_flag == 1) {
					return "邀请中";
				} else {
					return "接受邀请";
				}
			}
		}
	] ];

	var param = {};
	param.person_id = person_id;

	$("#dg").datagrid({
		title : "我的邀请:",
		singleSelect : true,
		pagination : true,
		queryParams : param,
		url : "queryMyInvite.do",
		columns : columns,
		striped : true,
		toolbar : [ {
			iconCls : "icon-add",
			text : "同意",
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
		$.messager.alert("提示", "请选择您要加入的队伍", "info");
		return;
	}

	var param = {};
	param.person_id = person_id;
	$.ajax({
		url : "queryPersonHead.do",
		type : "post",
		data : param,
		success : function(data) {
			if (data == null || data == "") {
				var invite_order = row.invite_order;
				var param = {};
				param.person_id = person_id;
				param.invite_order = invite_order;
				$.ajax({
					url : "updateInvite.do",
					type : "post",
					data : param,
					success : function(data) {

						$.ajax({
							url : "updatePerson.do",
							type : "post",
							data : param,
							success : function(data) {
								var obj = $.parseJSON(data);
								if (obj.result) {
									$.messager.alert("消息", "您已加入" + row.person_name + "的队伍", "info", function() {
										$("#dg").datagrid("reload");
									});
								} else {
									$.messager.alert("消息", "加入失败", "info");
								}
							}
						});

					}
				});

			} else {
				$.messager.alert("消息", "不能重复添加", "info", function() {
					$("#dg").datagrid("reload");
				});

			}
		}
	});
}

function initExit() {
	window.location.href = "jsp/cyh/worker.jsp";
}