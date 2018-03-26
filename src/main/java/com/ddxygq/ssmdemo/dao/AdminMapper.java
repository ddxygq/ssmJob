package com.ddxygq.ssmdemo.dao;

import java.util.List;
import java.util.Map;

import com.ddxygq.ssmdemo.pojo.Person;

public interface AdminMapper {
	
	public List<Person> getAllPerson(Map<String, Integer> pageMap);
	
	public int getAllPersonCount();
	
	public List<Person> queryForFammer(Map<String,Object> map);
	public List<Person> queryForHead(Map<String,Object> map);
	public List<Person> queryForWorker(Map<String,Object> map);
	
	public boolean updatePwd(String person_id);
	
	public List<Person> queryForFlag();
	public List<Person> queryForFlag2();
	
	boolean updateFlag(String person_id);
	
	public List<Person> queryForLike(Map<String,Object> map);
}
