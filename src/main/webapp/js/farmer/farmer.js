
// 屏幕宽度
function fixWidth(percent) {
	return document.body.clientWidth * percent; //根据自身情况更改
}

function exit() {
	location.href = '/ssmdemo/index.jsp';
}

// 我的信息
function myInfo() {
	$('#errorInfo').hide();
	$('#projects').hide();
	$('#saveBut').hide();
	$('#myOrders').hide();
	var messages = document.getElementsByClassName('message');
	for (var i = 0; i < messages.length; i++) {
		messages[i].style.display = "";
		messages[i].getElementsByTagName("input")[0].setAttribute('readOnly', 'readOnly')
	}
}
// 修改信息
function modifyInfo() {
	$('#errorInfo').hide();
	$('#projects').hide();
	var messages = document.getElementsByClassName('message');
	for (var i = 0; i < messages.length; i++) {
		var inpu = messages[i].getElementsByTagName("input")[0];
		inpu.removeAttribute("readOnly");
	}
	$('#saveBut').show();
}

function saveBut(){
	var param = {};
	var error = [];
	param.person_id = person_id;
	person_account = $('#farmeraccount').val();
	person_name = $('#farmername').val();
	person_pwd = $('#farmerpasswd').val();
	farmerphone = $('#farmerphone').val();
	person_address = $('#farmeraddress').val();
	
	if(person_account){
		param.person_account = person_account;
	}else{
		error.push("账号");
	}
	
	if(person_name){
		param.person_name = person_name;
	}else{
		error.push("姓名");
	}
	
	if(person_pwd){
		param.person_pwd = person_pwd;
	}else{
		error.push("密码");
	}
	
	if(person_address){
		param.person_address = person_address;
	}
	
	// 显示错误信息
	if(error.length > 0){
		error.push("不能为空...")
		$('#errorInfo').show();
		$('#errorInfo').val(error.join(" , "));
	}
	
	$.ajax({
		url : 'farmerUpdatePerson.do',
		data : param,
		type : "post",
		success : function(data){
			data = $.parseJSON(data);
			if(data.result){
				alert('修改成功...');
				location.reload();
			}
		},
		error : function(){
			location.href = '/ssmdemo/jsp/commonJsp/ajaxError.jsp';
		}
	});
	
}

// 所有项目
function allProject() {
	$('#saveBut').hide();
	$('#myOrders').hide();
	$('#projectInfo').show();
	var messages = document.getElementsByClassName('message');
	for (var i = 0; i < messages.length; i++) {
		messages[i].style.display = "none";
	}

	$.ajax({
		url : "allProject.do",
		success : function(data) {
			var html = [];
			html.push("<table id='projects'>");
			html.push("<tr><th>编号</th><th>工程</th><th>创建时间</th><th>预计开始时间</th><th>预计结束时间</th><th>实际结束时间</th><th>创建者</th><th>状态</th><th>操作</th></tr>");
			for (var i = 0; i < data.length; i++) {
				html.push("<tr>");
				html.push("<td>" + i + "</td>");
				html.push("<td>" + data[i].project_name + "</td>");
				html.push("<td>" + data[i].project_createtime + "</td>");
				html.push("<td>" + data[i].project_targetdate + "</td>");
				html.push("<td>" + data[i].project_duedate + "</td>");
				var project_overdate = data[i].project_overdate;
				if(project_overdate){
					html.push("<td>" + project_overdate + "</td>");
				}else{
					html.push("<td>" + '不详' + "</td>");
				}
				html.push("<td>" + data[i].project_person + "</td>");
				var project_flag = data[i].project_flag;
				if(project_flag == '1'){
					html.push("<td>" + '未开始' + "</td>");
				}else if(project_flag == '2'){
					html.push("<td>" + '进行中' + "</td>");
				}else{
					html.push("<td>" + '已结束' + "</td>");
				}
				html.push("<td>" + "<input class='but' type='button' value='发布订单' onclick='addOrder(" + person_id + "," 
						+ data[i].project_id + "," +data[i].project_duedate + ")'></td>");
				html.push("</tr>");
			}
			html.push("</table>");

			var projectInfo = document.getElementById('projectInfo');
			
			projectInfo.innerHTML = html.join("");
		},
		error : function(){
			location.href = '/ssmdemo/jsp/commonJsp/ajaxError.jsp';
		}
	});
}

// 农户添加订单
function addOrder(person_id,project_id,project_duedate){
	location.href = '/ssmdemo/jsp/farmer/addOrder.jsp?person_id=' + person_id + "&project_id=" 
	+ project_id + "&project_duedate" + project_duedate;
}

// 查看发布的订单
function showMyOrders(){
	$('#myOrders').show();
	var param = {};
	$('#saveBut').hide();
	$('#projectInfo').hide();
	var messages = document.getElementsByClassName('message');
	for (var i = 0; i < messages.length; i++) {
		messages[i].style.display = "none";
	}
	param.create_id = person_id;
	$.ajax({
		url : "showMyOrders.do",
		data : param,
		type : "post",
		success : function(data){
			var html = [];
			html.push("<table>");
			html.push("<tr><th>订单编号</th><th>工程</th><th>预计开始</th><th>预计结束</th><th>实际结束</th><th>人数</th><th>需要人数</th><th>发布者</th></tr>");
			for (var i = 0; i < data.length; i++) {
				html.push("<tr>");
				html.push("<td>" + (i + 1) + "</td>");
				html.push("<td>" + data[i].project_name + "</td>");
				html.push("<td>" + data[i].order_starttime + "</td>");
				html.push("<td>" + data[i].order_endtime + "</td>");
				var trueendtime = data[i].trueendtime;
				if(trueendtime){
					html.push("<td>" + trueendtime + "</td>");
				}else{
					html.push("<td>" + '不详' + "</td>");
				}
				html.push("<td>" + data[i].person_number + "</td>");
				html.push("<td>" + data[i].need_number + "</td>");
				html.push("<td>" + data[i].person_name + "</td>");
				html.push("</tr>");
			}
			html.push("</table>");
			document.getElementById("myOrders").innerHTML = html.join("");
		},
		error : function(){
			location.href = '/ssmdemo/jsp/commonJsp/ajaxError.jsp';
		}
		
	});
}