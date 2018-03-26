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
			field : "project_flag",
			title : "项目状态",
			width : 150,
			align : 'center',
			sortable : true,
			formatter : function(project_flag, row, index) {
				if (project_flag == 1) {
					return "未开始";
				}
				if (project_flag == 2) {
					return "进行中";
				}
				if (project_flag == 3) {
					return "已结束";
				}
				if (project_flag == 4) {
					return "删除";
				}
			}
		}
	] ];
	var param = {};
	param.person_id = person_id;
	$("#dg").datagrid({
		title : "我的订单:",
		singleSelect : true,
		pagination : true,
		queryParams : param,
		url : "queryMyOrders.do",
		columns : columns,
				onLoadSuccess:function(data){
					var obj = $.parseJSON(data);
					if(obj.result){
						$.messager.alert("消息", "加入失败", "info");
					}else{
						
						$.messager.alert("消息", "加入失败", "info");
					}
					
						
					
				},
		toolbar : [ {
			iconCls : "icon-cancel",
			text : "退出",
			width : 150,
			handler : initExit
		} ]
	});
}

function initExit() {
	window.location.href = "jsp/cyh/worker.jsp";
}