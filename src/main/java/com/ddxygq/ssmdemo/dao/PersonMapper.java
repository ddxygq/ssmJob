package com.ddxygq.ssmdemo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ddxygq.ssmdemo.pojo.Person;
import com.ddxygq.ssmdemo.pojo.Role;

@Repository
public interface PersonMapper {

	//通过账号密码查询用户列表
	public Map<String, String> queryPersonByPwd(Map<String,String> map);
	
	// 按条件查询工人
	public List<Map<String, Object>> queryPerson(Map<String, Object> map);
	
	// 查询工人
	public List<Map<String,Object>> queryWorker(Map<String, Object> map);
	
	
	//通过账号查询用户列表
	public List<Person> queryPersonByAccount(String person_account);
	
	//查询用户总数
	public int queryPersonCount(String person_head);
	
	public int queryWorkerCount();
	
	//新增用户
	public boolean insertPerson(Person person);
	
	//修改用户
	public boolean updatePerson(Person person);
	
	//类型列表
	public List<Role> queryRole();
	
	// 删除工人
	public void deleteWorker(String person_id);
	
	// 单条
	public Map<String,Object> querySingle(Map<String,Object> map);
}
