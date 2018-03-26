<%@ page pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="/ssmdemo/jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="/ssmdemo/jquery-easyui-1.5.4/themes/icon.css">
		<script src="/ssmdemo/jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="/ssmdemo/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="/ssmdemo/jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
		
		<script type="text/javascript">
			var person_id = '${param.person_id}';
			var project_id = '${param.project_id}';
			var project_duedate = '${param.project_duedate}';
		</script>
		
		<style type="text/css">
			@import url("<%=request.getContextPath()%>/css/button.css");
		
			div{
				width : 40%; 
				margin : 50px auto;
				padding : auto 30px;
			}
			
			.data {
				margin-left:auto;
				margin-right:auto;
				background: #F7F7F7;
				width : 260px;
				padding: 20px 10px 20px 10px;
				font: 15px Georgia, "Times New Roman", Times, serif;
				color: #888;
				text-shadow: 1px 1px 1px #FFF;
				border:1px solid #E4E4E4;
			}
			
		</style>
		
	</head>
  
	<body>
		<div>
			<h2>发布订单</h2><br>
			开始&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期&nbsp;&nbsp;<input class='data' type="date" id="order_starttime" value="2018-03-26"><br><br><br>
			结束&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日期&nbsp;&nbsp;<input class='data' type="date" id="order_endtime" value="2018-03-26"><br><br><br>
			实际结束日期&nbsp;&nbsp;<input class='data' type="date" id="trueendtime"><br><br><br>
			需要&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人数&nbsp;&nbsp;<input class='data' type="text" id="person_number" value="100">
			<br>
			<div><input class='but' type="button" onclick='addOrder()' value="发布"></div>
		</div>
		
		<script type="text/javascript">
			var now = new Date();
			var time = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
		
			var errorInfo = [];
			var order_starttime = document.getElementById("order_starttime").value;
			
			if(time < order_starttime){
				errorInfo.push("订单开始日期不能早于当前");
			}
			var order_endtime = document.getElementById("order_endtime").value;
			if(order_endtime > project_duedate){
				errorInfo.push("订单结束日期不能晚于项目结束日期");
			}
			var trueendtime = document.getElementById("trueendtime").value;
			var person_number = document.getElementById("person_number").value;
			function addOrder(){
				if(errorInfo.length > 1){
					alert(errorInfo.join("日期,"));
					return;
				}
				var param = {};
				param.create_id = person_id;
				param.order_project = project_id;
				param.order_starttime = order_starttime;
				param.order_endtime = order_endtime;
				// param.trueendtime = trueendtime;
				param.person_number = person_number;
				param.need_number = person_number;
				$.ajax({
					url : "addOrder.do",
					data : param,
					type : "post",
					success : function(data){
						data = $.parseJSON(data);
						if(data.result){
							alert('恭喜你,发布成功');
							 window.history.go(-1);
						}else{
							alert('发布延时');
						}
					},
					error : function(){
						location.href = '/ssmdemo/jsp/commonJsp/ajaxError.jsp';
					}
				});
			}
			
		</script>
	</body>
</html>