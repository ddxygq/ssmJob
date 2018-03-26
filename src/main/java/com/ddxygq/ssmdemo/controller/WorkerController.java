package com.ddxygq.ssmdemo.controller;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddxygq.ssmdemo.service.PersonService;
import com.ddxygq.ssmdemo.service.WorkerService;

@Controller
public class WorkerController {

	@Resource
	WorkerService workerService;
	@Resource
	PersonService personSevice;

	@RequestMapping("/queryMyInvite.do")
	@ResponseBody
	public Map<String, Object> queryMyInvite(int page,int rows,String person_id){
		Map<String, Object> result = workerService.queryMyInvite(page, rows,person_id);
		System.out.println(result);
		return result;
		
	}

	@RequestMapping("/updateInvite.do")
	@ResponseBody
	public String updateInvite(String person_id,String invite_order){
		boolean flag=workerService.updateInvite(person_id,invite_order);
		return "{\"result\": "+flag+" }";
	}
	
	@RequestMapping("/queryMyOrders.do")
	@ResponseBody
	public Map<String, Object> queryMyOrders(int page,int rows,String person_id){
		Map<String, Object> map=workerService.queryMyOrders(page, rows,person_id);
		if(map.isEmpty()){
			map.put("msg", "您目前还没有任何订单！");			
		}
			return map;		
	}

	@RequestMapping("/updateMyTeam.do")
	@ResponseBody
	public String updateMyTeam(String person_id){
		boolean flag=workerService.updateMyTeam(person_id);
		return "{\"result\": "+flag+" }";
	}
	
	@RequestMapping("/updateInvite1.do")
	@ResponseBody
	public String updateInvite1(String person_id){
		boolean flag=workerService.updateInvite1(person_id);
		return "{\"result\": "+flag+" }";
	}
	
	@RequestMapping("/updatePerson.do")
	@ResponseBody
	public String updatePerson(String person_id){
		boolean flag=workerService.updatePerson(person_id);
		return "{\"result\": "+flag+" }";
	}
	
	@RequestMapping("/queryPersonHead.do")   
	@ResponseBody
	public String queryPersonHead(String person_id){
		return workerService.queryPersonHead(person_id);
	}
}