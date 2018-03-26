<%@ page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

    	
		<script src="jquery-easyui-1.5.4/jquery.min.js"></script>
		
		<script src="/ssmdemo/js/cyh/update.js">
			var person_id = ${person_id};
			var param ={};
			param.person_id=person_id;
			
			$(function()
			{
				$.ajax({
					url : "querySingle.do",
					type : "post",
					data : param,
					success : function(data) 
					{
						alert('test');
						var obj = $.parseJSON(data);
						$("#person_name").val(obj.person_name);
						$("#person_account").val(obj.person_account);
						$("#person_pwd").val(obj.person_pwd);
						$("#person_address").val(obj.person_address);						
					},
					error : function() 
					{
						alert("未加载到数据");
					}
				});	
			
				$("#btnSave").click(function()
				{						
					var person_name = $("#person_name").val();
					var person_account = $("#person_account").val();
					var person_pwd = $("#person_pwd").val();
					var person_address = $("person_address").val();												
			
					var param = {};			  
					param.person_name = person_name;
					param.person_account = person_account;
					param.person_pwd = person_pwd;
					param.person_address = person_address;
					
						$.ajax({
						url : "updatePerson1.do",
						type : "post",
						data : param,
						success : function(data) 
						{
							var obj = $.parseJSON(data);
							if(obj.result)
							{
								alert("修改成功");
								location.href = "/jsp/cyh/worker.jsp";
							}
							else
							{
								alert("修改失败");
							}
						}						
					});				
				});			
			});			
		</script>
	</head>
  
	<body >
	<fieldset style="border:2px solid gray;height:645px;width:1375px;">
	<legend><b>修改个人信息</b></legend>
	            用户名：<input type="text" id="person_name" readonly="readonly"/><br/><br/>
		账号：<input type="text" id="person_account"/><br/><br/>
		密码：<input type="text" id="person_pwd"/><br/><br/>
		地址：<input type="text" id="person_address"/><br/><br/>
			<input type="button" value="修改" id="btnSave"/>
	</fieldset>
	</body>
</html>

