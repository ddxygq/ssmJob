package com.ddxygq.ssmdemo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddxygq.ssmdemo.bean.CommonParam;
import com.ddxygq.ssmdemo.service.PersonService;


@Controller
public class PersonController {
	
	private final Logger logger = LogManager.getLogger("PersonController");
	
	@Resource
	private PersonService personService;
	
	/**
	 * 工头查询所有工人
	 * @param req
	 * @return 工人列表
	 */
	@RequestMapping("/personAll.do")
	@ResponseBody
	public List<Map<String, Object>> personAll(HttpServletRequest req){
		String filter = req.getParameter("filter");
		int startData = (Integer.valueOf(req.getParameter("curPage")) - 1) * CommonParam.pageSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("person_head", req.getParameter("person_head"));
		map.put("startData", startData);
		map.put("pageSize", CommonParam.pageSize);
		if("1".equals(filter)){
			return personService.queryWorker(map);
		}else{
			return personService.queryPerson(map);
		}
	}
	
	@RequestMapping("/personCount.do")
	@ResponseBody
	public int personCount(HttpServletRequest req){
		Map<String, String> map = new HashMap<String, String>();
		String filter = req.getParameter("filter");
		int len = "1".equals(filter) ? personService.queryWorkerCount() : personService.queryPersonCount(req.getParameter("person_head"));
		return len % CommonParam.pageSize == 0 ? len / CommonParam.pageSize : len / CommonParam.pageSize + 1;
	}
	
	
	@RequestMapping("/deleteWorker.do")
	@ResponseBody
	public String deleteWorker(HttpServletRequest req){
		String person_id = req.getParameter("person_id");
		personService.deleteWorker(person_id);
		System.out.println("删除用户：id = " + person_id);
		return "{\"result\":" + true +"}";
	}
	
	@RequestMapping("/querySingle.do")
	@ResponseBody
	public Map<String,Object> querySingle(@RequestParam Map<String,Object> map){
		return personService.querySingle(map);
	}
}
