package com.ddxygq.ssmdemo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ddxygq.ssmdemo.dao.PersonMapper;
import com.ddxygq.ssmdemo.pojo.Person;
import com.ddxygq.ssmdemo.pojo.Role;


@Service
@Transactional
public class PersonService {

	@Resource
	PersonMapper personMapper;
	
	/**
	 * 根据账号和密码查询，判断用户个数是否为一个
	 * @param person_account
	 * @param person_pwd
	 * @return
	 */
	public Map<String, String> queryPersonByPwd(Map<String,String> map) {
		return personMapper.queryPersonByPwd(map);
		
	}
	
	/**
	 * 处理的用户信息并插入
	 * @param person
	 * @return
	 */
	public boolean insertPerson(Person person) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("person_account", person.getPerson_account());
		int count = personMapper.queryPersonByAccount(person.getPerson_account()).size();
		if(count!=0) {
			return false;
		}
		person.setPerson_id(UUID.randomUUID().toString());
		person.setPerson_flag("1");
		personMapper.insertPerson(person);
		return true;
	}
	
	/**
	 * 查询用户类型列表
	 * @return
	 */
	public List<Role> queryRole() {
		List<Role> list = personMapper.queryRole();
		if(list.size()==0) {
			return null;
		}
		return list;
	}
	
	// 工头查询所有工人
	public List<Map<String, Object>> queryPerson(Map<String, Object> map){
		return personMapper.queryPerson(map);
	}
	
	// 查询没有加入工头的工人
	public List<Map<String,Object>> queryWorker(Map<String, Object> map){
		return personMapper.queryWorker(map);
	}
	
	public int queryPersonCount(String person_head){
		return personMapper.queryPersonCount(person_head);
	}
	
	public int queryWorkerCount(){
		return personMapper.queryWorkerCount();
	}
	
	// 删除工人
	public void deleteWorker(String person_id){
		personMapper.deleteWorker(person_id);
	}
	
	public Map<String,Object> querySingle(Map<String,Object> map){
		return personMapper.querySingle(map);
	}
}
