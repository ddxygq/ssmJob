<%@ page pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		
		<title>工人管理</title>

    	<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/icon.css">
		<script src="jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
    	
    	<style type="text/css">
			table, td, th {
				border: 1px solid pink;
				text-align : center;
			}
			
			td{width:200px;}
			
			th {
				background-color: #000;
				color: #fff;
			}
			
			div {
				float: left;
				margin: auto 1%;
			}
			
			div>div {
				float: none;
				margin: 10px 1%;
			}
			
			li {
				line-height: 20px;
			}
		</style>
    	
    	<script type="text/javascript">
    		
    	
    		$(function(){
    			var data = '${result}';
    			data = $.parseJSON(data);
    			showMyWorker(data);
    		});
    	
    		function showMyWorker(data){
    			var html = [];
    			html.push("<table>");
    			html.push("<tr><th>姓名</th><th>地址</th></tr>");
    			for (var i = 0; i < data.length; i++) {
    				html.push("<tr>");
    				html.push("<td>" + data[i].person_name + "</td>");
    				if(data[i].person_address){
    					html.push("<td>" + data[i].person_address + "</td>");
    				}else{
    					html.push("<td>" + "不详" + "</td>");
    				}
    				
    				// html.push("<td>" + "<input type='button' value='删除' onclick='deleteOrder(" + data[i].person_id + ")'></td>");
    				html.push("</tr>");
    			}
    			html.push("</table>");
    			myWorker = document.getElementById("myWorker");
    			myWorker.innerHTML = html.join("");
    		}
    			
    		// 屏幕宽度
			function fixWidth(percent) {
				return document.body.clientWidth * percent; //根据自身情况更改
			}
    	</script>
	</head>
		
	<body>
 		<h2>我的工人</h2>
 		<div id="myWorker" class="easyui-panel" data-options="title:'数据区',width:fixWidth(0.8),height:300">
 			
 		</div>
 		
 		
	</body>
</html>