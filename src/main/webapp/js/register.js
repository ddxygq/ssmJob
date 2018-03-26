$(function() {
	loadRole();
}) 

function loadRole() {
	$.ajax({
		url:"queryRole.do",
		type:"post",
		success:function(data) {
			var html = [];
			for(var i=0;i<data.length;i++) {
				html.push("<option value='"+data[i].role_id+"' >"+data[i].role_name+"</option>");
			}
			$("#person_role").html(html.join(""));
		}
	});
}

function subRegister() {
	// var options=$("#person_role option:selected");
	var person_account = $('#person_account').val();
	if(person_account.length != 11){
		$.messager.alert("错误信息", "手机格式不合法", "info");
		return;
	}
	$("#register").form("submit",{
		url :"insertPerson.do",
		onSubmit :function(arg) {
			return $(this).form("validate");
		},
		success :function(data) {
			var obj = $.parseJSON(data);
			console.log(data);
			if(obj.result) {
				$.messager.alert("消息", "注册成功", "info", function() {
					location.href = '/ssmdemo/index.jsp';
				});
			} else {
				$.messager.alert("消息", "注册失败", "info");
			}
		}
	});
}

$.extend($.fn.validatebox.defaults.rules, {  
    equalTo: {
    	validator: function (value, param) {
    		var repwd = document.getElementById(param).value;
        	return value == repwd; 
        	},
        message: "密码不一致"
    }
}); 
