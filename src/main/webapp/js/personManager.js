var page; // 总页数
var len; // 总长度
var curPage = 1;
var curPage2 = 1;
var page2 = 1;
var len2;

var param = {};
var param2 = {};

param.curPage = curPage;
param2.curPage2 = curPage2;

param2.person_id = person_head; // 传入我（即工头）的id

$(function() {
	initBut();

	showPage();
	myOrders();

	dataCount();
	dataCount2();

	// 上一页
	$('#lastPage').click(function() {
		if (curPage > 1) {
			curPage = curPage - 1;
		} else {
			alert("已经是第一页");
			return;
		}
		param.curPage = curPage;
		showPage();
		pageIfExist();
		$('#nextPage').attr("disabled", false);
	});

	// 下一页
	$('#nextPage').click(function() {
		if (curPage < page) {
			curPage = curPage + 1;
		} else {
			alert("已是最后一页");
			return;
		}
		param.curPage = curPage;
		showPage();
		pageIfExist();
		$('#lastPage').attr("disabled", false);
	});

	// 固定某一页
	$("#nPage").click(function() {
		var nPage = parseInt(document.getElementById("curPage").value);
		if (nPage < 0) {
			return;
		}

		if (nPage > page) {
			return;
		}
		curPage = nPage;
		param.curPage = curPage;
		showPage();
		pageIfExist();
	});

	// 过滤没有加入工头的工人
	$('#filter').click(function() {
		initBut();
		curPage = 1;
		param.curPage = curPage;
		param.filter = '1';
		dataCount();
		showPage();
		pageIfExist();
	});

	// 所有工人，刚进入页面
	$('#init').click(function() {

		location.reload();
	});

	$('#myWorker').click(function() {
		initBut();
		param.filter = '2';
		curPage = 1;
		param.curPage = curPage;
		param.person_head = person_head; //TODO
		dataCount();
		showPage();
		pageIfExist();
	});
	
	

});

function initBut() {
	$('#lastPage').attr("disabled", true);
	$('#nextPage').attr("disabled", false);
	$('#lastPage2').attr("disabled", true);
	$('#nextPage2').attr("disabled", false);
}

// 显示所有工人
function showPerson(data) {
	$('#curPage').val(curPage);
	var html = [];
	html.push("<table>");
	html.push("<tr><th>姓名</th><th>住址</th><th>联系方式</th></tr>");
	for (var i = 0; i < data.length; i++) {
		html.push("<tr>");
		html.push("<td>" + data[i].person_name + "</td>");
		var address = data[i].person_address;
		if(address){
			html.push("<td>" + address + "</td>");
		}else{
			html.push("<td>" + '不详' + "</td>");
		}
		
		html.push("<td>" + data[i].person_account + "</td>");
		html.push("</tr>");
	}
	html.push("</table>");
	var personDiv = document.getElementById("personDiv");
	personDiv.innerHTML = html.join("");
}

// 显示没有加入工头的工人
function showPerson2(data) {
	$('#curPage').val(curPage);
	var html = [];
	html.push("<table>");
	html.push("<tr><th>姓名</th><th>操作</th></tr>");
	for (var i = 0; i < data.length; i++) {
		html.push("<tr>");
		html.push("<td>" + data[i].person_name + "</td>");
		html.push("<td>" + "<input class='but' name='but' type='button' value='邀请' onclick='invite(" + data[i].person_id + "," + i + ")'></td>");
		html.push("</tr>");
	}
	html.push("</table>");
	personDiv = document.getElementById("personDiv");
	personDiv.innerHTML = html.join("");
}

// 显示我的工人
function showPerson3(data) {
	$('#curPage').val(curPage);
	var html = [];
	html.push("<table>");
	html.push("<tr><th>姓名</th><th>操作</th></tr>");
	for (var i = 0; i < data.length; i++) {
		html.push("<tr>");
		html.push("<td>" + data[i].person_name + "</td>");
		html.push("<td>" + "<input class='but' type='button' value='删除' onclick='deleteWorker(" + data[i].person_id + ")'></td>");
		html.push("</tr>");
	}
	html.push("</table>");
	personDiv = document.getElementById("personDiv");
	personDiv.innerHTML = html.join("");
}

// 删除我的工人
function deleteWorker(person_id) {
	var param2 = {};
	param2.person_id = person_id;
	if (confirm("确定删除吗？")) {
		$.ajax({
			url : "deleteWorker.do",
			data : param2,
			type : "post",
			success : function(data) {
				data = $.parseJSON(data);
				if (data.result) {
					alert("删除成功");
					location.reload();
				}
			},
			error : function() {
				alert("删除失败");
			}
		});
	}

}

// 邀请工人
function invite(data, index) {
	var inviteInfo = '{"invite_worker":' + data
		+ ',"invite_order":1,"invite_flag":1,"invite_head":' + person_head + '}';
	$.ajax({
		url : "addInvite.do",
		type : "post",
		data : inviteInfo,
		contentType : "application/json",
		success : function(data) {
			data = $.parseJSON(data);
			if (data.result) {
				alert("发送邀请成功");
			} else {
				alert("抱歉：不能重复邀请");
			}

		},
		error : function() {
			alert("请求失败！");
		}
	});

	var buts = document.getElementsByName("but");
	buts[index].disabled = true;
}

// 数据总数
function dataCount() {
	$.ajax({
		url : "personCount.do",
		data : param,
		async : false,
		success : function(data) {
			page = data;
			$("#page").val(page);
		}
	});
}

// 用于判断是否是第一页 / 最后一页
function pageIfExist() {
	if (curPage <= 1) {
		$('#lastPage').attr("disabled", true);
	} else {
		$('#lastPage').attr("disabled", false);
	}

	if (curPage >= page) {
		$('#nextPage').attr("disabled", true);
	} else {
		$('#nextPage').attr("disabled", false);
	}
}

// 查询工人
function showPage() {
	$.ajax({
		url : "personAll.do",
		data : param,
		success : function(data) {
			if (param.filter == '1') {
				showPerson2(data);
			} else if (param.filter == '2') {
				showPerson3(data);
			} else {
				showPerson(data);
			}
		},
		error : function() {
			alert("请求失败！");
		}
	});
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 查询订单
function queryOrders(){
	$.ajax({
		url : "queryOrders.do",
		data : param2,
		type : "post",
		success : function(data) {
			if(param2.flag == '1'){
				showMyOrders(data);
			}else{
				showCanOrders(data);
			}
			
			pageIfExist2();
			
		},
		error : function() {
			alert("加载失败");
		}
	});
}
// -------------------------------------------------------------------------------------------
// 我是工头，我的订单
function myOrders() {
	param2.flag = '1'; // 我的订单功能,标记
	curPage2 = 1;
	param2.curPage2 = curPage2;
	queryOrders();
}

// 我的订单
function showMyOrders(data) {
	$('#curPage2').val(curPage2);
	var html = [];
	html.push("<table>");
	html.push("<tr><th>编号</th><th>所属工程</th><th>开始时间</th><th>结束时间</th><th>实际结束时间</th><th>发布农户</th><th>人数</th><th>需要人数</th><th>操作</th><th>备注</th></tr>");
	for (var i = 0; i < data.length; i++) {
		var flag_ = data[i].header_flag;
		/*if(flag_ == '1'){
			html.push("<tr style='background-color : #666;'>");
		}else if(flag_ == '2'){
			html.push("<tr>");
		}else{
			html.push("<tr style='background-color : #05f;'>");
		}*/
		html.push("<tr>");
		html.push("<td>" + (i + 1 + 5*(curPage2 - 1)) + "</td>");
		html.push("<td>" + data[i].project_name + "</td>");
		html.push("<td>" + data[i].order_starttime + "</td>");
		html.push("<td>" + data[i].order_endtime + "</td>");
		var trueendtime = data[i].trueendtime;
		if(trueendtime){
			html.push("<td>" + trueendtime + "</td>");
		}else{
			html.push("<td>" + '不详' + "</td>");
		}
		
		html.push("<td>" + data[i].person_name + "</td>");
		html.push("<td>" + data[i].person_number + "</td>");
		html.push("<td>" + data[i].need_number + "</td>");
		html.push("<td>" + "<a href='myWorker.do?order_id=" + data[i].order_id + "&person_id=" + person_head + "'>订单详情</a></td>" );
		if(flag_ == '1'){
			html.push("<td style='background-color : #05a;'>" + '审核中' + "</td>");
		}else if(flag_ == '2'){
			html.push("<td>" + '审核通过' + "</td>");
		}else{
			html.push("<td style='background-color : #666;'>" + '已失效' + "</td>");
		}
		html.push("</tr>");
	}
	html.push("</table>");
	personDiv = document.getElementById("ordersDiv");
	personDiv.innerHTML = html.join("");
}
// ----------------------------------------------------------------------------------------------
//订单总数
function dataCount2() {
	$.ajax({
		url : "OrdersCount.do",
		data : param2,
		async : false,
		success : function(data) {
			page2 = data;
			$("#page2").val(page2);
		},
		error : function(){
			location.href = '/ssmdemo/jsp/commonJsp/ajaxError.jsp';
		}
	});

}
// ----------------------------------------------------------------------------------------------
//点击可接订单
function canorders(){
	curPage2 = 1;
	param2.curPage2 = curPage2;
	param2.flag = '2';
	queryOrders();
	
}

// 可接订单
function showCanOrders(data){
	var html = [];
	html.push("<table>");
	html.push("<tr><th>编号</th><th>所属工程</th><th>开始时间</th><th>结束时间</th><th>实际结束时间</th><th>发布农户</th><th>人数</th><th>需要人数</th><th colspan='2'>操作</th></tr>");
	for (var i = 0; i < data.length; i++) {
		html.push("<tr>");
		html.push("<td>" + (i + 1 + 5*(curPage2 - 1)) + "</td>");
		html.push("<td>" + data[i].project_name + "</td>");
		html.push("<td>" + data[i].order_starttime + "</td>");
		html.push("<td>" + data[i].order_endtime + "</td>");
		var trueendtime = data[i].trueendtime;
		if(trueendtime == ''){
			html.push("<td>" + trueendtime + "</td>");
		}else{
		 	html.push("<td>" + "未结束" + "</td>");
		}
		
		html.push("<td>" + data[i].person_name + "</td>");
		html.push("<td>" + data[i].person_number + "</td>");
		html.push("<td>" + data[i].need_number + "</td>");
		html.push("<td>" + "<input type='button' class='but' value='申请接单' onclick='askOrder(" + data[i].order_id + ")'></td>");
		html.push("</tr>");
	}
	html.push("</table>");
	personDiv = document.getElementById("ordersDiv");
	personDiv.innerHTML = html.join("");
}

// 申请订单
function askOrder(order_id){
	var askParam = '{"order_id":' + order_id + ',"person_id":' + person_head +'}';
	$.ajax({
		url : "askOrder.do",
		data : askParam,
		type : "post",
		contentType : "application/json",
		success : function(data){
			data = $.parseJSON(data);
			if(data.result){
				alert("申请成功，请等待管理员审核");
			}else{
				alert("你已经申请过该订单了哦，请耐心等待管理员审核");
			}
		},
		error : function(){
			location.href = '/ssmdemo/jsp/commonJsp/ajaxError.jsp';
		}
	});
	
}

// 用于判断是否是第一页 / 最后一页
function pageIfExist2() {
	if (curPage2 <= 1) {
		$('#lastPage2').attr("disabled", true);
	} else {
		$('#lastPage2').attr("disabled", false);
	}

	if (curPage2 >= page2) {
		$('#nextPage2').attr("disabled", true);
	} else {
		$('#nextPage2').attr("disabled", false);
	}
}


// 屏幕宽度
function fixWidth(percent) {
	return document.body.clientWidth * percent; //根据自身情况更改
}

// 上一页
function lastPage2(){
	
	if (curPage2 > 1) {
		curPage2 = curPage2 - 1;
	} else {
		alert("已经是第一页");
		return;
	}
	param2.curPage2 = curPage2;
	queryOrders();
	// pageIfExist2();
	$('#nextPage2').attr("disabled", false);
}

//下一页
function nextPage2(){
	
	if (curPage2 < page2) {
		curPage2 = curPage2 + 1;
	} else {
		alert("已是最后一页");
		return;
	}
	param2.curPage2 = curPage2;
	queryOrders();
	// pageIfExist2();
	$('#lastPage2').attr("disabled", false);
}