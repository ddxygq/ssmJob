package com.ddxygq.ssmdemo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ddxygq.ssmdemo.dao.WorkerMapper;
import com.ddxygq.ssmdemo.pojo.Invite;
import com.ddxygq.ssmdemo.pojo.Person;
import com.ddxygq.ssmdemo.pojo.Project;

@Service
@Transactional
public class WorkerService {
	@Resource
	private WorkerMapper workerMapper;
	public Map<String, Object> queryMyInvite(int currentPage,int pageSize,String person_id){
			Map<String,Object> pageMap = new HashMap<String,Object>();
			int start = currentPage * pageSize - pageSize;
			pageMap.put("start", start);
			pageMap.put("pageSize", pageSize);
			pageMap.put("invite_worker", person_id);
			
			List<Project> rows=workerMapper.queryMyInvite(pageMap);
			int total = workerMapper.queryInviteCount();
			Map<String,Object> data = new HashMap<String, Object>();
			data.put("total", total);
			data.put("rows", rows);
			return data;		
		}
	
	public boolean updateInvite(String person_id,String invite_order){	
		Invite invite = new Invite();
		invite.setInvite_worker(person_id);
		invite.setInvite_order(invite_order);
		workerMapper.updateInvite(invite);
		return true;
	}

	public Map<String, Object> queryMyOrders(int currentPage,int pageSize,String person_id){
		Map<String,Object> pageMap = new HashMap<String,Object>();
		int start = currentPage * pageSize - pageSize;
		pageMap.put("start", start);
		pageMap.put("pageSize", pageSize);
		pageMap.put("invite_worker", person_id);
		
		List<Project> rows=workerMapper.queryMyOrders(pageMap);
		int total = workerMapper.queryInviteCount();
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("total", total);
		data.put("rows", rows);
		return data;		
	}

	public boolean updateMyTeam(String person_id){	
		Person person = new Person();
		person.setPerson_id(person_id);
		workerMapper.updateMyTeam(person);
		return true;
	}
	
	public boolean updateInvite1(String person_id){	
		workerMapper.updateInvite1(person_id);
		return true;
	}
	
	public boolean updatePerson(String person_id){	
		workerMapper.updatePerson(person_id);
		return true;
	}
	
	public String queryPersonHead(String person_id){
		return workerMapper.queryPersonHead(person_id);
	}
}
