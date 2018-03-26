package com.ddxygq.ssmdemo.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ddxygq.ssmdemo.pojo.Invite;
import com.ddxygq.ssmdemo.service.InviteService;

@Controller
public class InviteController {
	
	@Resource
	private InviteService inviteService;
	
	/**
	 * 
	 * @param map
	 */
	
	@RequestMapping("/addInvite.do")
	@ResponseBody
	public String addInvite(@RequestBody Invite invite){
		boolean flag;
		flag = inviteService.queryInvite(invite) == null;
		if(flag){
			System.out.println("------------发送邀请----------------");
			System.out.println("邀请信息" + JSON.toJSONString(invite));
			inviteService.addInvite(invite);
			return "{\"result\":" + true + "}";
		}
		
		return "{\"result\":" + false + "}";
	}
	
}
